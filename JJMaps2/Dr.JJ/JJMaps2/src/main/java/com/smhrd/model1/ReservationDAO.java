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

	public Long create_r_num(ReservationVO rVo) {
		session = sqlSessionFactory.openSession(true);
		int res = session.insert("insert_Reserve",rVo);
		if(res>0) {System.out.println("예약등록 성공");}
		Long r_number = session.selectOne("r_num_select",rVo);
		session.close();
		return r_number;
	}
	public ArrayList<Long> rnumSelect(Integer store_id) {
		session = sqlSessionFactory.openSession(true);
		List<Long> list = session.selectList("r_num_select",store_id);
		session.close();
		return (ArrayList<Long>) list;
	}

}
