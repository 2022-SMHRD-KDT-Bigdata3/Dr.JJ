package com.smhrd.model1;

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
}
