import mysql from 'mysql2';

require("dotenv").config();

const pool = mysql.createPool({
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: '111111',
    database: 'project',
});

const promisePool = pool.promise();

export const selectSql = {
    getUser: async () => {
        const sql = `select * from user`;
        const [result] = await promisePool.query(sql);
        return result;
    },
    getDoctor: async () => {
        const sql = `select * from doctor`;
        const [result] = await promisePool.query(sql);
        return result;
    },
    getNurse: async () => {
        const sql = `select * from nurse`;
        const [result] = await promisePool.query(sql);
        return result;
    },
    getPatientId: async (userId) => {
        const sql = `select * from patient where patient.User_ID = "${userId}"`;
        const [result] = await promisePool.query(sql);
        return result;
    },
    getReservation: async (patientId) => {
        const sql = `select * from reservation where reservation.Patient_ID = ${patientId}`;
        const [result] = await promisePool.query(sql);
        return result;
    },
    getInpatient: async (patientId) => {
        const sql = `select * from inpatient where inpatient.Patient_ID = ${patientId}`;
        const [result] = await promisePool.query(sql);
        return result;
    },
    getPatient: async (searchCriteria) => {
        let sql = 'SELECT * FROM patient';
        let values = [];

        if (searchCriteria) {
            const conditions = [];
            for (const key in searchCriteria) {
                conditions.push(`${key} = ?`);
                values.push(searchCriteria[key]);
            }
            sql += ` WHERE ${conditions.join(' AND ')}`;
        }
    
        const [result] = await promisePool.query(sql, values);
        return result;
    },
    getExamination: async () => {
        const sql = `select * from examination`;
        const [result] = await promisePool.query(sql);
        return result;
    },
    getTreatment: async () => {
        const sql = `select * from treatment`;
        const [result] = await promisePool.query(sql);
        return result;
    },
    getMaxDoctorId: async () => {
        const sql = 'select max(Doctor_ID) as maxDoctorId from doctor';
        const [result] = await promisePool.query(sql);
        console.log('maxDoctorIdResult:', result);
        return result[0].maxDoctorId;
    },
    getMaxNurseId: async () => {
        const sql = 'select max(Nurse_ID) as maxNurseId from nurse';
        const [result] = await promisePool.query(sql);
        console.log('maxNurseIdResult:', result);
        return result[0].maxNurseId;
    },
    getMaxUserId: async () => {
        const sql = 'select max(User_ID) as maxUserId from user';
        const [result] = await promisePool.query(sql);
        console.log('maxUserIdResult:', result);
        return result[0].maxUserId;
    },
    getMaxExaminationNumber: async () => {
        const sql = 'select max(Examination_number) as maxExaminationNumber from examination';
        const [result] = await promisePool.query(sql);
        console.log('maxExaminationNumber:', result);
        return result[0].maxExaminationNumber;
    },
    getMaxTreatmentNumber: async () => {
        const sql = 'select max(Treatment_number) as maxTreatmentNumber from treatment';
        const [result] = await promisePool.query(sql);
        console.log('maxTreatmentNumber:', result);
        return result[0].maxTreatmentNumber;
    },
    getMaxReservationNumber: async () => {
        const sql = 'select max(Reservation_Number) as maxReservationNumber from reservation';
        const [result] = await promisePool.query(sql);
        console.log('maxReservationNumber:', result);
        return result[0].maxReservationNumber;
    },
    getMaxInpatientNumber: async () => {
        const sql = 'select max(Inpatient_Number) as maxInpatientNumber from inpatient';
        const [result] = await promisePool.query(sql);
        console.log('maxInpatientNumber:', result);
        return result[0].maxInpatientNumber;
    },
    getDoctorView: async () => {
        const sql = `SELECT * FROM DoctorNameAndDepartmentView`;
        const [result] = await promisePool.query(sql);
        return result;
    },
}

export const deleteSql = {
    deleteDoctor: async (data) => {
        const sql = `delete from doctor where Doctor_ID = ${data.Doctor_ID}`
        console.log(sql);
        await promisePool.query(sql);
    },
    deleteNurse: async (data) => {
        const sql = `delete from nurse where Nurse_ID = ${data.Nurse_ID}`
        console.log(sql);
        await promisePool.query(sql);
    },
    deleteExamination: async (data) => {
        const sql = `delete from examination where Examination_number = ${data.Examination_number}`
        console.log(sql);
        await promisePool.query(sql);
    },
    deleteTreatment: async (data) => {
        const sql = `delete from treatment where Treatment_number = ${data.Treatment_number}`
        console.log(sql);
        await promisePool.query(sql);
    },
    deleteReservation: async (data) => {
        const sql = `delete from reservation where Reservation_Number = ${data.Reservation_Number}`
        console.log(sql);
        await promisePool.query(sql);
    },
    deleteInpatient: async (data) => {
        const sql = `delete from inpatient where Inpatient_Number = ${data.Inpatient_Number}`
        console.log(sql);
        await promisePool.query(sql);
    },
};

