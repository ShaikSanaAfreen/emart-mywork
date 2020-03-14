package com.project.loginservice.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.loginservice.pojo.BuyerSignupPojo;
import com.project.loginservice.service.BuyerSignupService;

@RestController
@CrossOrigin
@RequestMapping("emart")
public class BuyerSignupController {
	static Logger LOG = Logger.getLogger(BuyerSignupController.class.getClass());
	@Autowired
	BuyerSignupService buyerSignupService;

	/* Fetching buyer by Username and Password */
	@GetMapping("validate")
	BuyerSignupPojo validateBuyer(@RequestHeader("Authorization") String data) {
		LOG.info("Entered end point \'emart/validate \' ");
		// BuyerSignupPojo validateBuyer(@RequestBody BuyerSignupPojo buyerSignupPojo) {
		String token[] = data.split(":");
		BuyerSignupPojo buyerSignupPojo = new BuyerSignupPojo();
		buyerSignupPojo.setUsername(token[0]);
		buyerSignupPojo.setPassword(token[1]);
		LOG.info("Exited end point \'emart/validate \' ");
		return buyerSignupService.validateBuyer(buyerSignupPojo);
	}

	@GetMapping("/buyer/{buyerId}")
	BuyerSignupPojo getBuyer(@PathVariable("buyerId") Integer buyerId) {
		LOG.info("Entered end point \'emart/buyer/{buyerId} \' ");
		LOG.info("Exited end point \'emart/buyer/{buyerId} \' ");
		return buyerSignupService.getBuyer(buyerId);

	}

	@PostMapping("/addbuyer")
	BuyerSignupPojo addBuyer(@RequestBody BuyerSignupPojo buyersignupPojo) {
		LOG.info("Entered end point \'emart/addbuyer\' ");
		LOG.info("Exited end point \'emart/addbuyer \' ");
		return buyerSignupService.addBuyer(buyersignupPojo);
	}
}
