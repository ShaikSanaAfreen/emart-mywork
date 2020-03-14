import { Injectable } from '@angular/core';
import { Category } from './category';
import { SubCategory } from './sub-category';
import { Item } from './item';
import { Bill } from './bill';
import { Buyer } from './buyer';
import { Seller } from './seller';
import { HttpClient, HttpHeaders } from '@angular/common/http';
@Injectable({
  providedIn: 'root'
})
export class EmartService {

  categories: Category[];
  subCategories: SubCategory[];
  allItems: Item[];
  cartItems: Item[];
  allBills: any;
  allSellers: Seller[];
  currentBuyer: any;
  currentSeller:any;
  constructor(protected http: HttpClient) {
    this.cartItems = [];
    this.allBills = [];
  }
  /*Retrieving All Items from the Database*/
  getAllItems() {
    return this.http.get("http://localhost:8083//BuyerItemService/emart/item/all");
  }

  getCategories(): Category[] {
    return [].concat(this.categories);
  }

  getSubCategories(): SubCategory[] {
    return [].concat(this.subCategories);
  }

  getAllBills(): any {
    return this.allBills;
  }

  setBuyerAndBills(currentBuyer) {
    this.currentBuyer = currentBuyer;
    this.allBills = currentBuyer.allBills;
  }
  /*Retrieving the currentBuyer*/
  getCurrentBuyer() {
    return this.currentBuyer;
  }

  getCategory(catId: number): Category {
    let category: Category;
    let size = this.categories.length;
    for (let i = 0; i < size; i++) {
      if (this.categories[i].id == catId) {
        category = {
          id: this.categories[i].id,
          name: this.categories[i].name,
          brief: this.categories[i].brief
        };
        break;
      }
    }

    return category;
  }

  getSubCategory(catId: number): SubCategory {
    let subCategory: SubCategory;
    let size = this.subCategories.length;
    for (let i = 0; i < size; i++) {
      if (this.subCategories[i].id == catId) {
        subCategory = {
          id: this.subCategories[i].id,
          name: this.subCategories[i].name,
          brief: this.subCategories[i].brief,
          categoryId: this.subCategories[i].categoryId,
          gstPercent: this.subCategories[i].gstPercent
        };
        break;
      }
    }
    return subCategory;
  }
  /*Retrieving an item from the Database*/
  getItem(itemId) {
    return this.http.get("http://localhost:8083//BuyerItemService/emart/item/" + itemId);
  }
  /*Items are added to the cart*/
  addToCart(item: any) {
    this.cartItems.push(item);
  }

  getAllCart() {
    return [].concat(this.cartItems);
  }

  deleteCartItem(itemNo: number) {
    let size = this.cartItems.length;
    for (let i = 0; i < size; i++) {
      if (this.cartItems[i].id == itemNo) {
        this.cartItems.splice(i, 1);
        break;
      }
    }
  }
  /*Adding bill to the Database*/
  addBill(todayDate: Date, total: number) {
    let allBillDetails: any = [];
    for (let i = 0; i < this.cartItems.length; i++) {
      allBillDetails.push({
        id: 0,
        billId: null,
        itemId: this.cartItems[i]

      });
    }
    let bill: any = {
      id: 0,
      type: 'Debit',
      date: todayDate,
      remarks: 'paid',
      amount: total,
      buyerId: {
        id: this.currentBuyer.id
      },
      allBillDetails: allBillDetails
    }
    this.cartItems = [];
    return this.http.post("http://localhost:8083//BuyerItemService/emart/addbill", bill);
  }
  /*Getting currentBuyer from Database*/
  getBuyer() {
    return this.http.get("http://localhost:8083//LoginService/emart/buyer/" + this.currentBuyer.id);
  }
  /*Validating Buyer Details*/
  validateBuyer(user: string, password: string) {
    let credentials = user + ":" + password;
    let headers = new HttpHeaders();
    headers = headers.set("Authorization", credentials);
    return this.http.get("http://localhost:8083//LoginService/emart/validate", { headers });
  }

  validateSeller(user: string, password: string) {
    let credentials = user + ":" + password;
    let headers = new HttpHeaders();
    headers = headers.set("Authorization", credentials);
    return this.http.get("http://localhost:8083//LoginService/emart/validateseller", { headers });
   }
register(buyer):any{
  console.log(buyer);
  return this.http.post("http://localhost:8083//LoginService/emart/addbuyer",buyer);
}
sellerregister(seller):any{
  return this.http.post("http://localhost:8083//LoginService/emart/addseller",seller);
}
getSellerItem() {
  return this.http.get("http://localhost:8083/LoginService/emart/seller/" + this.currentSeller.id);
}


 setSeller(currentSeller) {
  this.currentSeller = currentSeller;
  console.log(this.currentSeller );
   
}
}
