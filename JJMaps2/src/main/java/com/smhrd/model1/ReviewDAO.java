package com.smhrd.model1;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db1.SqlSessionManager;



public class ReviewDAO {
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	private SqlSession session;
	
	

	public int writereview(ReviewVO vo) {
		session = sqlSessionFactory.openSession(true);
		int res = session.insert("writereview", vo);
		session.close();
		return res;
	}
	public ArrayList<ReviewVO> myReview(String user_id){
		session = sqlSessionFactory.openSession(true);
		List<ReviewVO> list = null;
		list = session.selectList("myReview", user_id);
		session.close();
		return (ArrayList<ReviewVO>) list;
	}
}
