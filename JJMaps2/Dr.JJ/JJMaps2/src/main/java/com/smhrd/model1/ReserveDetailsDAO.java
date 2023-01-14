package com.smhrd.model1;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db1.SqlSessionManager;

public class ReserveDetailsDAO {

	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	private SqlSession session;
	
	
	public int reserve_menu_insert(ReserveDetailsVO r_d_VO) {
		session=sqlSessionFactory.openSession(true);
		int res = session.insert("reserve_menu_insert", r_d_VO);
		session.close();
		return res;
	}
	public ReserveDetailsVO storeReservation(Long r_number){
		session=sqlSessionFactory.openSession(true);
		ReserveDetailsVO vo = session.selectOne("store_reservation",r_number);
		session.close();
		return vo;
	}
	
	
}
