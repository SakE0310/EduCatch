package com.kosmo.educatch.controller;

import org.apache.log4j.Logger;

import org.springframework.stereotype.Controller;

@Controller
public class DetailViewController {
	private static Logger log = Logger.getLogger(DetailViewController.class);
	private static final String CONTEXT_PATH="Serach";
	
	@Autowired
	private DetailViewService detailviewService;
	
	

}