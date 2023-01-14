package com.smhrd.model1;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db1.SqlSessionManager;

public class ReservationDAO {
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	private SqlSession session;
	
//	public ArrayList<ReservationVO> selectSreserv(Integer store_id) {
//		session = sqlSessionFactory.openSession(true);
//		List<ReservationVO> list = session.selectList("ResrvationSelect");
//		session.close();
//		return(ArrayList<ReservationVO>) list;
//		
//		
//	}

	public int create_r_num(ReservationVO rVo) {
		session = sqlSessionFactory.openSession(true);
		int res = session.insert("create_r_num",rVo);
		if(res>0) {System.out.println("예약등록 성공");}
		session.close();
		return res;
	}


	public ReservationVO select_reseve_by_rnum(Long r_Number) {
		
		session = sqlSessionFactory.openSession(true);
		ReservationVO now_reserve = session.selectOne("select_reseve_by_rnum",r_Number);
		session.close();
		return now_reserve;
	}

	public ReservationVO r_num_select(ReservationVO rVo) {
		session = sqlSessionFactory.openSession(true);
		ReservationVO ReservationVOs = session.selectOne("r_num_select",rVo);
		session.close();
		return ReservationVOs;
	}
	
	
	
	

}
