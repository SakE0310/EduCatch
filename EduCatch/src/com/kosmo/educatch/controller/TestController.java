package com.kosmo.educatch.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {
	
	Logger log = Logger.getLogger(TestController.class);
	
	@RequestMapping("1")
	public String nnn() {
		log.info("Logger");
		log.info("Logger1");
		log.info("Logger");
		return null;
	}
}
