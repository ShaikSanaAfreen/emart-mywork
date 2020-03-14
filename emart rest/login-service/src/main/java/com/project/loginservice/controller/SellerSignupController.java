package com.project.loginservice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.apache.log4j.Logger;

import com.project.loginservice.controller.SellerSignupController;
import com.project.loginservice.pojo.BuyerSignupPojo;
import com.project.loginservice.pojo.ItemPojo;
import com.project.loginservice.pojo.SellerSignupPojo;

import com.project.loginservice.service.SellerSignupService;

@RestController
@CrossOrigin
@RequestMapping("emart")
public class SellerSignupController {
	static Logger LOG = Logger.getLogger(SellerSignupController.class.getClass());
	@Autowired
	SellerSignupService sellerSignupService;

	@GetMapping("/seller/{sellerId}")
	SellerSignupPojo getSellerItem(@PathVariable("sellerId") Integer sellerId) {
		LOG.info("Entered end point \'emart/seller/{sellerId}\' ");
		LOG.info("Exited end point \'emart/seller/{sellerId} \' ");
		return sellerSignupService.getSellerItem(sellerId);

	}

	@GetMapping("validateseller")

	SellerSignupPojo validateSeller(@RequestHeader("Authorization") String data) {
		String token[] = data.split(":");
		SellerSignupPojo sellerSignupPojo = new SellerSignupPojo();
		sellerSignupPojo.setUsername(token[0]);
		sellerSignupPojo.setPassword(token[1]);
		return sellerSignupService.validateSeller(sellerSignupPojo);

	}

	@PostMapping("/addseller")
	SellerSignupPojo addSeller(@RequestBody SellerSignupPojo sellersignupPojo) {
		LOG.info("Entered end point \'emart/addseller\' ");
		LOG.info("Exited end point \'emart/addseller \' ");
		return sellerSignupService.addSeller(sellersignupPojo);
	}

}
