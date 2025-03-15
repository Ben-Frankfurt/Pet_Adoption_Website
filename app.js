const express = require('express');
const app = express()
const port = 3001;
const sqlHendler = require('./sqlHendler.js')
app.use(express.static('public'));
app.use(express.json());
const path = require('path');
const { log } = require('console');

app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'view'));


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

app.get('/serchSpecificAnimle', async (req, res) => {
    // /serchSpecificAnimle?type=cat&race=beagle&min_age=1&max_age=99
    const max_age = req.query.max_age;
    const min_age = req.query.min_age;
    const type = req.query.type;
    const race = req.query.race;
    const gender = req.query.gender;


    console.log(max_age, min_age, race, type, gender);

    try {
        const SpecificAnimle = await sqlHendler.getSpecificAnimle(max_age, min_age, race, type, gender);
        console.log(SpecificAnimle);

        res.json(SpecificAnimle);
    }
    catch (error) {
        console.error('Error:', error);
        res.status(500).send({ error: 'Faild to fetch order counts.' });
    }
})

app.route('/getFullCard').get(async (req, res) => {
    // /serchSpecificAnimle?type=cat&race=beagle&min_age=1&max_age=99
    const pet_id = req.query.pet_id;



    console.log(pet_id);

    try {
        const petArray = await sqlHendler.getFullCard(pet_id);
        const pet = petArray[0];
        console.log(pet);

        const html = `<!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Document</title>
                    <link rel="stylesheet" href="index.css">
                </head>

                <body>
                    <div id="topPage">
                        <div id="logoSection">Logo</div>
                        <div id="menuSection">

                            <div class="navBar">navBar</div>
                        </div>
                    </div>

                    <div class="petCard" id="${pet.id}">
                        <img src="${pet.pet_photo}"
                            alt="" id="cardImg">

                        <div class="deatailsPet">
                            <div id="titlePet">
                                <h2>${pet.pet_name}</h2>
                                <h3>${pet.pet_age} | ${pet.gender} | ${pet.type} | ${pet.race}</h3>
                            </div>
                            <div id="adoptionAplication">
                                <form action="" id="iputs">
                                    <input type="text" name="first_name" id="first_name" placeholder="First Name" class="cusInput">
                                    <input type="text" name="last_name" id="last_name" placeholder="Last Name" class="cusInput">
                                    <input type="email" name="customer_email" id="customer_email" placeholder="email@gmail.com"
                                        class="cusInput">
                                    <input type="tel" name="customer_mobile" id="customer_mobile" placeholder="xxx-xxx-xxxx"
                                        class="cusInput">
                                </form>
                                <button type="submit" onclick="setNewLied()">submit</button>
                            </div>
                        </div>
                    </div>
                    <script src="index.js"></script>
                </body>

                </html>`

        res.send(html);
    }
    catch (error) {
        console.error('Error:', error);
        res.status(500).send({ error: 'Faild to fetch order counts.' });
    }
})

app.route('/setNewLied').post(async (req, res) => {
    const first_name = req.body.first_name;
    const last_name = req.body.last_name;
    const customer_email = req.body.customer_email;
    const customer_mobile = req.body.customer_mobile;
    const pet_id = req.body.pet_id;


    try {
        const array_customer_id = await sqlHendler.setNewCustomer(first_name, last_name, customer_email, customer_mobile);
        const customer_id = array_customer_id[0]
        console.log(customer_id.id);
        const array_lide_id = await sqlHendler.setNewLide(customer_id.id, pet_id);
        const lide_id = array_lide_id[0]

        html = `<!DOCTYPE html>
                    <html lang="en">

                    <head>
                        <meta charset="UTF-8">
                        <meta name="viewport" content="width=device-width, initial-scale=1.0">
                        <title>Document</title>
                        <link rel="stylesheet" href="index.css">
                    </head>

                    <body>
                        <div id="topPage">
                            <div id="logoSection">Logo</div>
                            <div id="menuSection">
                            </div>
                        </div>
                        <div class="thankYouCard">
                            <h1>Thank you ${first_name}!</h1>
                            <hr>
                            <p>Thank you for submitting your details! We’ve received your request and will be in touch soon with more
                                information. We appreciate your support in giving a loving home to one of our pets.</p>
                            <button type="submit" onclick="goHome()">Go Home</button>
                        </div>


                        <script src="index.js"></script>
                    </body>

                    </html>`;
        res.send(html);



    } catch (error) {
        console.error('Error:', error);
        res.status(500).send({ error: 'Faild to fetch order counts.' });
    }



});


app.listen(port, () => {
    console.log(`Listening on port ${port}`);

})