import mapboxgl from 'mapbox-gl';

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/jeangabin/cjp9ylha104s42rqw3jfl9ekk',
      center: [2.3522, 48.8566 ],
      zoom: 12
    });

    map.style.stylesheet.layers.forEach(function(layer) {
      if (layer.type !== null) {
        map.removeLayer(layer.id);
      }
    });
  }

  // // ADD MARKER
//   if (mapElement) { // only build a map if there's a div#map to inject into
//     mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
//   const markers = JSON.parse(mapElement.dataset.markers);
//   markers.forEach((marker) => {
//     new mapboxgl.Marker()
//       .setLngLat([ marker.lng, marker.lat ])
//       .addTo(map);
//   });
// }
};



export { initMapbox };
