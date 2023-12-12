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
}

export const deleteSql = {
    deleteClass: async (data) => {
        console.log('delete class class_id =', data);
        const sql = `delete from class where class_id=${data.class_id}`
        console.log(sql);
        await promisePool.query(sql);
    },
};

export const updateSql = {
    updateDoctor: async (data) => {
        console.log(data);
        const sql = `
            UPDATE Doctor 
            SET Doctor_ID = ${data.Doctor_ID}, Name = "${data.Name}", 
                Address = "${data.Address}", Phone_number = "${data.Phone_number}"
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
                Address = "${data.Address}", Phone_number = "${data.Phone_number}"
                Department_ID = "${data.Department_ID}"
            WHERE Nurse_ID = ${data.Nurse_ID}`;
        console.log(sql);
        await promisePool.query(sql);
    },
};