const express = require('express');
const app = express()
const port = 3001;
const sqlHendler = require('./sqlHendler.js')
app.use(express.static('public'));



app.get('/AvilablePets', async (req, res) => {

    try {
        const AvilablePets = await sqlHendler.getAvilablePets();
        res.json(AvilablePets);
    }
    catch (error) {
        console.error('Error:', error);
        res.status(500).send({ error: 'Faild to fetch order counts.' });
    }
});


app.listen(port, () => {
    console.log(`Listening on port ${port}`);

})