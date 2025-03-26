const express = require('express');
const app = express()
const port = 3001;
const sqlHendler = require('./sqlHendler.js')
app.use(express.static('public'));
app.use(express.json());
const path = require('path');
const { log } = require('console');




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
    const gender = req.query.gender;


    console.log(max_age, min_age, type, gender);

    try {
        const SpecificAnimle = await sqlHendler.getSpecificAnimle(max_age, min_age, type, gender);
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
                        <div id="logoSection">
                            <h4>Ben's Adoption Center</h4>
                        </div>
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
                                <h3>${pet.pet_name} is a lovly ${pet.pet_age} ${pet.gender} ${pet.race} ${pet.type}</h3>
                                </div>
                            <div id="adoptionAplication">
                                <div id="adoptSlogen">
                                    <h5>You're Only a Few Steps Away from Meeting the Love of Your Life!</h5>
                                </div>
                                <form action="" id="iputs">
                                    <input type="text" name="first_name" id="first_name" placeholder="First Name" class="cusInput">
                                    <input type="text" name="last_name" id="last_name" placeholder="Last Name" class="cusInput">
                                    <input type="email" name="customer_email" id="customer_email" placeholder="email@gmail.com"
                                        class="cusInput">
                                    <input type="tel" name="customer_mobile" id="customer_mobile" placeholder="xxx-xxx-xxxx"
                                        class="cusInput">
                                </form>
                                <button id="adoptBotton" type="submit" onclick="setNewLied()">submit</button>
                            </div>
                        </div>
                    </div>
                    <script src="index.js"></script>
                    <script>
                        window.addEventListener('load', async () => {
                            let theNav = document.querySelector('.navBar');
                            theNav.innerHTML = '';
                            theNav.appendChild(createNavBar(arrForNav, 'Home'));

                            await availblepets()
                            giveFullCard();
                        });

                    </script>
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
                        <div class="wellcamContainer">
                            <div id="topPage">
                                <div id="logoSection">
                                    <!-- <img src="pet Adoption center -.png" alt="web site logo" class="logoImg"> -->
                                    <h4>Ben's Adoption Center</h4>
                                </div>
                                <div id="menuSection">

                                </div>
                            </div>
                            <div class="middleDiv">
                                <h1>One Step Closer to Your Forever Friend.</h1>
                            </div>
                            <div id="filterSection">
                                <div class="thankYouCard">
                                    <h1>Thank you ${first_name}!</h1>
                                    <hr>
                                    <p>Thank you for submitting your details! We’ve received your request and will be in touch soon with
                                        more
                                        information. We appreciate your support in giving a loving home to one of our pets.</p>
                                    <button id="adoptBotton" type="submit" onclick="goHome()">Go Home</button>
                                </div>
                            </div>
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

app.route('/emploeeysDashboard').get((req, res) => {
    res.sendFile(path.join(__dirname, 'private', 'emplossysDashboard.html'));
});

app.get('/getAllLides', async (req, res) => {
    try {
        const response = await sqlHendler.getAllLides();
        console.log(response);

        res.json(response)
    }
    catch (error) {
        console.error('Error:', error);
        res.status(500).send({ error: 'Faild to fetch order counts.' });
    }
});


app.route('/getFullLide').get(async (req, res) => {
    // /serchSpecificAnimle?type=cat&race=beagle&min_age=1&max_age=99
    const lide_id = req.query.lide_id;



    console.log(lide_id);

    try {
        const lideArray = await sqlHendler.getFullLide(lide_id);
        const lide = lideArray[0];
        console.log(lide);

        const html = `<!DOCTYPE html>
                        <html lang="en">

                        <head>
                            <meta charset="UTF-8">
                            <meta name="viewport" content="width=device-width, initial-scale=1.0">
                            <title>Document</title>
                            <link rel="stylesheet" href="index.css">
                            <link rel="stylesheet" href="emploeeysDahboard.css">
                        </head>

                        <body>
                            <div id="topPage">
                                <div id="logoSection">
                                    <h4>Ben's Adoption Center</h4>
                                </div>
                                <div id="menuSection">

                                <div class="navBar">navBar</div>
                            </div>
                            </div>

                            <div class="fullLideCard" id="${lide.id}">
                                <div class="fullLideCardTitle">
                                    <h2>Lide Details</h2>
                                </div>

                                <div class="lidePetDetails" id="${lide.pet_id}">
                                    <h2 class="subTitle">Pet Details</h2>
                                    <div class="liddtl">
                                        <h3>Pet Name: ${lide.name}</h3>
                                        <hr>
                                        <br>
                                        <h4>pet Age: ${lide.pet_age}</h4>
                                        <h4>pet Type: ${lide.pet_type}</h4>
                                        <h4>pet Race: ${lide.race}</h4>
                                    </div>
                                </div>
                                <div class="lideCustomerDetails" id="${lide.customer_id}">
                                    <h2 class="subTitle">Customer Details</h2>
                                    <div class="liddtl">
                                        <h3>Customer Name: ${lide.customer_first_name} ${lide.customer_last_name}</h3>
                                        <hr>
                                        <br>
                                        <h4>Customer Mobile Phone: ${lide.customer_phone}</h4>
                                        <h4>Customer Email: ${lide.email_address}</h4>
                                    </div>
                                </div>
                                <div class="buttonSection">
                                    <button class="buttonLide" onclick="deleteLide()">Delete Lide</button>
                                    <button class="buttonLide" onclick="petWasAdopted()">Pet Was Adopted</button>
                                </div>
                            </div>
                            <script src="emploeeysDashboard.js"></script>
                            <script src="index.js"></script>
                            <script>
                                window.addEventListener('load', async () => {
                                    let theNav = document.querySelector('.navBar');
                                    theNav.innerHTML = '';
                                    theNav.appendChild(createNavBar(arrForNav, 'Emploee Dashboard'));
                                    await allLides();
                                    giveFullLide()
                                });
                            </script>
                        </body>

                        </html>`

        res.send(html);
    }
    catch (error) {
        console.error('Error:', error);
        res.status(500).send({ error: 'Faild to fetch order counts.' });
    }
})

app.delete('/deleteLide', async (req, res) => {
    const lide_id = req.query.lide_id;
    console.log(lide_id);

    try {
        const response = await sqlHendler.deleteLide(lide_id);
        res.send(response)

    } catch (error) {
        console.error('Error:', error);
        res.status(500).send({ error: 'Faild to fetch order counts.' });
    }

})

app.put('/petWasAtopted', async (req, res) => {
    const pet_id = req.body.pet_id;
    const customer_id = req.body.customer_id;
    const lide_id = req.body.lide_id;

    console.log(pet_id, customer_id);

    try {
        const response = await sqlHendler.setNewAtoption(pet_id, customer_id);
        const response2 = await sqlHendler.deleteAllLidesForAdoptedPet(pet_id);
        const response3 = await sqlHendler.setAtoptionStatus(pet_id);
        res.status(200).send()

    } catch (error) {
        console.error('Error:', error);
        res.status(500).send({ error: 'Faild to fetch order counts.' });
    }

})

app.listen(port, () => {
    console.log(`Listening on port ${port}`);

})