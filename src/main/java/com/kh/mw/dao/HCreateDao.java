package com.kh.mw.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

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


@Repository
public class HCreateDao {
	private final String NAMESPACE = "mappers.create.";
	
	// @Inject
	@Autowired
	private SqlSession sqlSession;
	
	// 아이디로 정보 얻어오기 - H_TempPhotosVo
	public H_TempPhotosVo getTpVo(String userid) {
		H_TempPhotosVo tpVo = sqlSession.selectOne(NAMESPACE+"getTpVo", userid);
		return tpVo;
	}
	
	// 아이디로 정보 얻어오기 - H_HomeVo
	public H_HomeVo getHvo(String userid) {
		H_HomeVo hVo = sqlSession.selectOne(NAMESPACE+"getHvo", userid);
		return hVo;
	}
	
	// h_no로 정보 얻어오기 - H_HomeScheduleVo
	public List<H_HomeScheduleVo> getList_hsVo(int h_no) {
		List<H_HomeScheduleVo> list_hsVo = sqlSession.selectList(NAMESPACE+"getList_hsVo", h_no);
		return list_hsVo;
	}
	
	// 아이디로 정보 얻어오기 - H_OurstoryVo
	public H_OurstoryVo getOvo(String userid) {
		H_OurstoryVo oVo = sqlSession.selectOne(NAMESPACE+"getOvo", userid);
		return oVo;
	}
	
	// 아이디로 정보 얻어오기 - H_PhotosVo
	public H_PhotosVo getPvo(String userid) {
		H_PhotosVo pVo = sqlSession.selectOne(NAMESPACE+"getPvo", userid);
		return pVo;
	}
	
	// p_no로 정보 얻어오기 - H_PhotosDataVo
	public List<H_PhotosDataVo> getList_pdVo(int p_no) {
		List<H_PhotosDataVo> list_pdVo = sqlSession.selectList(NAMESPACE+"getList_pdVo", p_no);
		return list_pdVo;
	}
	
	// 아이디로 정보 얻어오기 - H_QnaVo
	public H_QnaVo getQvo(String userid) {
		H_QnaVo qVo = sqlSession.selectOne(NAMESPACE+"getQvo", userid);
		return qVo;
	}
	
	// q_no로 정보 얻어오기 - H_QnaDataVo
	public List<H_QnaDataVo> getList_qdVo(int q_no) {
		List<H_QnaDataVo> list_qdVo = sqlSession.selectList(NAMESPACE+"getList_qdVo", q_no);
		return list_qdVo;
	}
	
	// 아이디로 정보 얻어오기 - H_TravelVo
	public H_TravelVo getTvo(String userid) {
		H_TravelVo tVo = sqlSession.selectOne(NAMESPACE+"getTvo", userid);
		return tVo;
	}
	
