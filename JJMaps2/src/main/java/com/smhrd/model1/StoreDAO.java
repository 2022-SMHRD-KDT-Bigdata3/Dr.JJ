package com.smhrd.model1;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import com.smhrd.db1.SqlSessionManager;


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

	public StoreVO mystoreselect(String user_Id) {
		session = sqlSessionFactory.openSession(true);
		StoreVO vo = session.selectOne("mystoreselect",user_Id); 
		session.close();
		return vo;
	}

	public int StoreDelete(String user_Id) {
		session = sqlSessionFactory.openSession(true);
		int res = session.delete("storeDelete",user_Id); 
		session.close();
		return res;
		
	}
	public static Document createDocument(String jdbcDriver, String jdbcUrl, String userName,  String userPwd) {
		Document document = DocumentHelper.createDocument();
		Element root = document.addElement("stores");
		StoreDAO dao = new StoreDAO();
		ArrayList<StoreVO> storeList = dao.getStoreList(jdbcDriver,jdbcUrl, userName, userPwd);
		try {
			for(int i=0; i<storeList.size();i++) {
				Element superNod = root.addElement("stores");
				StoreVO maker = storeList.get(i);
				
				superNod.addAttribute("store_id",  Integer.toString(maker.getStore_Id()));
				superNod.addAttribute("store_name", maker.getStore_Name());
				superNod.addAttribute("store_addr", maker.getStore_Addr());
				superNod.addAttribute("store_tel", maker.getStore_Tel());
				superNod.addAttribute("store_open_dt", maker.getStore_Open_Dt());
				superNod.addAttribute("store_close_dt", maker.getStore_Close_Dt());
				superNod.addAttribute("store_card_yn", Integer.toString(maker.getStore_Card_Yn()));
				superNod.addAttribute("store_status", Integer.toString(maker.getStore_Status()));
				superNod.addAttribute("store_cate", maker.getStore_Cate());
				superNod.addAttribute("latitude", Double.toString(maker.getLatitude()));
				superNod.addAttribute("longitude", Double.toString(maker.getLongitude()));
			}
			System.out.println("출력완료");
		}catch(Exception e){
			System.out.println("createDocument 메서드 에러 유발");
		}
		return document;
	}
	public static ArrayList<StoreVO> getStoreList(String jdbcDriver, String jdbcUrl, String userName,  String userPwd) {
		ArrayList<StoreVO> storeList = new ArrayList<StoreVO>();
		Connection con = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		try {
			Driver driver = (Driver) Class.forName(jdbcDriver).newInstance();
			con = DriverManager.getConnection(jdbcUrl, userName, userPwd);
			String sql = "select * from stores";
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {
				StoreVO store = new StoreVO();
				store.setStore_Id(rs.getInt("store_id"));
				store.setStore_Name(rs.getString("store_name"));
				store.setStore_Addr(rs.getString("store_addr"));
				store.setStore_Tel(rs.getString("store_tel"));
				store.setStore_Open_Dt(rs.getString("store_open_dt"));
				store.setStore_Close_Dt(rs.getString("store_close_dt"));
				store.setStore_Card_Yn(rs.getInt("store_card_yn"));
				store.setStore_Status(rs.getInt("store_status"));
				store.setStore_Cate(rs.getString("store_cate"));
				store.setLatitude(rs.getDouble("latitude"));
				store.setLongitude(rs.getDouble("longitude"));
				storeList.add(store);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return storeList;
	}

	public Integer getStoreId(String user_id) {
		session = sqlSessionFactory.openSession(true);
		StoreVO vo = session.selectOne("mystoreselect",user_id); 
		session.close();
		Integer store_id =  vo.getStore_Id();
		return store_id;
	}

	public StoreVO store_Select_Storeid(int store_id) {
		session = sqlSessionFactory.openSession(true);
		StoreVO vo = session.selectOne("store_Select_Storeid", store_id);
		return vo;
	}

	
	
}
