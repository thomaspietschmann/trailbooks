// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import {
  initMapbox
} from '../plugins/init_mapbox';
import "../plugins/flatpickr";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';


const closeAccommodation = (accommodationContainer) => {
  const closeBtn = accommodationContainer.querySelector("#close-btn");
  closeBtn.addEventListener("click", event => {
    accommodationContainer.innerHTML = "";
  });
};


const addAccToIti = (accommodationContainer) => {
  const addButton = accommodationContainer.querySelector("#add-to-itinerary");
  const accName = accommodationContainer.querySelector("#accommodation-name").innerText;
  const accPrice = accommodationContainer.querySelector(".accommodation-show-pricing").innerText;
  const itinerary = document.querySelector("#itinerary");
  const htmlCard = `<div id="container">
                      <svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-geo-alt-fill" fill="#A31621" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                      </svg>
                      <div class="accname"><b>${accName}</b></div>
                      <div class="accprice">${accPrice}</div>
                    </div>`
  addButton.addEventListener("click", event => {
    itinerary.insertAdjacentHTML("beforeend", htmlCard)
  })
};


document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  console.log()
  initMapbox();
  const markers = document.querySelectorAll(".marker");
  markers.forEach((marker) => {
    marker.addEventListener("click", () => {
      setTimeout(() => {
        const infoWindow = document.querySelector(".popover-info");
        const addAccToItiInfo = (infoWindow) => {
        const addToItiButton = infoWindow.querySelector("#add-to-iti");
        const accName = infoWindow.querySelector(".acc-name").innerText;
        const accPrice = infoWindow.querySelector(".acc-price").innerText;
        const itinerary = document.querySelector("#itinerary");
        const htmlCard = `<div id="itinerary-card">
                            <div class="accname"><b>${accName}</b></div>
                            <div class="accprice">${accPrice}</div>
                          </div>`
        addToItiButton.addEventListener("click", event => {
          itinerary.insertAdjacentHTML("beforeend", htmlCard)
        })
      };
        addAccToItiInfo(infoWindow);
        const fetchButton = document.querySelector(".fetch-accommodation");
        const accommodationContainer = document.querySelector(".accommodation-container");
        if (fetchButton) {
          fetchButton.addEventListener("click", event => {
            fetch(`/accommodations/${event.currentTarget.dataset.accommodationId}`)
             .then(response => response.text())
             .then((html) => {
              accommodationContainer.innerHTML = html;
              closeAccommodation(accommodationContainer);
              addAccToIti(accommodationContainer);
             });
          })
        }
      }, 200);
    });
  });
});
