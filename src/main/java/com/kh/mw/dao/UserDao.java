package com.kh.mw.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mw.vo.UserVo;

@Repository
public class UserDao {
	private final String NAMESPACE = "mappers.user.";
	
	@Autowired
	private SqlSession sqlSession;
	
	public boolean registerRun(UserVo userVo) {
//		System.out.println("다오 레지스터런");
		System.out.println(userVo);
		int count = sqlSession.insert(NAMESPACE + "insertUser", userVo);
		System.out.println(count);
		if(count>0) {
			return true;
		}
		return false;
	}

	public UserVo login_run(String userid, String userpw) {
//		System.out.println("로그인런 다오");
		Map<String, String> map = new HashMap<>();
		map.put("userid", userid);
		map.put("userpw", userpw);
		UserVo vo = sqlSession.selectOne(NAMESPACE + "login", map);
		return vo;
	}
	public boolean isExistId(String inputId) {
//		System.out.println("다오: 아이디체크" + inputId);
		int count = sqlSession.selectOne(NAMESPACE + "isExistId" , inputId);
		System.out.println(count);
		if(count>0) {
			return true;
		}
		return false;
	}
	public UserVo detail(String userid, String userpw) {
//		System.out.println("다오: 디테일");
		Map<String, String> map = new HashMap<>();
		map.put("userid", userid);
		map.put("userpw", userpw);
		UserVo userVo = sqlSession.selectOne(NAMESPACE + "detail", map);
		return userVo;
	}
	public boolean modify(UserVo userVo) {
//		System.out.println("모디파이다오" + userVo);
		Map<String, String> map = new HashMap<>();
		map.put("userid", userVo.getUserid());
		map.put("userpw", userVo.getUserpw());
		map.put("username", userVo.getUsername());
		map.put("email", userVo.getEmail());
		map.put("phonenum", userVo.getPhonenum());
		map.put("url", userVo.getUrl());
		int count = sqlSession.update(NAMESPACE + "modify", map);
		if(count>0) {
			return true;
		}
		return false;
	}

	public boolean withdraw(UserVo userVo) {
//		System.out.println("탈퇴 다오");
		Map<String, String> map = new HashMap<>();
		map.put("userid", userVo.getUserid());
		int count = sqlSession.update(NAMESPACE + "withdraw", map);
		if(count > 0) {
			return true;
		}
		return false;
	}
	
	public int updatepjnum(int prevPjnum, String userid) {
		int pjnum = prevPjnum + 1;
		Map<String,Object> map = new HashMap<>();
		map.put("pjnum", pjnum);
		map.put("userid", userid);
		System.out.println("pjnum: " + pjnum);
		return sqlSession.update(NAMESPACE + "updatepjnum", map);
	}
	
	public String findid(String url) {
		System.out.println("userdao url: " + url);
		UserVo userVo = sqlSession.selectOne(NAMESPACE + "findid", url);
		String clientId = userVo.getUserid();
		System.out.println("userDao clientId: " + clientId);
		return clientId;
	}

}
