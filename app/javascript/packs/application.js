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
import "controllers"
import {
  initMapbox
} from '../plugins/init_mapbox';
import "../plugins/flatpickr";
import {
  initShowAccomCont
} from "../plugins/init_show_accom_cont";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';


const closeAccommodation = (accommodationContainer) => {
  const closeBtn = accommodationContainer.querySelector("#close-btn");
  closeBtn.addEventListener("click", event => {
    accommodationContainer.innerHTML = "";
  });
};


// const addAccToIti = (accommodationContainer) => {
//   const addButton = accommodationContainer.querySelector("#add-to-itinerary");
//   const accName = accommodationContainer.querySelector("#accommodation-name").innerText;
//   const accPrice = accommodationContainer.querySelector(".accommodation-show-pricing").innerText;
//   const itinerary = document.querySelector("#itinerary");
//   const htmlCard =
//   //  `<div class="grey-section">
//   //         <p>DAY 1</p>
//   //         <p><strong>24TH JULY 2020</strong></p>
//   //       </div>
//   //       <div class="white-section">
//   //         <svg width="22" height="14" viewBox="0 0 22 14" fill="none" xmlns="http://www.w3.org/2000/svg">
//   //           <line x1="1" y1="1" x2="20.0238" y2="1" stroke="#828282" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
//   //           <line x1="1.01172" y1="7" x2="20.0355" y2="7" stroke="#828282" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
//   //           <line x1="1.01172" y1="13" x2="20.0355" y2="13" stroke="#828282" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
//   //         </svg>
//   //         <div class="info">
//   //           <p class="itinerary-name">${accName}</p>
//   //           <p class="itinerary-price">${accPrice}€</p>
//   //         </div>
//   //         <svg width="19" height="22" viewBox="0 0 14 16" fill="none" xmlns="http://www.w3.org/2000/svg">
//   //           <path fill-rule="evenodd" clip-rule="evenodd" d="M0 1.00351C0 0.449285 0.449949 0 1.00685 0H12.9932C13.5492 0 14 0.439668 14 1.00351V15.4342C14 15.9884 13.6432 16.1611 13.2106 15.8257L7.78938 11.6226C7.35342 11.2846 6.64325 11.2872 6.21062 11.6226L0.789382 15.8257C0.353418 16.1637 0 15.998 0 15.4342V1.00351Z" fill="#A31621"/>
//   //         </svg>
//   //       </div>`
//   addButton.addEventListener("click", event => {
//     itinerary.insertAdjacentHTML("beforeend", htmlCard)
//   })
// };


document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  initMapbox();
  const markers = document.querySelectorAll(".marker");
  markers.forEach((marker) => {
    marker.addEventListener("click", () => {
      setTimeout(() => {
        const infoWindow = document.querySelector(".popover-info");
        // const addAccToItiInfo = (infoWindow) => {
        //   const addToItiButton = infoWindow.querySelector("#add-to-iti");
        //   const accName = infoWindow.querySelector(".acc-name").innerHTML;
        //   const accPrice = infoWindow.querySelector(".acc-price").innerHTML;
        //   const itinerary = document.querySelector("#itinerary");
        //   const htmlCard = `<div id="itinerary-card">
        //                       <div class="accname"><b>${accName}</b></div>
        //                       <div class="accprice">${accPrice}</div>
        //                     </div>`;
        //   addToItiButton.addEventListener("click", event => {
        //     itinerary.insertAdjacentHTML("beforeend", htmlCard)
        //   });
        // };
        // addAccToItiInfo(infoWindow);
        const fetchButton = document.querySelector(".fetch-accommodation");
        const accommodationContainer = document.querySelector(".accommodation-container");
        if (fetchButton) {
          fetchButton.addEventListener("click", event => {
            console.log(event.currentTarget.dataset.accommodationId);
            fetch(`/accommodations/${event.currentTarget.dataset.accommodationId}`)
              .then(response => response.text())
              .then((html) => {
                accommodationContainer.innerHTML = html;
                closeAccommodation(accommodationContainer);
                // addAccToIti(accommodationContainer);
              });
          })
        }
      }, 200);
    });
  });
});


