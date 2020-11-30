const initShowAccomCont = () => {

  const closeAccommodation = (accomodationContainer) => {
    const closeBtn = accomodationContainer.querySelector("#close-btn");
    closeBtn.addEventListener("click", event => {
      accomodationContainer.innerHTML = "";
    });
  };


  const addAccToIti = (accomodationContainer) => {
    const addButton = accomodationContainer.querySelector("#add-to-itinerary");
    const accName = accomodationContainer.querySelector("#accomodation-name").innerText;
    const accPrice = accomodationContainer.querySelector(".accomodation-show-pricing").innerText;
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

  const markers = document.querySelectorAll(".marker");
  markers.forEach((marker) => {
    marker.addEventListener("click", () => {
      setTimeout(() => {
        const infoWindow = document.querySelector(".accomodation-info-window-infos");
        const addAccToItiInfo = (infoWindow) => {
          const addToItiButton = infoWindow.querySelector("#add-to-iti");
          const accName = infoWindow.querySelector(".acc-name").innerText;
          const accPrice = infoWindow.querySelector(".acc-price").innerText;
          const itinerary = document.querySelector("#itinerary");
          const htmlCard = `<div id="container">
                              <svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-geo-alt-fill" fill="#A31621" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                              </svg>
                              <div class="accname"><b>${accName}</b></div>
                              <div class="accprice">${accPrice}</div>
                            </div>`
          addToItiButton.addEventListener("click", event => {
            itinerary.insertAdjacentHTML("beforeend", htmlCard)
          })
        };
        addAccToItiInfo(infoWindow);
        const fetchButton = document.querySelector(".fetch-accomodation");
        const accomodationContainer = document.querySelector(".accomodation-container");
        if (fetchButton) {
          fetchButton.addEventListener("click", event => {
            fetch(`/accomodations/${event.currentTarget.dataset.accomodationId}`)
              .then(response => response.text())
              .then((html) => {
                accomodationContainer.innerHTML = html;
                closeAccommodation(accomodationContainer);
                addAccToIti(accomodationContainer);
              });
          })
        }
      }, 200);
    });
  });



}

export {
  initShowAccomCont
};
