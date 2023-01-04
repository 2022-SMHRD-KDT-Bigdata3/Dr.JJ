package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import java.util.ArrayList;
import java.util.List;

import com.smhrd.db.SqlSessionManager;

public class StoreDAO {
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	private SqlSession session;
	public ArrayList<StoreVO> storeCateSelect(String store_cate) {
		session = sqlSessionFactory.openSession(true);
		List<StoreVO> list =session.selectList("StoreSelect");
		session.close();
		
		return (ArrayList<StoreVO>)list;
	}
	
}
