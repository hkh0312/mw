package com.kh.mw.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.mw.service.UserService;
import com.kh.mw.vo.UserVo;

@Controller
@RequestMapping("/user/*")
public class UserController {
	
	final String MANAGERID = "admin";
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "user/login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login_run(String userid, String userpw, HttpSession session, RedirectAttributes rttr) {
		UserVo vo = userService.login_run(userid, userpw);
		System.out.println(vo);
		//로그인이 안되거나 탈퇴한 회원이면
		if(vo==null) {
			rttr.addFlashAttribute("loginResult","fail");
			return "redirect:/user/login";
		}else if(vo.getWithdraw()!=null) {
			rttr.addFlashAttribute("loginResult","withdraw");
			return "redirect:/user/login";
		}
		session.setAttribute("loginInfo", vo);
		rttr.addFlashAttribute("loginResult","success");
		
		if(vo.getUserid().equals(MANAGERID)) {
			rttr.addFlashAttribute("loginResult","manager");	
		}
		
		// 로그인 시 페이지 상태 유지 추가 
		String targetLocation = (String)session.getAttribute("targetLocation");
		session.removeAttribute("targetLocation");
		String page = "";
		if(targetLocation != null && !targetLocation.equals("")) {
			page = "redirect:" + targetLocation;
		} else {
			page = "redirect:/main/home_form";
		}
		 
		
		return page;
	}
	
	@RequestMapping(value ="/register", method = RequestMethod.GET)
	public String register() {
		return "user/register_form";
	}
	
	@RequestMapping(value = "/register_run", method = RequestMethod.POST)
	public String registerRun(UserVo userVo, RedirectAttributes rttr) {
		System.out.println(userVo);
		boolean result = userService.registerRun(userVo);
		System.out.println(result);
		rttr.addFlashAttribute("register_result", "success");
		return "redirect:/user/login";
	}
	
	@RequestMapping(value = "/isExistId", method = RequestMethod.GET)
	@ResponseBody
	public String checkId(String inputId) {
		System.out.println(inputId);
		boolean result = userService.isExistId(inputId);
		String strResult = "";
		if(result ==true) {
			strResult = "true";
		}else{
			strResult = "false";
		}
		System.out.println(strResult);
		return strResult;
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main/home_form";
	}
	
	@RequestMapping(value = "/inputpassword", method = RequestMethod.GET)
	public String inputpassword(HttpSession session) {
		return "/user/inputpassword";
	}
	//userinfo페이지
	@RequestMapping(value = "/userinfo", method = RequestMethod.GET)
	public String userinfo(HttpSession session) {
		return "/user/userinfo";
	}
	@RequestMapping(value = "/userinfo", method = RequestMethod.POST)
	public String userinfo(HttpSession session, String userpw, RedirectAttributes rttr) {
		UserVo vo = (UserVo)session.getAttribute("loginInfo");
		System.out.println(vo);
		if(userpw.equals(vo.getUserpw())){
			session.setAttribute("vo", vo);
			return "/user/userinfo";
		}else {
			rttr.addFlashAttribute("checkPw","wrong");
			return "redirect:/user/inputpassword";
		}
	}
	@RequestMapping(value="/modify", method = RequestMethod.POST)
	public String modify(UserVo userVo, RedirectAttributes rttr) {
		boolean result = userService.modify(userVo);
		System.out.println(result);
		rttr.addFlashAttribute("update", "success");
		return "redirect:/user/login";
	}
	
	@RequestMapping(value="/withdraw", method = RequestMethod.POST)
	public String withdraw(UserVo userVo, HttpSession session, RedirectAttributes rttr) {
		System.out.println("탈퇴신청");
		System.out.println(userVo);
		boolean result = userService.withdraw(userVo);
		if(result) {
			session.invalidate();
			return "redirect:/main/home_form";
		}else {
			return "redirect:/user/inputpassword";
		}	
	}
}
