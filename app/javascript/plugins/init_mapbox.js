import mapboxgl from 'mapbox-gl';

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach(marker => bounds.extend([marker.lng, marker.lat]));
    map.fitBounds(bounds, {
      padding: 70,
      maxZoom: 15,
      duration: 0
    });
  };

  if (mapElement) { // only build a map if there's a div#map to inject into
    // mapboxgl.accessToken = "pk.eyJ1IjoiZW1lcmdlbmNlZSIsImEiOiJja2d6MjZka3IwemFtMnlxaDVtMGs1Z2w4In0.HJAtijPoXT2Fsl1fwuD4Fw";
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/brizlelem/ckhw1xc2e0y2d19nxpeh4t2co'
    });
  }
  const markers = JSON.parse(mapElement.dataset.markers);
  markers.forEach((marker) => {
    new mapboxgl.Marker()
      .setLngLat([marker.lng, marker.lat])
      .addTo(map);
  });
  fitMapToMarkers(map, markers);

};

export {
  initMapbox
};
