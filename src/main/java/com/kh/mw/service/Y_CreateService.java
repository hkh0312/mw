package com.kh.mw.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.mw.dao.Y_CreateDao;
import com.kh.mw.dao.Y_LikeDao;
import com.kh.mw.vo.Y_AskVo;
import com.kh.mw.vo.Y_HomeVo;
import com.kh.mw.vo.Y_MessageVo;
import com.kh.mw.vo.Y_PhotoVo;
import com.kh.mw.vo.Y_QnaVo;
import com.kh.mw.vo.Y_StoryVo;
import com.kh.mw.vo.Y_TravelVo;

@Service
public class Y_CreateService {
	
	@Autowired
	Y_CreateDao y_createDao;
	@Autowired
	Y_LikeDao y_likeDao;

	public boolean insert(Y_HomeVo homeVo, Y_StoryVo storyVo, Y_TravelVo travelVo, Y_PhotoVo photoVo) {
		return y_createDao.insert(homeVo, storyVo, travelVo, photoVo);
	}

	public boolean insertQnA(Y_QnaVo qnaVo) {
		System.out.println("service qna" + qnaVo);
		return y_createDao.insertQnA(qnaVo);
	}
	public boolean updateQna(Y_QnaVo qnaVo) {
		return y_createDao.updateQna(qnaVo);
	}

	@Transactional
	public Map<String, Object> searchInfo(String clientId) {
		
		System.out.println("service searchId" + clientId);
		Y_HomeVo homeVo = y_createDao.searchHome(clientId);
		Y_StoryVo storyVo = y_createDao.searchStory(clientId);
		List<Y_QnaVo> qnaVo = y_createDao.searchQna(clientId);
		Y_TravelVo travelVo = y_createDao.searchTravel(clientId);
		Y_PhotoVo photoVo = y_createDao.searchPhoto(clientId);
		List<Y_MessageVo> mesVo = y_createDao.getMes(clientId);
		int qnacount = y_createDao.countQna(clientId);
		System.out.println("createService searchInfo: " + qnaVo);

		String pic_url = "/create/displayImg?pic=";
		String coverPic = pic_url + homeVo.getCoverPic();
		homeVo.setCoverPic(coverPic);
		String story_one_pic = pic_url + storyVo.getStory_one_pic();
		storyVo.setStory_one_pic(story_one_pic);
		String story_two_pic = pic_url + storyVo.getStory_two_pic();
		storyVo.setStory_two_pic(story_two_pic);
		String footerPic = pic_url + photoVo.getFooterpic();
		photoVo.setFooterpic(footerPic);
		String mespic = pic_url + photoVo.getMespic();
		photoVo.setMespic(mespic);
		String mapPic = pic_url + travelVo.getMapPic();
		travelVo.setMapPic(mapPic);

		Map<String, Object> map = new HashMap<>();
		map.put("homeVo", homeVo);
		map.put("storyVo", storyVo);
		map.put("qnaVo", qnaVo);
		map.put("travelVo", travelVo);
		map.put("photoVo", photoVo);
		map.put("mesVo", mesVo);
		map.put("qnacount", qnacount);
		return map;
	}

	public Y_HomeVo searchHome(String clientId) {
		return y_createDao.searchHome(clientId);
	}

	public Y_StoryVo searchStory(String clientId) {
		return y_createDao.searchStory(clientId);
	}

	public List<Y_QnaVo> searchQna(String clientId) {
		return y_createDao.searchQna(clientId);
	}

	public Y_TravelVo searchTravel(String clientId) {
		return y_createDao.searchTravel(clientId);
	}

	public Y_PhotoVo searchPhoto(String clientId) {
		return y_createDao.searchPhoto(clientId);
	}

	// 하객 축하+감사 쪽지
	public boolean insertMes(Y_MessageVo mesVo) {
		return y_createDao.insertMes(mesVo);
	}

	public List<Y_MessageVo> searchMes(String clientId) {
		return y_createDao.getMes(clientId);
	}

	public boolean insertQues(Y_AskVo quesVo) {
		return y_createDao.insertQues(quesVo);
	}

	public boolean delete(String clientId) {
		boolean result = y_likeDao.delLike(clientId);
		if (result) {
			return y_createDao.delete(clientId);
		}
		return false;
	}
	public int countQna(String clientId) {
		return y_createDao.countQna(clientId);
	}
}
