package com.kh.mw.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mw.vo.Y_LikeVo;

@Repository
public class Y_LikeDao {
	private final String NAMESPACE_L = "mappers.like.";
	@Autowired
	private SqlSession sqlsession;

	public boolean sendLike(Y_LikeVo likeVo) {
		System.out.println("like Y_LikeDao:" + likeVo);
		int count = sqlsession.insert(NAMESPACE_L + "sendLike", likeVo);
		System.out.println("like dao: " + count);
		if (count > 0) {
			return true;
		}
		return false;
	}

	public int getLikeCount(int qno) {
		return sqlsession.selectOne(NAMESPACE_L + "getLikeCount", qno);
	}

	public int isLike(Y_LikeVo likeVo) {
		return sqlsession.selectOne(NAMESPACE_L + "isLike", likeVo);
	}

	public boolean delLike(String clientId) {
		int count = sqlsession.delete(NAMESPACE_L + "delLike", clientId);
		if (count > 0) {
			return true;
		}
		return false;
	}

}
