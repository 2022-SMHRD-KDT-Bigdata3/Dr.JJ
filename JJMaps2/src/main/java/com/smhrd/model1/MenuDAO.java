package com.smhrd.model1;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db1.SqlSessionManager;

public class MenuDAO {
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	private SqlSession session;
	public int menuInsert(MenuVO vo) {
		session = sqlSessionFactory.openSession(true);
		int res = 0;
		
		res = session.insert("messageInsert",vo);
		
		return res;
		
	}
	
	public ArrayList<MenuVO> menuSelect(String store_id){
		session = sqlSessionFactory.openSession(true);
		List<MenuVO> list = null;
		list = session.selectList("menuSelect", store_id);
		session.close();
		return (ArrayList<MenuVO>) list;
	}
}
