import { Component, OnInit } from '@angular/core';
import { EmartService } from '../emart.service';
import { LoginService } from '../login.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-seller-signup',
  templateUrl: './seller-signup.component.html',
  styleUrls: ['./seller-signup.component.css']
})
export class SellerSignupComponent implements OnInit {
seller:any;
  constructor(protected emartService:EmartService,protected loginService:LoginService,
    protected router:Router) {
      this.seller={
        
    username: '',
    password: '',
    company: '',
    brief: '',
    gst: '',
    address: '',
    email: '',
    website: '',
    contact:null
      }
     }

  ngOnInit(): void {
  }
sellerregister(){
  this.emartService.sellerregister(this.seller).subscribe(
    (response:any)=>{
      this.router.navigate(['/login']);
    }
  );
}
}
