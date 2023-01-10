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

	public MemberVO usercode_to_One(String user_Id) {
		session = sqlSessionFactory.openSession(true);
		int res = session.update("usercode_to_One", user_Id);
		if(res>0) {System.out.println("코드 업데이트 성공");}
		MemberVO vo=session.selectOne("reLogin", user_Id);
		session.close();
		return vo;
		
	}

	public MemberVO usercode_to_zero(String user_Id) {
		session = sqlSessionFactory.openSession(true);
		int res = session.update("usercode_to_zero", user_Id);
		if(res>0) {System.out.println("코드 업데이트 성공");}
		MemberVO vo=session.selectOne("reLogin", user_Id);
		session.close();
		return vo;
	}

}