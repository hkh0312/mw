package com.kh.mw.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mw.dao.UserDao;
import com.kh.mw.vo.UserVo;

@Service
public class UserService {
	
	@Autowired
	UserDao userDao;
	
	public boolean registerRun(UserVo userVo) {
//		System.out.println("레지스터 서비스");
		boolean result = userDao.registerRun(userVo);
		return result;
	}

	public UserVo login_run(String userid, String userpw) {
//		System.out.println("로그인런 서비스");
		UserVo vo = userDao.login_run(userid, userpw);
//		System.out.println(vo.getWithdraw());
//		if(vo.getWithdraw().equals("Y")) {
//			return null;
//		}else {
		return vo;
//		}
	}
	
	public boolean isExistId(String inputId) {
//		System.out.println("서비스: 아이디체크" + inputId);
		boolean result = userDao.isExistId(inputId);
		return result;
	}
	
	public UserVo detail(String userid, String userpw) {
//		System.out.println("서비스: 디테일");
		UserVo userVo = userDao.detail(userid, userpw);
		return userVo;
	}
	public boolean modify(UserVo userVo) {
//		System.out.println("모디파이서비스"+userVo);
		boolean result = userDao.modify(userVo);
		return result;
	}

	public boolean withdraw(UserVo userVo) {
//		System.out.println("withdraw service");
		boolean result = userDao.withdraw(userVo);
		return result;
	}
	public int updatepjnum(int prevPjnum, String userid) {
		return userDao.updatepjnum(prevPjnum, userid);		
	}
	public String findid(String url) {
		return userDao.findid(url);
	}

}
