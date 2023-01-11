package com.smhrd.model1;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db1.SqlSessionManager;

public class MenuDAO {
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	private SqlSession session;
	

	public ArrayList<MenuVO> menuSelect(String store_id){
		session = sqlSessionFactory.openSession(true);
		List<MenuVO> list = null;
		list = session.selectList("menuSelect", store_id);
		session.close();
		return (ArrayList<MenuVO>) list;
	}

	
	public ArrayList<MenuVO> menu_Select_user_id(String user_id) {
		session = sqlSessionFactory.openSession(true);
		List<MenuVO> list = null;
		list = session.selectList("menu_Select_user_id", user_id);
		session.close();
		return (ArrayList<MenuVO>) list;
	}
	
	
	public int MenuInsert(MenuVO vo) {
		session = sqlSessionFactory.openSession(true);
		int res = session.insert("MenuInsert",vo);
		return res;
	}

		
}
