package com.kh.mw.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.mw.service.QnaService;
import com.kh.mw.vo.PagingDto;
import com.kh.mw.vo.QnaVo;
import com.kh.mw.vo.UserVo;

@Controller
@RequestMapping("/qna/*")
public class QnaController {
	
	@Autowired
	private QnaService qnaService;
	
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public String list(Model model, PagingDto pagingDto, HttpSession session) {
		UserVo userVo = (UserVo)session.getAttribute("loginInfo");
//		System.out.println("QnaController, list: ");
		pagingDto.setPagingInfo(pagingDto.getPage(), pagingDto.getPerPage(), qnaService.getCount(pagingDto));
//		System.out.println("qnaService.getCount(pagingDto) : " + qnaService.getCount(pagingDto));
		List<QnaVo> list = qnaService.qnaList(pagingDto);
		System.out.println("QnaController, list");
		model.addAttribute("list", list);
		model.addAttribute("pagingDto", pagingDto);
		model.addAttribute("count", qnaService.getCount(pagingDto));
		model.addAttribute("userVo", userVo);
		return "qna/list";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register_form(HttpSession session) {
//		System.out.println("QnaController , register_form: ");
		UserVo userVo = (UserVo)session.getAttribute("loginInfo");
//		System.out.println("register");
		return "qna/register";
	}
	
	@RequestMapping(value="/register", method = RequestMethod.POST)
	public String register(QnaVo qnaVo) {
		qnaService.qnaRegister(qnaVo);
		System.out.println("register, qnaVo " + qnaVo);
		
		return "redirect:/qna/list";
	}
	
	@RequestMapping(value="/detail", method = RequestMethod.GET)
	public String detail(int c_no, Model model, PagingDto pagingDto, HttpSession session) {
		UserVo userVo = (UserVo)session.getAttribute("loginInfo");
		QnaVo vo = qnaService.selectByCno(c_no);
		qnaService.updateViewcnt(c_no);
		model.addAttribute("qnaVo", vo);
		model.addAttribute("userVo", userVo);
		System.out.println("controller, detail : " + vo);
		return "qna/detail";
	}
	
	
	@RequestMapping(value="/modify", method = RequestMethod.POST)
	public String modify(QnaVo qnaVo) {
//		System.out.println("modify"+qnaVo);
		qnaService.qnaModify(qnaVo);
		return "redirect:/qna/detail?c_no="+qnaVo.getC_no();
	}
	
	@RequestMapping(value="/delete", method = RequestMethod.GET)
	public String delete(int c_no, PagingDto pagingDto) {
		qnaService.qnaDelete(c_no);
//		System.out.println("delete");
		return "redirect:/qna/list";
	}
	
	@RequestMapping(value = "/reply", method = RequestMethod.GET)
	public String reply(QnaVo qnaVo, Model model, PagingDto pagingDto) {
		int c_no = qnaVo.getC_no();
		model.addAttribute("c_no", c_no);
		QnaVo vo = qnaService.selectByCno(c_no);
		model.addAttribute("qnaVo", vo);
//		System.out.println("Controller, reply2: " + qnaVo);
		
		return "qna/reply_register";
	}
	
	@RequestMapping(value = "/reply", method = RequestMethod.POST)
	public String reply_ok(QnaVo qnaVo, PagingDto pagingDto) {
//		System.out.println("Controller, reply: " + qnaVo);
		qnaService.insertReply(qnaVo);
		return "redirect:/qna/list";
	}
	
	// 비밀글 확인
	@RequestMapping(value="/password_check", method=RequestMethod.GET)
	public String password_check(PagingDto pagingDto, QnaVo qnaVo) {
//			Integer c_no = qnaVo.getC_no();
//			System.out.println(c_no);
//			model.addAttribute("c_no", c_no);
		return "qna/password_check";
	}
		
	// 비밀번호 맞으면 넘기기
	@RequestMapping(value="/password", method=RequestMethod.POST)
	@ResponseBody
	public QnaVo password(String c_password, int c_no, Model model, PagingDto pagingDto) {
		System.out.println("c_no" + c_no);
//			qnaService.updateViewcnt(c_no);
		QnaVo qnaVo = qnaService.getPassword(c_password, c_no);
//			model.addAttribute("qnaVo", qnaVo);
		return qnaVo;
	}
	
	
}
