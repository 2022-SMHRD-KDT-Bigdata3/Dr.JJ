package com.smhrd.model1;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db1.SqlSessionManager;

import Geocoder.Geocoder;

import java.util.ArrayList;
import java.util.List;


public class StoreDAO {
	
	
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	private SqlSession session;
	
	public ArrayList<StoreVO> storeCateSelect(String store_cate) {
		session = sqlSessionFactory.openSession(true);
		List<StoreVO> list = session.selectList("StoreSelect");
		session.close();

		return (ArrayList<StoreVO>) list;
	}

	public ArrayList<StoreVO> search(String keyword) {

		session = sqlSessionFactory.openSession(true);
		List<StoreVO> list = session.selectList("search", keyword);
		session.close();
		return (ArrayList<StoreVO>) list;

	}

	public int StoreJoin(StoreVO vo) {
		
		session = sqlSessionFactory.openSession(true);
		int res = session.insert("storejoin",vo); 
		session.close();
		return res;
	}
	
}