// insert query
export const insertSql = {
    setDoctor: async (data) => {
        const maxDoctorId = await selectSql.getMaxDoctorId();
        const nextDoctorId = maxDoctorId + 1;
        const sql = `insert into doctor values (
            "${nextDoctorId}", "${data.Department_ID}", "${data.Name}", 
            "${data.Address}", "${data.Phone_number}", "${data.User_ID}"
        )`
        console.log(data);
        await promisePool.query(sql);
    },
    setNurse: async (data) => {
        const maxNurseId = await selectSql.getMaxNurseId();
        const nextNurseId = maxNurseId + 1;
        const sql = `insert into nurse values (
            "${nextNurseId}", "${data.Department_ID}", "${data.Name}", 
            "${data.Address}", "${data.Phone_number}", "${data.User_ID}"
        )`
        console.log(data);
        await promisePool.query(sql);
    },
    setUser: async (data) => {
        const maxUserId = await selectSql.getMaxUserId();
        const nextUserId = maxUserId + 1;

        const sql = `insert into user values (
            "${nextUserId}", "${data.ID}", "${data.Password}", "${data.Role}"
        )`
        console.log(data);
        await promisePool.query(sql);
    },
    setExamination: async (data) => {
        const maxExaminationNumber = await selectSql.getMaxExaminationNumber();
        const nextExaminationNumber = maxExaminationNumber + 1;

        const sql = `insert into examination values (
            "${nextExaminationNumber}", "${data.Examination_Date_Time}", "${data.Examination_Details}",
            "${data.Doctor_ID}", "${data.Patient_ID}"
        )`
        console.log(data);
        await promisePool.query(sql);
    },
    setTreatment: async (data) => {
        const maxTreatmentNumber = await selectSql.getMaxTreatmentNumber();
        const nextTreatmentNumber = maxTreatmentNumber + 1;

        const sql = `insert into treatment values (
            "${nextTreatmentNumber}", "${data.Treatment_Date_Time}", "${data.Treatment_Details}",
            "${data.Nurse_ID}", "${data.Patient_ID}"
        )`
        console.log(data);
        await promisePool.query(sql);
    },
    setReservation: async (data) => {
        const maxReservationNumber = await selectSql.getMaxReservationNumber();
        const nextReservationNumber = maxReservationNumber + 1;

        const sql = `insert into reservation values (
            "${nextReservationNumber}", "${data.Reservation_Date_Time}", "${data.Department_ID}",
            "${data.Patient_ID}"
        )`
        console.log(data);
        await promisePool.query(sql);
    },
    setInpatient: async (data) => {
        const maxInpatientNumber = await selectSql.getMaxInpatientNumber();
        const nextInpatientNumber = maxInpatientNumber + 1;

        const sql = `insert into inpatient values (
            "${nextInpatientNumber}", "${data.Patient_ID}", "${data.Room_Info}",
            "${data.Admission_Date}", "${data.Discharge_Date_Time}"
        )`
        console.log(data);
        await promisePool.query(sql);
    },
};

export const updateSql = {
    updateDoctor: async (data) => {
        console.log(data);
        const sql = `
            UPDATE Doctor 
            SET Doctor_ID = ${data.Doctor_ID}, Name = "${data.Name}", 
                Address = "${data.Address}", Phone_number = "${data.Phone_number}",
                Department_ID = "${data.Department_ID}"
            WHERE Doctor_ID = ${data.Doctor_ID}`;
        console.log(sql);
        await promisePool.query(sql);
    },
    updateNurse: async (data) => {
        console.log(data);
        const sql = `
            UPDATE Nurse
            SET Nurse_ID = ${data.Nurse_ID}, Name = "${data.Name}", 
                Address = "${data.Address}", Phone_number = "${data.Phone_number}",
                Department_ID = "${data.Department_ID}"
            WHERE Nurse_ID = ${data.Nurse_ID}`;
        console.log(sql);
        await promisePool.query(sql);
    },
    updateExamination: async (data) => {
        console.log(data);
        const sql = `
            UPDATE Examination
            SET 
                Examination_Date_Time = "${data.Examination_Date_Time}", 
                Examination_Details = "${data.Examination_Details}", 
                Doctor_ID = "${data.Doctor_ID}", 
                Patient_ID = "${data.Patient_ID}"
            WHERE Examination_number = "${data.Examination_number}"`;
        console.log(sql);
        await promisePool.query(sql);
    },
    updateTreatment: async (data) => {
        console.log(data);
        const sql = `
            UPDATE Treatment
            SET 
                Treatment_Date_Time = "${data.Treatment_Date_Time}", 
                Treatment_Details = "${data.Treatment_Details}", 
                Nurse_ID = "${data.Nurse_ID}", 
                Patient_ID = "${data.Patient_ID}"
            WHERE Treatment_number = "${data.Treatment_number}"`;
        console.log(sql);
        await promisePool.query(sql);
    },
};

export const beginTransaction = async () => {
    try {
        await promisePool.query('START TRANSACTION');
    } catch (error) {
        console.error('트랜잭션 시작 중 에러 발생', error);
        throw error;
    }
};

export const commit = async () => {
    try {
        await promisePool.query('COMMIT');
    } catch (error) {
        console.error('커밋 실패', error);
        throw error;
    }
};

export const rollback = async () => {
    try {
        await promisePool.query('ROLLBACK');
    } catch (error) {
        console.error('롤백 실패:', error);
        throw error;
    }
};