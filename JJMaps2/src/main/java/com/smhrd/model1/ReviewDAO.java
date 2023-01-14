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
	public ArrayList<ReviewVO> myReview(String user_Id){
		session = sqlSessionFactory.openSession(true);
		List<ReviewVO> list = null;
		list = session.selectList("myReview", user_Id);
		session.close();
		return (ArrayList<ReviewVO>) list;
	}
	public Double avgScores(Integer store_id){
		session = sqlSessionFactory.openSession(true);
		List<ReviewVO> list = null;
		list = session.selectList("scores", store_id);
		session.close();
		list = (ArrayList<ReviewVO>) list;
		Double sum = 0.0;
		Double avg = 0.0;
		for(int i=0; i< list.size();i++) {
			sum += list.get(i).getReviewScore();
		}
		avg = sum/list.size();
		return avg;
	}
	public int insert(ReviewVO vo) {
		session = sqlSessionFactory.openSession(true);
		int res = session.insert("writereview",vo);
		session.close();
		return res;
	}
}
