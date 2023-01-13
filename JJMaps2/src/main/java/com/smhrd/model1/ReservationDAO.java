package com.smhrd.model1;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db1.SqlSessionManager;

public class ReservationDAO {
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	private SqlSession session;
	
	public ArrayList<ReservationVO> selectSreserv(Integer store_id) {
		session = sqlSessionFactory.openSession(true);
		List<ReservationVO> list = session.selectList("ResrvationSelect");
		session.close();
		return(ArrayList<ReservationVO>) list;
		
		
	}

}
