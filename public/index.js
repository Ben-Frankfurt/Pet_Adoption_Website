
let arrForNav = [
    { href: 'index.html', displayText: 'Home' },
    { href: 'about.html', displayText: 'About' }
];

function createNavBar(arrForNavItems, thePageName) {
    let theNav = document.createElement('nav');
    for (const curr of arrForNav) {
        let newA = document.createElement('a');
        newA.setAttribute('href', curr.href);
        newA.appendChild(document.createTextNode(curr.displayText));
        newA.classList.add('nav-item');
        if (curr.displayText == thePageName) {
            newA.classList.add('active');
        }
        theNav.appendChild(newA);
    }
    return theNav;
};

async function availblepets() {
    try {
        let response = await fetch('http://localhost:3001/AvilablePets');
        let pets = await response.json();
        let forYou = document.querySelector('#forYou');

        for (let pet of pets) {
            let newDiv = document.createElement('div');
            newDiv.setAttribute('class', 'forYouCard');

            let petImg = document.createElement('img');
            petImg.setAttribute('class', 'forYouImg');
            newDiv.setAttribute('id', `${pet.id}`);
            petImg.setAttribute('src', `${pet.pet_photo}`);
            petImg.setAttribute('alt', `${pet.race} ${pet.type}`);

            let details = document.createElement('div');
            details.setAttribute('class', 'cardDetails');

            let petName = document.createElement('h4');
            petName.innerText = `${pet.pet_name}`;
            details.appendChild(petName);

            let petprev = document.createElement('h4');
            petprev.innerText = `${pet.gender} | ${pet.type} | ${pet.race}`;
            details.appendChild(petprev);

            newDiv.appendChild(petImg);
            newDiv.appendChild(details);
            forYou.appendChild(newDiv);
        }
    }
    catch (error) {
        console.error('Error fetching pets:', error);
    }
}

async function getSpecificAnimle() {
    const max_age = document.querySelector("#pet_max_age_asxed").value;
    const min_age = document.querySelector("#pet_min_age_asxed").value;
    const pet_race = document.querySelector("#pet_race_asxed").value;
    const pet_type = document.querySelector("#pet_type_asxed").value;
    const pet_gender = document.querySelector("#pet_gender_asxed").value;

    console.log(max_age, min_age, pet_race, pet_type, pet_gender);


    try {
        let response = await fetch(`/serchSpecificAnimle?type=${pet_type}&race=${pet_race}&gender=${pet_gender}&min_age=${min_age}&max_age=${max_age}`);
        let pets = await response.json();
        let forYou = document.querySelector('#forYou');
        console.log(pets);

        if (pets != null && typeof pets == 'object' && !Array.isArray(pets)) {
            forYou.innerHTML = '';
            let newDiv = document.createElement('div');
            newDiv.setAttribute('class', 'forYouCard');
            newDiv.setAttribute('id', `${pets.id}`);
            console.log(pets.pet_photo);
            console.log(pets.race);
            let petImg = document.createElement('img');
            petImg.setAttribute('class', 'forYouImg');
            petImg.setAttribute('src', `${pets.pet_photo}`);
            petImg.setAttribute('alt', `${pets.race} ${pets.type}`);

            let details = document.createElement('div');
            details.setAttribute('class', 'cardDetails');

            let petName = document.createElement('h4');
            petName.innerText = `${pets.pet_name}`;
            details.appendChild(petName);

            let petprev = document.createElement('h6');
            petprev.innerText = `${pets.gender} | ${pets.type} | ${pets.race}`;
            details.appendChild(petprev);

            newDiv.appendChild(petImg);
            newDiv.appendChild(details);
            forYou.appendChild(newDiv);

        } else if (pets != null && typeof pets == 'object' && Array.isArray(pets)) {
            forYou.innerHTML = '';
            for (let pet of pets) {
                let newDiv = document.createElement('div');
                newDiv.setAttribute('class', 'forYouCard');

                let petImg = document.createElement('img');
                petImg.setAttribute('class', 'forYouImg');
                petImg.setAttribute('src', `${pet.pet_photo}`);
                petImg.setAttribute('alt', `${pet.race} ${pet.type}`);

                let details = document.createElement('div');
                details.setAttribute('class', 'cardDetails');

                let petprev = document.createElement('h4');
                petprev.innerText = `${pet.gender} | ${pet.type} | ${pet.race}`;
                details.appendChild(petprev);

                newDiv.appendChild(petImg);
                newDiv.appendChild(details);
                forYou.appendChild(newDiv);
            }
        } else {
            console.log('1111');

        }



    }
    catch (error) {
        console.error('Error fetching pets:', error);
    }

}

async function giveFullCard() {
    const forYouDiv = document.querySelector('#forYou');
    let cards = forYouDiv.querySelectorAll('.forYouCard');

    cards.forEach(card => {
        card.addEventListener('click', async () => {

            try {
                window.location.href = `/getFullCard?pet_id=${card.id}`;

            } catch (error) {
                console.error('Error fetching pets:', error);
            }

        });
    });
}

async function setNewLied() {
    const first_name = document.querySelector("#first_name").value;
    const last_name = document.querySelector("#last_name").value;
    const customer_email = document.querySelector("#customer_email").value;
    const customer_mobile = document.querySelector("#customer_mobile").value;
    const pet_id = document.querySelector('.petCard').id;

    console.log(pet_id);

    try {
        const data = {
            first_name: first_name,
            last_name: last_name,
            customer_email: customer_email,
            customer_mobile: customer_mobile,
            pet_id: pet_id
        }
        const response = await fetch('http://localhost:3001/setNewLied', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(data)
        });
        const html = await response.text();

        document.open();
        document.write(html);
        document.close();
    } catch (error) {
        alert(`faild to send request to the server: ${error}`)
    }

}

function goHome() {
    window.location.href = `/`;
}

