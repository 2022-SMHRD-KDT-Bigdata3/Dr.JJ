package com.smhrd.model1;

import java.util.ArrayList;
import java.util.List;

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


	public ArrayList<ReserveDetailsVO> reserve_detail_select(Long r_Number) {
		session=sqlSessionFactory.openSession(true);
		 List<ReserveDetailsVO> r_Details_list = session.selectList("reserve_detail_select", r_Number);
		session.close();
		return (ArrayList<ReserveDetailsVO>)r_Details_list;
	}
	
}
