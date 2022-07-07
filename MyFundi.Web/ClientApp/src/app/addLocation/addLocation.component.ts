import { Component, OnInit, ViewChild, ElementRef, Input, Output, Injectable, Inject, EventEmitter } from '@angular/core';
import { IAddress, ILocation, MyFundiService } from '../../services/myFundiService';
import { Element } from '@angular/compiler';
import * as $ from 'jquery';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/map';
import { AddressLocationGeoCodeService } from '../../services/AddressLocationGeoCodeService';

@Component({
  selector: 'addLocation',
  templateUrl: './addLocation.component.html',
  styleUrls: ['./addLocation.component.css'],
  providers: [MyFundiService]
})
@Injectable()
export class AddLocationComponent implements OnInit {
  private myFundiService: MyFundiService;
  private geoCoder: AddressLocationGeoCodeService;
  public constructor(myFundiService: MyFundiService, geoCoder: AddressLocationGeoCodeService) {
    this.myFundiService = myFundiService;
    this.geoCoder = geoCoder;
  }
  public location: ILocation | any;

  public addLocation(): void {
    this.checkLocationGeoCodedAndUpdate("create");

    $('div#locationView').css('display', 'block').slideDown();
  }
  public updateLocation() {
    this.checkLocationGeoCodedAndUpdate("update");
    $('div#locationView').css('display', 'block').slideDown();
  }
  checkLocationGeoCodedAndUpdate(operation: string) {

      if (!this.location.isGeocoded) {
        let addObs: Observable<IAddress> = this.myFundiService.GetAddressById(this.location.addressId);
        addObs.map((add: IAddress) => {
          this.geoCoder.geocodeAddress(add);
          while (this.geoCoder.tOut != null) {
            //if(this,geoCoder.tOut == null) then geocoding is over
            continue;
          }
          if (this.geoCoder.location != null) {

            this.location.isGeocoded = true;
            this.location.latitude = this.geoCoder.location.latitude;
            this.location.longitude = this.geoCoder.location.longitude;

            this.setCreateUpdateLocation(operation);
          }
          else {
            alert("Failed to Geocode location! Please, check location Address is correct.");
          }

        }).subscribe();
      }
      else {
        this.setCreateUpdateLocation(operation);
      }
    }
  setCreateUpdateLocation(operation: string) {

    if (operation.toLowerCase() === "create") {
      let actualResult: Observable<any> = this.myFundiService.PostOrCreateLocation(this.location);
      actualResult.map((p: any) => {
        alert('Location Added: ' + p.result);
      }).subscribe();
    }
    else if(operation.toLowerCase() === "update"){
      let actualResult: Observable<any> = this.myFundiService.UpdateLocation(this.location);
      actualResult.map((p: any) => {
        alert('Location Updated: ' + p.result);
      }).subscribe();
    }
   }

  public ngOnInit(): void {
    this.location = {}
    this.location.address = {};
  }
}
