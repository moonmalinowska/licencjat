// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require Underscore
//= require gmaps/google
//= require social-likes.min
//= require new
//= require_tree .

$( document ).ready(function() {
    var szer = "<%= @attraction.latitude %>";
    var dlu = "<%= @attraction.longitude %>";
    var naz = '<%= @attraction.name %>';

    var handler = Gmaps.build('Google');
    handler.buildMap({ internal: {id: 'multi_markers'}}, function(){
        var markers;
        markers = handler.addMarkers([
            {

                lat: szer, lng: dlu,
                infowindow: '$naz'.replace('$naz', naz)


            }
        ]);

        handler.bounds.extendWith(markers);

        handler.fitMapToBounds();
        handler.getMap().setZoom(15);

    });

});