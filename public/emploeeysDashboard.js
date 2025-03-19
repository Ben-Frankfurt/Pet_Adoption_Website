async function allLides() {
    const lidesList = document.querySelector('#lidesList');
    try {
        const response = await fetch('/getAllLides');
        const lides = await response.json()

        if (lides != null && typeof lides == 'object' && !Array.isArray(lides)) {
            lidesList.innerHTML = '';

            let newDiv = document.createElement('div');
            newDiv.setAttribute('class', 'lideCard');
            newDiv.setAttribute('id', `${lides.id}`);

            let imgDiv = document.createElement('div');
            imgDiv.setAttribute('class', 'imgCard');

            let petImg = document.createElement('img');
            petImg.setAttribute('src', `${lides.pet_photo}`);
            petImg.setAttribute('alt', `${lides.race} ${lides.pet_type}`);
            imgDiv.appendChild(petImg)
            let details = document.createElement('div');
            details.setAttribute('class', 'dtlCard');

            let petName = document.createElement('h2');
            petName.innerText = `${lides.pet_id} | ${lides.pet_name} | ${lides.customer_first_name} | ${lides.customer_phone}`;
            details.appendChild(petName);

            newDiv.appendChild(imgDiv);
            newDiv.appendChild(details);
            lidesList.appendChild(newDiv);


        } else if (lides != null && typeof lides == 'object' && Array.isArray(lides)) {
            lidesList.innerHTML = '';

            for (let lide of lides) {
                let newDiv = document.createElement('div');
                newDiv.setAttribute('class', 'lideCard');
                newDiv.setAttribute('id', `${lide.id}`);

                let imgDiv = document.createElement('div');
                imgDiv.setAttribute('class', 'imgCard');

                let petImg = document.createElement('img');
                petImg.setAttribute('src', `${lide.pet_photo}`);
                petImg.setAttribute('alt', `${lide.race} ${lide.pet_type}`);
                imgDiv.appendChild(petImg)
                let details = document.createElement('div');
                details.setAttribute('class', 'dtlCard');

                let petName = document.createElement('h2');
                petName.innerText = `${lide.pet_id} | ${lide.pet_name} | ${lide.customer_first_name} | ${lide.customer_phone}`;
                details.appendChild(petName);

                newDiv.appendChild(imgDiv);
                newDiv.appendChild(details);
                lidesList.appendChild(newDiv);
            }

        } else {
            console.log('1111');

        }

    } catch (error) {

    }
};

async function giveFullLide() {
    const forYouDiv = document.querySelector('#lidesList');
    let cards = forYouDiv.querySelectorAll('.lideCard');

    cards.forEach(card => {
        card.addEventListener('click', async () => {

            try {
                window.location.href = `/getFullLide?lide_id=${card.id}`;

            } catch (error) {
                console.error('Error fetching pets:', error);
            }

        });
    });
};

async function deleteLide() {
    const lide_card = document.querySelector('.fullLideCard');
    const lide_id = lide_card.id;
    console.log(lide_id);

    try {
        const response = await fetch(`/deleteLide?lide_id=${lide_id}`, { method: 'DELETE' });

        window.location.href = '/emploeeysDashboard';
    } catch (error) {
        console.error('Error deleting lide:', error);
    }

};

async function petWasAdopted() {
    const pet = document.querySelector('.lidePetDetails');
    const pet_id = pet.id;
    const customer = document.querySelector('.lideCustomerDetails');
    const customer_id = customer.id;
    const lide_card = document.querySelector('.fullLideCard');
    const lide_id = lide_card.id;
    console.log(pet_id, customer_id);

    try {
        const response = await fetch(`/petWasAtopted`, {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ pet_id, customer_id, lide_id })
        });
    } catch (error) {

    }

};