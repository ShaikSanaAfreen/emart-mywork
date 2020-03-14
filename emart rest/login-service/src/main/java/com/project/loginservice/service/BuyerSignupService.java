package com.project.loginservice.service;

import com.project.loginservice.pojo.BuyerSignupPojo;
import com.project.loginservice.pojo.ItemPojo;

public interface BuyerSignupService {

	BuyerSignupPojo validateBuyer(BuyerSignupPojo buyerSignupPojo);

	BuyerSignupPojo getBuyer(int BuyerId);

	BuyerSignupPojo addBuyer(BuyerSignupPojo buyerSignupPojo);
}
