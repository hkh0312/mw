package com.kh.mw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.mw.dao.HCreateDao;
import com.kh.mw.vo.H_HomeScheduleVo;
import com.kh.mw.vo.H_HomeVo;
import com.kh.mw.vo.H_OurstoryVo;
import com.kh.mw.vo.H_PhotosDataVo;
import com.kh.mw.vo.H_PhotosVo;
import com.kh.mw.vo.H_QnaDataVo;
import com.kh.mw.vo.H_QnaVo;
import com.kh.mw.vo.H_TempPhotosVo;
import com.kh.mw.vo.H_TravelVo;
import com.kh.mw.vo.UserVo;

@Service
public class HCreateService {
	
	@Autowired
	private HCreateDao createDao;
	
	// 아이디로 정보 얻어오기 - H_TempPhotosVo
	public H_TempPhotosVo getTpVo(String userid) {
		H_TempPhotosVo tpVo = createDao.getTpVo(userid);
		return tpVo;
	}
	
	// 아이디로 정보 얻어오기 - H_HomeVo
	public H_HomeVo getHvo(String userid) {
		H_HomeVo hVo = createDao.getHvo(userid);
		return hVo;
	}
	
	// h_no로 정보 얻어오기 - H_HomeScheduleVo
	public List<H_HomeScheduleVo> getList_hsVo(int h_no) {
		List<H_HomeScheduleVo> list_hsVo = createDao.getList_hsVo(h_no);
		return list_hsVo;
	}
	
	// 아이디로 정보 얻어오기 - H_OurstoryVo
	public H_OurstoryVo getOvo(String userid) {
		H_OurstoryVo oVo = createDao.getOvo(userid);
		return oVo;
	}
	
	// 아이디로 정보 얻어오기 - H_PhotosVo
	public H_PhotosVo getPvo(String userid) {
		H_PhotosVo pVo = createDao.getPvo(userid);
		return pVo;
	}
	
	// p_no로 정보 얻어오기 - H_PhotosDataVo
	public List<H_PhotosDataVo> getList_pdVo(int p_no) {
		List<H_PhotosDataVo> list_pdVo = createDao.getList_pdVo(p_no);
		return list_pdVo;
	}
	
	// 아이디로 정보 얻어오기 - H_QnaVo
	public H_QnaVo getQvo(String userid) {
		H_QnaVo qVo = createDao.getQvo(userid);
		return qVo;
	}
	
	// q_no로 정보 얻어오기 - H_QnaDataVo
	public List<H_QnaDataVo> getList_qdVo(int q_no) {
		List<H_QnaDataVo> list_qdVo = createDao.getList_qdVo(q_no);
		return list_qdVo;
	}
	
	// 아이디로 정보 얻어오기 - H_TravelVo
	public H_TravelVo getTvo(String userid) {
		H_TravelVo tVo = createDao.getTvo(userid);
		return tVo;
	}
	
	// 나만의 페이지에 넣을 정보 입력
	@Transactional
	public boolean insertRun(H_TempPhotosVo tpVo, H_HomeVo hVo, 
			List<H_HomeScheduleVo> list_hsVo, H_OurstoryVo oVo, 
			H_PhotosVo pVo, List<H_PhotosDataVo> list_pdVo, 
			H_QnaVo qVo, List<H_QnaDataVo> list_qdVo, H_TravelVo tVo) {
		
		int nextVal_h = createDao.getNextVal_h();
		hVo.setH_no(nextVal_h);
		for (H_HomeScheduleVo hsVo : list_hsVo) {
			hsVo.setH_no(nextVal_h);
		}
		
		int nextVal_p = createDao.getNextVal_p();
		pVo.setP_no(nextVal_h);
		for (H_PhotosDataVo pdVo : list_pdVo) {
			pdVo.setP_no(nextVal_p);
		}
		
		int nextVal_q = createDao.getNextVal_q();
		qVo.setQ_no(nextVal_h);
		for (H_QnaDataVo qdVo : list_qdVo) {
			qdVo.setQ_no(nextVal_q);
		}
		
		boolean result = createDao.insertRun(tpVo, hVo, list_hsVo, oVo, 
				pVo, list_pdVo, qVo, list_qdVo, tVo);
		return result;
	}
	
	// 프로젝트 삭제
	@Transactional
	public boolean removeProject(String userid) {
		int h_no = createDao.getH_no(userid);
		int p_no = createDao.getP_no(userid);
		int q_no = createDao.getQ_no(userid);
		boolean result = createDao.removeProject(userid, h_no, p_no, q_no);
		return result;
	}
	
	// Pjnum 갱신
	public boolean updatePjnum(UserVo userVo) {
		boolean result = createDao.updatePjnum(userVo);
		return result;
	}
	
}
