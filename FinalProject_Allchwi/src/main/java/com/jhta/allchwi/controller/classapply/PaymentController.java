package com.jhta.allchwi.controller.classapply;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.jhta.allchwi.service.classapply.PaymentService;

@Controller
public class PaymentController {
	@Autowired private PaymentService service;
}
