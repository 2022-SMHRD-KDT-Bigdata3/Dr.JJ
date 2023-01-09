package com.smhrd.model1;

import java.io.*;
import java.util.*;
import java.sql.*;
import org.dom4j.*;
import org.dom4j.io.*;

public class CreateXML {

	private StoreVO maker = new StoreVO();
	private static String jdbcDriver = "oracle.jdbc.driver.OracleDriver";
	private static String jdbcUrl = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
	private static String userName = "campus_f_1227_3";
	private static String userPwd = "smhrd3";

	public static void main(String[] args) {
		Document document;
		try {
			document = createDocument();
			OutputFormat format = new OutputFormat("\t", true);
			Writer out = new OutputStreamWriter(new FileOutputStream("D:/output.xml"), "UTF-8");
			XMLWriter writer = new XMLWriter(out, format);
			writer.write(document);
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private static Document createDocument() {
		Document document = DocumentHelper.createDocument();
		Element root = document.addElement("stores");
		
		ArrayList<StoreVO> storeList = getStoreList();
		try {
			for(int i=0; i<storeList.size();i++) {
				Element superNod = root.addElement("stores");
				StoreVO maker = storeList.get(i);
				
				superNod.addAttribute("store_id", maker.getStore_Id());
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

	private static ArrayList<StoreVO> getStoreList() {
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
				store.setStore_Id(rs.getString("store_id"));
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

}