	// 프로젝트 정보 입력 처리
	@Transactional
	public boolean insertRun(H_TempPhotosVo tpVo, H_HomeVo hVo, 
			List<H_HomeScheduleVo> list_hsVo, H_OurstoryVo oVo, 
			H_PhotosVo pVo, List<H_PhotosDataVo> list_pdVo, 
			H_QnaVo qVo, List<H_QnaDataVo> list_qdVo, H_TravelVo tVo) {
		
		// int count
		int count_tpVo = sqlSession.insert(NAMESPACE+"insert_tpVo", tpVo);
		
		int count_hVo = sqlSession.insert(NAMESPACE+"insert_hVo", hVo);
		int[] arr_count_hsVo = new int[list_hsVo.size()];
		for (int i = 0; i < list_hsVo.size(); i++) {
			int count_hsVo = sqlSession.insert(
					NAMESPACE+"insert_hsVo", list_hsVo.get(i));
			arr_count_hsVo[i] = count_hsVo;
		}
		
		int count_oVo = sqlSession.insert(NAMESPACE+"insert_oVo", oVo);
		
		int count_pVo = sqlSession.insert(NAMESPACE+"insert_pVo", pVo);
		int[] arr_count_pdVo = new int[list_pdVo.size()];
		for (int i = 0; i < list_pdVo.size(); i++) {
			int count_pdVo = sqlSession.insert(
					NAMESPACE+"insert_pdVo", list_pdVo.get(i));
			arr_count_pdVo[i] = count_pdVo;
		}
		
		int count_qVo = sqlSession.insert(NAMESPACE+"insert_qVo", qVo);
		int[] arr_count_qdVo = new int[list_qdVo.size()];
		for (int i = 0; i < list_qdVo.size(); i++) {
			int count_qdVo = sqlSession.insert(
					NAMESPACE+"insert_qdVo", list_qdVo.get(i));
			arr_count_qdVo[i] = count_qdVo;
		}
		
		int count_tVo = sqlSession.insert(NAMESPACE+"insert_tVo", tVo);
		
		int count_hsVo = 0;
		for (int i = 0; i < arr_count_hsVo.length; i++) {
			if (arr_count_hsVo[i] == 0) {
				count_hsVo = 0;
				break;
			} else {count_hsVo = 1;}
		}
		
		int count_pdVo = 0;
		for (int i = 0; i < arr_count_pdVo.length; i++) {
			if (arr_count_pdVo[i] == 0) {
				count_pdVo = 0;
				break;
			} else {count_pdVo = 1;}
		}
		
		int count_qdVo = 0;
		for (int i = 0; i < arr_count_qdVo.length; i++) {
			if (arr_count_qdVo[i] == 0) {
				count_qdVo = 0;
				break;
			} else {count_qdVo = 1;}
		}
		
		// 모든 vo insert 성공시 true 리턴
		if (count_tpVo>0 && count_hVo>0 && count_hsVo>0 && count_oVo>0 && 
				count_pVo>0 && count_pdVo>0 && count_qVo>0 && count_qdVo>0 && count_tVo>0) {
			return true;
		} else { return false; }
	}
	
	public int getNextVal_h() {
		int nextVal_h = sqlSession.selectOne(NAMESPACE+"getNextVal_h");
		return nextVal_h;
	}
	
	public int getNextVal_p() {
		int nextVal_p = sqlSession.selectOne(NAMESPACE+"getNextVal_p");
		return nextVal_p;
	}
	
	public int getNextVal_q() {
		int nextVal_q = sqlSession.selectOne(NAMESPACE+"getNextVal_q");
		return nextVal_q;
	}
	
	public int getH_no(String userid) {
		int h_no = sqlSession.selectOne(NAMESPACE+"getH_no", userid);
		return h_no;
	}
	
	public int getP_no(String userid) {
		int p_no = sqlSession.selectOne(NAMESPACE+"getP_no", userid);
		return p_no;
	}
	
	public int getQ_no(String userid) {
		int q_no = sqlSession.selectOne(NAMESPACE+"getQ_no", userid);
		return q_no;
	}

	// Pjnum 갱신
	public boolean updatePjnum(UserVo userVo) {
		int count = sqlSession.update(NAMESPACE+"updatePjnum", userVo);
		if (count>0) {
			return true;
		} else { return false; }
	}
	
	// 프로젝트 삭제
	@Transactional
	public boolean removeProject(String userid, int h_no, int p_no, int q_no) {
		// int count
		int count_tpVo = sqlSession.delete(NAMESPACE+"remove_tpVo", userid);
		int count_hVo = sqlSession.delete(NAMESPACE+"remove_hVo", userid);
		int count_hsVo = sqlSession.delete(NAMESPACE+"remove_hsVo", h_no);
		int count_oVo = sqlSession.delete(NAMESPACE+"remove_oVo", userid);
		int count_pVo = sqlSession.delete(NAMESPACE+"remove_pVo", userid);
		int count_pdVo = sqlSession.delete(NAMESPACE+"remove_pdVo", p_no);
		int count_qVo = sqlSession.delete(NAMESPACE+"remove_qVo", userid);
		int count_qdVo = sqlSession.delete(NAMESPACE+"remove_qdVo", q_no);
		int count_tVo = sqlSession.delete(NAMESPACE+"remove_tVo", userid);
		
		// 모든 vo 삭제 성공시 true 리턴
		if (count_tpVo>0 && count_hVo>0 && count_hsVo>0 && count_oVo>0 && 
				count_pVo>0 && count_pdVo>0 && count_qVo>0 && count_qdVo>0 && count_tVo>0) {
			return true;
		} else { return false; }
	}
	
}
