import { HttpClient, HttpHeaders } from '@angular/common/http';
import 'rxjs/add/operator/map';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs/Observable';
import { Binary } from '@angular/compiler';
import { APP_BASE_HREF } from '@angular/common';
import { IAddress, ILocation } from './myFundiService';
import * as google from '../assets/google/googleMaps.js';
declare const google: any;

@Injectable()
export class AddressLocationGeoCodeService {

  map: any;
  geocoder: any;
  poly: any[] = [];
  line: any;
  location: ILocation;
  successGeocode: boolean = false;
  tOut: any;

  constructor() {

  }
  ngOnInit() {

    this.initialize();
  }
  // Draw a circle on map around center (radius in miles)
  // Modified by Jeremy Schneider based on https://maps.huge.info/dragcircle2.htm
  drawCircle(map, center, radius, numPoints) {
    var poly = [];
    var lat = parseFloat(center.lat);
    var lng = parseFloat(center.lng);
    var d2r = Math.PI / 180; // degrees to radians
    var r2d = 180 / Math.PI; // radians to degrees
    var Clat = (radius / 3963) * r2d; // using 3963 as earth's radius
    var Clng = Clat / Math.cos(lat * d2r);
    //Add each point in the circle
    for (var i = 0; i < numPoints; i++) {
      var theta = Math.PI * (i / (numPoints / 2));
      let Cx = lng + (Clng * Math.cos(theta));
      let Cy = lat + (Clat * Math.sin(theta));
      poly.push(new google.maps.LatLng('' + Cy, '' + Cx));
    }
    //Remove the old line if it exists
    if (this.line) {
      map.removeOverlay(this.line);
    }
    //Add the first point to complete the circle
    poly.push(poly[0]);
    //Create a line with the oints from poly, red, 3 pixels wide, 80% opaque
    this.line = new google.maps.Polyline(poly, '#FF0000', 3, 0.5);
    map.addOverlay(this.line);
  }

  initialize() {
    this.geocoder = new google.maps.Geocoder();
  }
  showAddress(address: IAddress) {

    let addressString: string = address.country + "," + address.town + "," + address.addressLine1 + "," + address.addressLine2 + "," + address.postCode;

    this.geocoder.geocode({ 'address': addressString }, function (results, status) {
      if (status != google.maps.GeocoderStatus.OK) {
        alert(address + " not found");
        this.location = null;
        this.successGeocode = false;
      }
      else {
        var myOptions = {
          zoom: 15,
          center: results[0].geometry.location,
          mapTypeControl: true,
          mapTypeControlOptions: { style: google.maps.MapTypeControlStyle.DROPDOWN_MENU },
          navigationControl: true,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };

        this.map = new google.maps.Map(document.getElementById("map"), myOptions);

        this.map.setCenter(results[0].geometry.location);

        var infowindow = new google.maps.InfoWindow(
          {
            content: '<b>' + address + '</b>',
            size: new google.maps.Size(150, 50)
          });
        //var address = "London, St. Johns Terrace W10 4RB";
        var marker = new google.maps.Marker({
          position: results[0].geometry.location,
          map: this.map,
          title: address
        });
        //drawCircle(map, results[0].geometry.location, 2.5, 40);

        google.maps.event.addListener(marker, 'click', function () {
          infowindow.open(this.map, marker);
        });

        this.location = {
          locationId: 0,
          locationName: addressString,
          latitude: results[0].geometry.location.lat,
          longitude: results[0].geometry.location.long,
          country: address.country,
          addressId: address.addressId,
          address: address
        }
        this.successGeocode = true;
      }

      clearInterval(this.tOut);
      this.tOut = null;
    });
  }
  geocodeAddress(address: IAddress) {
    this.tOut = setInterval(this.showAddress, 5000, address);
  }
}
