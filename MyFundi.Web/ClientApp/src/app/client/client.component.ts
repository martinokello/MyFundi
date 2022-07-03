import { Component, OnInit, Inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { IProfile, ICertification, ICourse, IWorkCategory, IFundiRating, ILocation, IUserDetail, MyFundiService, IAddress, IClientProfile, IJob } from '../../services/myFundiService';
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
  numberOfDaysToComplete: number;
  profileImage: File;
  profile: any;
  fundiProfile: any;
  location: ILocation;
  clientUserGuidId: string;
  jobDescription: string;
  address: IAddress;
  addressId: number;
  profileSummary: string;
  clientFundiContractId: number;
  fundiProfiles: IProfile[];
  workCategories: IWorkCategory[];
  chosenWorkCategories: IWorkCategory[];
  workCategoryId: number;

  decoderUrl(url: string): string {
    return decodeURIComponent(url);
  }
  ngOnInit(): void {
    this.chosenWorkCategories = [];
    this.userDetails = JSON.parse(localStorage.getItem("userDetails"));
    this.userRoles = JSON.parse(localStorage.getItem("userRoles"));

    let userGuidObs = this.myFundiService.GetUserGuidId(this.userDetails.username);

    let workCatObs = this.myFundiService.GetAllFundiWorkCategories();

    workCatObs.map((workCats: IWorkCategory[]) => {
      this.workCategories = workCats;

      //Dynamic check boxes for Categories To Search for:
      let selectWorkCategories: HTMLSelectElement = document.querySelector('select#workCategoryId');
      let selectWorkCategoriesOptions: HTMLSelectElement = document.querySelector('select#workCategoryId option');
      if (selectWorkCategoriesOptions) {
        selectWorkCategoriesOptions.remove();
      }

      let option = document.createElement('option');
      option.textContent = "Select Work Category";
      option.value = "0";
      selectWorkCategories.appendChild(option);

      this.workCategories.forEach((cat) => {
        let option = document.createElement('option');
        option.textContent = cat.workCategoryType;
        option.value = cat.workCategoryId.toString();
        selectWorkCategories.appendChild(option);
      });
    }).subscribe();

    userGuidObs.map((q: string) => {
      this.clientUserGuidId = q;
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


    let fundiProfileObs: Observable<IProfile[]> = this.myFundiService.GetAllFundiProfiles();
    fundiProfileObs.map((q: IProfile[]) => {
      this.fundiProfiles = q;

      let addSelect = document.querySelector('select#assignedFundiProfileId');
      let opts = addSelect.querySelector('option');
      if (opts) {
        opts.remove();
      }
      let optionElem = document.createElement('option');
      optionElem.selected = true;
      optionElem.value = (0).toString();
      optionElem.text = "Select Fundi Profile";
      addSelect.append(optionElem);

      this.fundiProfiles.map((fundiProf: IProfile) => {
        let optionElem: HTMLOptionElement = document.createElement('option');
        optionElem.value = fundiProf.fundiProfileId.toString();
        optionElem.text = fundiProf.user.firstName + " " + fundiProf.user.lastName;
        addSelect.append(optionElem);
      });

      this.fundiProfile = {};
      this.fundiProfile.fundiProfileId = 0;
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
    this.profile.userId = this.clientUserGuidId;
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
  createJob($event) {

    this.fundiProfile = this.fundiProfiles.filter(q => q.fundiProfileId == this.fundiProfile.fundiProfileId)

    let job: any = {
      jobId: 0,
      jobDescription: this.jobDescription,
      clientProfileId: this.profile.clientProfileId,
      clientUserId: this.profile.userId,
      hasCompleted: false,
      hasBeenAssignedFundi: false,
      locationId: this.location.locationId,
      numberOfDaysToComplete: this.numberOfDaysToComplete,
      clientFundiContractId: 0,
      assignedFundiUserId: null,//this.fundiProfile.user.userId,
      assignedFundiProfileId: null,//this.fundiProfile.fundiProfileId
      workCategoryIds: this.chosenWorkCategories.map((workCat: IWorkCategory) => {
        return workCat.workCategoryId.toString();
      }).join(",")
    };

    let obsj: Observable<any> = this.myFundiService.CreateFundiJob(job);
    obsj.map((q: any) => {
      alert(q.message)
    }).subscribe();
    $event.preventDefault();
  }
  addWorkCategory($event) {

    let selectedWorkCategory: IWorkCategory = this.workCategories.find((workCat: IWorkCategory) => {

      return workCat.workCategoryId == this.workCategoryId;
    });
    this.chosenWorkCategories.push(selectedWorkCategory);
    let ulSelectedCategories = document.querySelector('ul#ulistWorkCategories');
    let li = document.createElement("li");
    li.id = selectedWorkCategory.workCategoryId.toString();
    li.textContent = selectedWorkCategory.workCategoryType;
    ulSelectedCategories.appendChild(li);

    $event.preventDefault();
  }
  removeWorkCategory($event) {
    let selectedWorkCategory: IWorkCategory = this.workCategories.find((workCat: IWorkCategory) => {

      return workCat.workCategoryId == this.workCategoryId;
    });
   this.chosenWorkCategories = this.chosenWorkCategories.filter((workCat: IWorkCategory) => {
      return workCat.workCategoryId != selectedWorkCategory.workCategoryId
   });

    let ulSelectedCategories = document.querySelector('ul#ulistWorkCategories');
    let li = document.querySelector('ul#ulistWorkCategories > li[id="' + selectedWorkCategory.workCategoryId.toString()+'"]');
    ulSelectedCategories.removeChild(li);
    $event.preventDefault();
  }
}

