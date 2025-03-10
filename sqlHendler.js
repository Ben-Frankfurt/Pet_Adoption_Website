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
module.exports.getAvilablePets = getAvilablePets;