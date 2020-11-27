import mapboxgl from 'mapbox-gl';

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach(marker => bounds.extend([marker.lng, marker.lat]));
    // const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
    map.fitBounds(bounds, {
      padding: 100,
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

    // let markerCount = 0;

    markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

      if (marker.type === "trailstage") {
        const element = document.createElement('div');
        element.className = 'marker-ts';
        element.style.width = '25px';
        element.style.height = '25px';
        // element.innerHTML = `<div class="number">${marker.num}</div><div class="stage-name">${marker.name}</div>`
        element.innerHTML = marker.num
        new mapboxgl.Marker(element)
          .setLngLat([marker.lng, marker.lat])
          .addTo(map);
      } else {
        const element = document.createElement('div');
        element.className = 'marker';
        element.style.backgroundImage = `url('${marker.image_url}')`;
        element.style.backgroundSize = 'contain';
        element.style.width = '25px';
        element.style.height = '25px';
        new mapboxgl.Marker(element)
          .setLngLat([marker.lng, marker.lat])
          .setPopup(popup)
          .addTo(map);
      }
      // markerCount++;
      // console.log(markers.length);
      // console.log(markerCount);

    });
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
