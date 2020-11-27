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
  };


  if (mapElement) { // only build a map if there's a div#map to inject into
    // mapboxgl.accessToken = "pk.eyJ1IjoiZW1lcmdlbmNlZSIsImEiOiJja2d6MjZka3IwemFtMnlxaDVtMGs1Z2w4In0.HJAtijPoXT2Fsl1fwuD4Fw";
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/brizlelem/ckhw1xc2e0y2d19nxpeh4t2co'
      // style: 'mapbox://styles/mapbox/streets-v11'
    });

    const markers = JSON.parse(mapElement.dataset.markers);
    markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

      if (marker.type === "trailstage") {
        const element = document.createElement('div');
        element.className = 'marker-ts';
        element.style.width = '24px';
        element.style.height = '24px';
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
        element.style.width = '36px';
        element.style.height = '36px';
        new mapboxgl.Marker(element)
          .setLngLat([marker.lng, marker.lat])
          .setPopup(popup)
          .addTo(map);
      }

    });
    fitMapToMarkers(map, markers);
    map.on('load', () => {
        map.resize();
    });
  };
};


export {
  initMapbox
};
