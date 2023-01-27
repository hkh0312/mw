package com.kh.mw.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/url/*")
public class UrlController {
	
	@Autowired
//	private CreateService createService;
	
	// url/*
	@RequestMapping(value = "/*", method = RequestMethod.GET)
	public String url() {
		System.out.println("url/* 입력");
		return null;
	}
	
	// 유저 url 홈페이지 - Home 
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String url_home(HttpSession session) {
		System.out.println("url-home입니당!!");
		String url_keyword = (String)session.getAttribute("url_keyword");
		System.out.println("url_keyword: "+url_keyword);
		return "/create/temp_h/h_home";
	}
	
	// 유저 url 홈페이지 - Ourstory 
	@RequestMapping(value = "*/ourstory", method = RequestMethod.GET)
	public String url_ourstory(HttpSession session) {
		System.out.println("url-ourstory입니당!!");
//		String url_keyword = (String)session.getAttribute("url_keyword");
//		System.out.println("url_keyword: "+url_keyword);
		return "/create/temp_h/h_ourstory";
	}
	
	// 미리보기 페이지 - Ourstory
	//@RequestMapping(value = "/h_ourstory", method = RequestMethod.GET)
	//public String h_ourstory() {
	//	return "/create/temp_h/h_ourstory";
	//}
	
	// 미리보기 페이지 - Photos
	//@RequestMapping(value = "/h_photos", method = RequestMethod.GET)
	//public String h_photos() {
	//	return "/create/temp_h/h_photos";
	//}
	
	// 미리보기 페이지 - Q + A
	//@RequestMapping(value = "/h_qna", method = RequestMethod.GET)
	//public String h_qna() {
	//	return "/create/temp_h/h_qna";
	//}
	
	// 미리보기 페이지 - Travel
	//@RequestMapping(value = "/h_travel", method = RequestMethod.GET)
	//public String h_travel() {
	//	return "/create/temp_h/h_travel";
	//}
	
	// 미리보기 페이지 - Messages
	//@RequestMapping(value = "/h_messages", method = RequestMethod.GET)
	//public String h_messages() {
	//	return "/create/temp_h/h_messages";
	//}
		
}
