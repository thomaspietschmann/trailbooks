import mapboxgl from 'mapbox-gl';

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();
    markers.accommodation.forEach(marker => bounds.extend([marker.lng, marker.lat]));
    markers.trailstages.forEach(marker => bounds.extend([marker.lng, marker.lat]));
    // const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
    map.fitBounds(bounds, {
      padding: 0,
      maxZoom: 15,
      duration: 2000
    });
    map.resize();
  };


  if (mapElement) { // only build a map if there's a div#map to inject into
    // mapboxgl.accessToken = "pk.eyJ1IjoiZW1lcmdlbmNlZSIsImEiOiJja2d6MjZka3IwemFtMnlxaDVtMGs1Z2w4In0.HJAtijPoXT2Fsl1fwuD4Fw";
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/brizlelem/ckhw1xc2e0y2d19nxpeh4t2co'
    });
    map.resize();


    const markers = JSON.parse(mapElement.dataset.markers);

    markers.accommodation.forEach(accommodation => {
      const popup = new mapboxgl.Popup().setHTML(accommodation.infoWindow);
      const element = document.createElement('div');
      element.className = 'marker';
      element.style.backgroundImage = `url('${accommodation.image_url}')`;
      element.style.backgroundSize = 'contain';
      element.style.width = '40px';
      element.style.height = '40px';
      new mapboxgl.Marker(element)
        .setLngLat([accommodation.lng, accommodation.lat])
        .setPopup(popup)
        .addTo(map);
    });

    markers.trailstages.forEach((trailstage) => {
      const popup = new mapboxgl.Popup().setHTML(trailstage.infoWindow);
      const element = document.createElement('div');
      element.style.width = '24px';
      element.style.height = '24px';

      if (trailstage.num === 0) {
        // first trail stage
        element.className = 'marker-ts-start';
      } else if (trailstage.num === markers.trailstages.length - 1) {
        // last trail stage
        element.className = 'marker-ts-end';
      } else {
        // any other trailstage
        element.className = 'marker-ts';
        element.innerHTML = trailstage.num;
      }

      new mapboxgl.Marker(element)
        .setLngLat([trailstage.lng, trailstage.lat])
        .addTo(map);
    });


      // markerCount++;
      // console.log(markers.length);
      // console.log(markerCount);

    // if (markerCount === markers.length) {
    //   console.log("Calling fitmap now");
    // }
    fitMapToMarkers(map, markers);
  };

};

// detect the map's new width and height and resize it
export {
  initMapbox
};
