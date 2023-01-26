package com.kh.mw.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.mw.service.SmsService;

import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
@RequestMapping("/sms/*")
public class SmsController {
	
	@Autowired
	private SmsService smsService;
	
	@RequestMapping(value = "/send", method = RequestMethod.POST)
	@ResponseBody
	public String sendMessage(@RequestParam(value="arr_g_no[]") String[] arr_g_no) throws CoolsmsException {	// 15번 가능 -> 14
		System.out.println(arr_g_no);
		String phonenumber = String.join(",", arr_g_no);
		String to = phonenumber.replaceAll("-", "");
		String server_addr = "192.168.0.95/create/invite?url=";
		String userid = "lee";
		String web_addr = server_addr + userid;
//		System.out.println("newlen : " + newlen);
		
		
//		010-2222-2222
//		010-4445-6564 -> - 제거하고 ,로 붙여서 from으로 smsService에 넘기기
		
//		String to = "01066483012";
		smsService.certifiedPhoneNumber(to, web_addr);		
		return null;
//		return "success";
	}
	
}
