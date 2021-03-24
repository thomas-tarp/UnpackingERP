function createIframe()
{
    let placeholder = document.getElementById('controlAddIn');
    let mapContainer = document.createElement('iframe');

    mapContainer.id = 'mapContainer';
    mapContainer.height = '100%';
    mapContainer.width = '100%';
    
    placeholder.appendChild(mapContainer);
}

function forwardGeocode(address)
{
  //API key: c611b95fd5e65aa3bda32a09a03e067a
  //const apiAddress = `http://api.positionstack.com/v1/forward?access_key=c611b95fd5e65aa3bda32a09a03e067a&query=${address}`
  //const response = fetch(apiAddress);
  //const responseAsJson = response.json();
  //const responseObj = responseAsJson.Parse();
  //Seems this function cannot be run asynchronously so should probably be handled in AL code
  const responseAsText = `{"data":[{"latitude":55.689618,"longitude":12.590014,"type":"address","name":"Gr\u00f8nningen 17","number":"17","postal_code":"1270","street":"Gr\u00f8nningen","confidence":1,"region":"Capital","region_code":"HS","county":null,"locality":"Copenhagen","administrative_area":"Copenhagen","neighbourhood":"Svanegade","country":"Denmark","country_code":"DNK","continent":"Europe","label":"Gr\u00f8nningen 17, Copenhagen, Denmark","map_url":"https:\/\/map.positionstack.com\/export\/embed.html?bbox=12.590514,55.690118,12.589514,55.689118\u0026layer=mapnik\u0026marker=55.689618,12.590014"}]}`;
  const responseAsJson = JSON.parse(responseAsText);
  return responseAsJson;
}

function embedMap(address) 
{
    createIframe();
    const addressData = forwardGeocode(address);
    const zoom = 12;

    let mapContainer = document.getElementById('mapContainer');
    mapContainer.srcdoc = 
`<!doctype html>
<html lang="en">
  <head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/openlayers/openlayers.github.io@master/en/v6.5.0/css/ol.css" type="text/css">
    <style>
      .map {
        height: 450px;
        width: 100%;
      }
    </style>
    <script src="https://cdn.jsdelivr.net/gh/openlayers/openlayers.github.io@master/en/v6.5.0/build/ol.js"></script>
  </head>
  <body>
    <div id="map" class="map"></div>
    <script type="text/javascript">
      var map = new ol.Map({
        target: 'map',
        layers: [
          new ol.layer.Tile({
            source: new ol.source.OSM()
          })
        ],
        view: new ol.View({
          center: ol.proj.fromLonLat([${addressData.data[0].longitude}, ${addressData.data[0].latitude}]),
          zoom: ${zoom}
        })
      });
    </script>
  </body>
</html>`;
}