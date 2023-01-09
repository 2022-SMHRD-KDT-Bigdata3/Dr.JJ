package com.smhrd.model1;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db1.SqlSessionManager;

public class MemberDAO {

	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	private SqlSession session;

	public MemberVO login(MemberVO vo) {
		session = sqlSessionFactory.openSession(true);
		MemberVO info = null;
		info = session.selectOne("login", vo);
		
		session.close();

		return info;
	}

	public int join(MemberVO vo) {
		session = sqlSessionFactory.openSession(true);
		int res = session.insert("join", vo);
		session.close();
		return res;
	}

}