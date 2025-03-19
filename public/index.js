
let arrForNav = [
    { href: 'index.html', displayText: 'Home' },
    { href: 'about.html', displayText: 'About' },
    { href: '/emploeeysDashboard', displayText: 'Emploee Dashboard' }
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
        let response = await fetch('/AvilablePets');
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

function setCat() {
    const dog_botton = document.querySelector("#petTypeDog");
    const cat_botton = document.querySelector("#petTypeCat");
    const pet_type = document.querySelector("#petType");
    let pet_type_value = pet_type.dataset.value;

    if (pet_type_value === 'Dog') {
        pet_type_value = 'Cat';
        dog_botton.className = 'rightBotton';
        cat_botton.className = 'leftBotton-click';
    } else if (pet_type_value === 'Cat') {
        cat_botton.className = 'leftBotton';
        pet_type_value === ''

    } else {
        pet_type_value = 'Cat';
        cat_botton.className = 'leftBotton-click';
    }
    console.log(pet_type_value);
    pet_type.dataset.value = pet_type_value;

}

function setDog() {
    const dog_botton = document.querySelector("#petTypeDog");
    const cat_botton = document.querySelector("#petTypeCat");
    const pet_type = document.querySelector("#petType");
    let pet_type_value = pet_type.dataset.value;

    if (pet_type_value === 'Cat') {
        pet_type_value = 'Dog';
        dog_botton.className = 'rightBotton-click';
        cat_botton.className = 'leftBotton';
    } else if (pet_type_value === 'Dog') {
        pet_type_value = '';
        dog_botton.className = 'rightBotton';
        cat_botton.className = 'leftBotton';
    } else {
        pet_type_value = 'Dog';
        dog_botton.className = 'rightBotton-click';
    }
    console.log(pet_type_value);
    pet_type.dataset.value = pet_type_value;

}

function setMale() {
    const female_botton = document.querySelector("#petTypeFemale");
    const Male_botton = document.querySelector("#petTypeMale");
    const pet_gender = document.querySelector("#petGender");
    let pet_gender_value = pet_gender.dataset.value;

    if (pet_gender_value === 'Female') {
        pet_gender_value = 'Male';
        female_botton.className = 'rightBotton';
        Male_botton.className = 'leftBotton-click';
    } else if (pet_gender_value === 'Male') {
        female_botton.className = 'rightBotton';
        Male_botton.className = 'leftBotton';
        pet_gender_value === ''

    } else {
        pet_gender_value = 'Male';
        Male_botton.className = 'leftBotton-click';
    }
    console.log(pet_gender_value);
    pet_gender.dataset.value = pet_gender_value;

}

function setFemale() {
    const female_botton = document.querySelector("#petTypeFemale");
    const Male_botton = document.querySelector("#petTypeMale");
    const pet_gender = document.querySelector("#petGender");
    let pet_gender_value = pet_gender.dataset.value;

    if (pet_gender_value === 'Male') {
        pet_gender_value = 'Female';
        female_botton.className = 'rightBotton-click';
        Male_botton.className = 'leftBotton';
    } else if (pet_gender_value === 'Female') {
        pet_gender_value = '';
        female_botton.className = 'rightBotton';
        Male_botton.className = 'leftBotton';
    } else {
        pet_gender_value = 'Female';
        female_botton.className = 'rightBotton-click';
    }
    console.log(pet_gender_value);
    pet_gender.dataset.value = pet_gender_value;

}

async function getSpecificAnimle() {
    const max_age = document.querySelector("#maxRange").value;
    const min_age = document.querySelector("#minRange").value;
    // const pet_race = document.querySelector("#pet_race_asxed").value;
    const pet_type = document.querySelector("#petType");
    let pet_type_value = pet_type.dataset.value;
    const pet_gender = document.querySelector("#petGender");
    let pet_gender_value = pet_gender.dataset.value;

    console.log(max_age, min_age, pet_type_value, pet_gender_value);


    try {
        let response = await fetch(`/serchSpecificAnimle?type=${pet_type_value}&gender=${pet_gender_value}&min_age=${min_age}&max_age=${max_age}`);
        let pets = await response.json();
        let forYou = document.querySelector('#forYou');
        console.log(pets);

        if (pets != null && typeof pets == 'object' && !Array.isArray(pets)) {
            forYou.innerHTML = '';
            let newDiv = document.createElement('div');
            newDiv.setAttribute('class', 'forYouCard');
            newDiv.setAttribute('id', `${pets.id}`);

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
                newDiv.setAttribute('id', `${pet.id}`);
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


        giveFullCard();
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

