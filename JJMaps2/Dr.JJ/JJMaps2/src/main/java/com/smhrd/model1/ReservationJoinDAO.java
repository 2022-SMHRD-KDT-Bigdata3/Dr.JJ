package com.smhrd.model1;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db1.SqlSessionManager;

public class ReservationJoinDAO {
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	private SqlSession session;
	public ArrayList<ReservationJoinVO> AllbyR(Long r_number) {
		session = sqlSessionFactory.openSession(true);
		List<ReservationJoinVO> list= session.selectList("AllbyR",r_number);
		session.close();
		return (ArrayList<ReservationJoinVO>) list;
	}
	

}
