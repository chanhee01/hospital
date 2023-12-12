import express from 'express';
import { selectSql } from '../database/sql';

const router = express.Router();

router.get('/', async (req, res) => {
    if (req.session.user == undefined || (req.session.user.role !== 'doctor' && req.session.user.role !== 'nurse')) {
        res.redirect('/');
    } else {
        res.render('selectPatient', {
            main_title: "Select Patient",
        });
    }
});

router.post('/', async (req, res) => {
    const { searchType, searchTerm } = req.body;

    let searchCriteria;
    switch (searchType) {
        case 'name':
            searchCriteria = { Name: searchTerm };
            break;
        case 'gender':
            searchCriteria = { Gender: searchTerm };
            break;
        case 'bloodType':
            searchCriteria = { Blood_Type: searchTerm };
            break;
        case 'heightWeight':
            searchCriteria = {
                Height: { $gte: searchTerm.minHeight, $lte: searchTerm.maxHeight },
                Weight: { $gte: searchTerm.minWeight, $lte: searchTerm.maxWeight }
            };
            break;
        case 'phoneNumber':
            searchCriteria = { Phone_Number: searchTerm };
            break;
        case 'address':
            searchCriteria = { Address: searchTerm };
            break;
        case 'ssn':
            searchCriteria = { SSN: searchTerm };
            break;
        case 'doctorId':
            searchCriteria = { Doctor_ID: searchTerm };
            break;
        case 'nurseId':
            searchCriteria = { Nurse_ID: searchTerm };
            break;
        default:
            return res.status(400).send('Invalid search type');
    }

    const patient_res = await selectSql.getPatient(searchCriteria);

    res.render('selectPatientResult', {
        main_title: "Patient Search Result",
        patient_res,
    });
});

module.exports = router;