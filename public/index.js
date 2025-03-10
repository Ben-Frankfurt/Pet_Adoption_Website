

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
            petImg.setAttribute('src', `${pet.pet_photo}`);
            petImg.setAttribute('alt', `${pet.race} ${pet.type}`);

            let details = document.createElement('div');
            details.setAttribute('class', 'cardDetails');

            // let petname = document.createElement('h4');
            // petname.innerText = `${pet.pet_name}`;
            // details.appendChild(petname);

            let petprev = document.createElement('h4');
            petprev.innerText = `${pet.gender} | ${pet.type} | ${pet.race}`;
            details.appendChild(petprev);

            // let para = document.createElement('p');
            // para.innerText = `${pet.pet_name}, ${pet.type} ${pet.race}. מחכה לכם במרכז האימוץ שלנו`;
            // details.appendChild(para);

            newDiv.appendChild(petImg);
            newDiv.appendChild(details);
            forYou.appendChild(newDiv);
            // for (let [key, value] of Object.entries(pet)) {

            // }
        }
    }
    catch (error) {
        console.error('Error fetching pets:', error);
    }
}
availblepets()