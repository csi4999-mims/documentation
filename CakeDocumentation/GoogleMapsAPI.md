# Google Maps API Helper Documentation  

https://github.com/marcferna/CakePHP-GoogleMapHelper/tree/CakePHP3  

## Instllation  
1) Download the files from Github  

2) Place the helper file (`GoogleMapsHelper.php`) into the following location:  
`src/View/Helper/`  

3) Add this line to the controller associated with the view you will place the Google Map on:  
`public $helpers = array('GoogleMap');`  

4) Add the JavaScript files to the associated view:  
`<?= $this->Html->script('http://maps.google.com/maps/api/js?key=YOUR_API_KEY&sensor=true', [false]); ?>`  
* Get the API Key from Nicole  

5) In the view add this line:  
`<?= $this->GoogleMap->map(); ?>`  

6) Modify the map options with the follow code in the specific view:  
`      <?=
        // Override any of the following default options to customize your map
        $map_options = array(
          'id' => 'map_canvas',
          'width' => '600px',
          'height' => '600px',
          'style' => '',
          'zoom' => 10,
          'type' => 'ROADMAP',
          'custom' => null,
          'localize' => true,
          'latitude' => 42.6666979,
          'longitude' => -83.399939,
          'marker' => true,
          'markerTitle' => 'This is my position',
          'markerIcon' => 'http://google-maps-icons.googlecode.com/files/home.png',
          'markerShadow' => 'http://google-maps-icons.googlecode.com/files/shadow.png',
          'infoWindow' => true,
          'windowText' => 'My Position',
          'draggableMarker' => false
        );
      ?>
      <?= $this->GoogleMap->map($map_options); ?>`
       
7) Add markers for each report in the database:  
`<?php foreach ($reports as $report): ?>
    <?= $this->GoogleMap->addMarker("map_canvas", 1, $report->get('FamilyStreet')); ?>
<?php endforeach; ?>`  
