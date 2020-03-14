import { Component, OnInit } from '@angular/core';
import { LoginService } from '../login.service';
import { EmartService } from '../emart.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-buyer-signup',
  templateUrl: './buyer-signup.component.html',
  styleUrls: ['./buyer-signup.component.css']
})
export class BuyerSignupComponent implements OnInit {
buyer:any;
  constructor(protected loginService:LoginService, protected emartService:EmartService,
    protected router:Router) { 
      this.buyer={
      id:null,
      username:'',
      password:'',
      email:'',
      mobileno:null,
      date:new Date()
    }
  }
  ngOnInit(): void {
  }
  register(){
    let size:number;
    
    this.emartService.register(this.buyer).subscribe(
      (response:any)=>{
     
      this.router.navigate(['/login']);
    }
    );
  
  }
}
