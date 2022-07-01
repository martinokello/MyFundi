import { Component, OnInit, Inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { IProfile, ICertification, ICourse, IWorkCategory, IFundiRating, ILocation, IUserDetail, MyFundiService, IAddress, IClientProfile } from '../../services/myFundiService';
import { Router } from '@angular/router';
import { Observable } from 'rxjs';
declare var jQuery: any;

@Component({
  selector: 'client',
  templateUrl: './client.component.html'
})
export class ClientProfileComponent implements OnInit {
  userDetails: any;
  userRoles: string[];
  clientProfileId: number;
  profileImage: File;
  profile: any;
  location: ILocation;
  userGuidId: string;
  address: IAddress;
  addressId: number;
  profileSummary: string;

  decoderUrl(url: string):string {
    return decodeURIComponent(url);
  }
  ngOnInit(): void {
      this.userDetails = JSON.parse(localStorage.getItem("userDetails"));
      this.userRoles = JSON.parse(localStorage.getItem("userRoles"));
      let userGuidObs = this.myFundiService.GetUserGuidId(this.userDetails.username);

      userGuidObs.map((q: string) => {
        this.userGuidId = q;
        this.refreshAddresses();
      }).subscribe();

    let resObs = this.myFundiService.GetClientProfile(this.userDetails.username);


    resObs.map((clientProf: IClientProfile) => {
        if (clientProf) {
          this.profile = clientProf;

          let curAddObs = this.myFundiService.GetAddressById(clientProf.addressId);
          curAddObs.map((q: IAddress) => {
            this.address = q;
            this.addressId = q.addressId;
          }).subscribe();
        }
        else {
          this.profile = {
            clientProfileId: 0,
            userId: "",
            profileSummary: "",
            profileImageUrl: "",
            addressId: 0
          }
        }
      }).subscribe();
  }
  constructor(private myFundiService: MyFundiService, private router: Router, private httpClient: HttpClient) {
    this.userDetails = {};
  }
  handleProfileImage(files: FileList) {
    this.profileImage = files.item(0);
  }

  uploadProfileImage(): void {

    //let busyGif: HTMLDivElement = document.querySelector("div#loadingProfileImage");
    //busyGif.style.display = 'block';
    let url: string = "/ClientProfile/SaveClientProfileImage";

    let formData = new FormData();
    formData.append("profileImage", this.profileImage);
    formData.append("username", this.userDetails.username);

    this.httpClient.post(url, formData).map((res: any) => {
      alert(res.message);
    }).subscribe();;
  }

  saveOrUpdateClientProfile() {
    if (!this.profile) {
      this.profile = {}
    }
    this.profile.userId = this.userGuidId;
    this.profile.addressId = this.addressId;
    this.profile.profileSummary = this.profileSummary;
    this.profile.profileImageUrl = "";
    let profileObs = this.myFundiService.SaveClientProfile(this.profile);

    profileObs.map((res: any) => {
      alert(res.message);
    }).subscribe();
  }
  refreshAddresses() {
    let addSelect = document.querySelector('select#addressId');
    let opts = addSelect.querySelector('option');
    if (opts) {
      opts.remove();
    }
    let optionElem = document.createElement('option');
    optionElem.selected = true;
    optionElem.value = (0).toString();
    optionElem.text = "Select Address";
    document.querySelector('select#addressId').append(optionElem);


    let addressesObs: Observable<IAddress[]> = this.myFundiService.GetAllAddresses();
    addressesObs.map((adds: IAddress[]) => {
      adds.forEach((add: IAddress, index: number, adds) => {
        let optionElem: HTMLOptionElement = document.createElement('option');
        optionElem.value = add.addressId.toString();
        optionElem.text = add.addressLine1 + ", " + add.town + ", " + add.postCode;
        document.querySelector('select#addressId').append(optionElem);
      });

    }).subscribe();
  }
  showClientProfileEditable($event) {
    jQuery('div#editableClientDetails').fadeToggle('slow');
    $event.preventDefault();
  }
}

