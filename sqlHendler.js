const sql = require('mssql');

const config = {
    user: "sa310",
    password: "1234",
    server: 'localhost',
    database: 'Pet_Adoptin',
    options: {
        encrypt: false, // for azure change to true
        trustServerCertificate: true // change to false for production
    }
};

async function getAvilablePets() {
    try {
        let pool = await sql.connect(config);
        let result = await pool.request()
            .execute('dbo.spGetAvailbePets');

        console.log(result.recordset);
        return result.recordset;
    }
    catch (error) {
        console.log(error);
        throw (error);
    }
    finally {
        sql.close()
    }
};

async function getSpecificAnimle(max_age, min_age, race, type, gender) {
    console.log(`Im sqlhendler.getSpecificAnimle, tryng to sent the next parameters ${max_age}, ${min_age}, ${race}, ${type}`);

    try {
        let pool = await sql.connect(config);
        let result = await pool.request()
            .input('min_age', sql.Int, min_age)
            .input('max_age', sql.Int, max_age)
            .input('race', sql.VARCHAR(50), race)
            .input('type', sql.VARCHAR(50), type)
            .input('gender', sql.VARCHAR(50), gender)
            .execute('dbo.spSerchSpecificAnimle');

        return result.recordset;
    }
    catch (error) {
        console.log(error);
        throw (error);
    }
    finally {
        sql.close()
    }
};

async function getFullCard(pet_id) {


    try {
        let pool = await sql.connect(config);
        let result = await pool.request()
            .input('pet_id', sql.Int, pet_id)
            .execute('dbo.spGetFullCard');

        console.log(result.recordset);
        return result.recordset;
    }
    catch (error) {
        console.log(error);
        throw (error);
    }
    finally {
        sql.close()
    }
};


async function setNewCustomer(first_name, last_name, email, customer_mobile) {
    console.log(`Im sqlhendler.getSpecificAnimle, tryng to sent the next parameters ${first_name}, ${last_name}, ${email}, ${customer_mobile}`);

    try {
        let pool = await sql.connect(config);
        let result = await pool.request()
            .input('customer_first_name', sql.NVARCHAR(50), first_name)
            .input('customer_last_name', sql.NVARCHAR(50), last_name)
            .input('customer_email_address', sql.NVARCHAR(50), email)
            .input('customer_mobile_phone', sql.NVARCHAR(50), customer_mobile)
            .execute('dbo.spInsertCustomerAndReturnCustomerId');

        return result.recordset;
    }
    catch (error) {
        console.log(error);
        throw (error);
    }
    finally {
        sql.close()
    }
};

async function setNewLide(customer_id, pet_id) {
    console.log(`Im sqlhendler.getSpecificAnimle, tryng to sent the next parameters ${customer_id}, ${pet_id}`);

    try {
        let pool = await sql.connect(config);
        let result = await pool.request()
            .input('customer_id', sql.Int, customer_id)
            .input('pet_id', sql.Int, pet_id)
            .execute('dbo.spInsertNewLideAndReturnLideId');

        return result.recordset;
    }
    catch (error) {
        console.log(error);
        throw (error);
    }
    finally {
        sql.close()
    }
};


module.exports.setNewLide = setNewLide;
module.exports.setNewCustomer = setNewCustomer;
module.exports.getSpecificAnimle = getSpecificAnimle;
module.exports.getAvilablePets = getAvilablePets;
module.exports.getFullCard = getFullCard;