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
			Writer out = new OutputStreamWriter(new FileOutputStream("D:/output.xml"),"UTF-8");
			XMLWriter writer = new XMLWriter(out, format);
			writer.write(document);
			out.close();
		}catch(IOException e) {
			e.printStackTrace();
		}catch(Exception e) {
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
				
				superNod.addAttribute("store_id", maker.getStoreId());
				superNod.addAttribute("store_name", maker.getStoreName());
				superNod.addAttribute("store_addr", maker.getStoreAddr());
				superNod.addAttribute("store_tel", maker.getStoreTel());
				superNod.addAttribute("store_open_dt", maker.getStoreOpenDt());
				superNod.addAttribute("store_open_dt", maker.getStoreCloseDt());
				superNod.addAttribute("store_card_yn", Integer.toString(maker.getStoreCardYn()));
				superNod.addAttribute("store_status", Integer.toString(maker.getStoreStatus()));
				superNod.addAttribute("store_cate", maker.getStoreCate());
				
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
		ResultSet rs =  null;
		try {
			Driver driver = (Driver)Class.forName(jdbcDriver).newInstance();
			con = DriverManager.getConnection(jdbcUrl, userName, userPwd);
			String sql = "select * from stores";
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				StoreVO store =new StoreVO();
				store.setStoreId(rs.getString("store_id"));
				store.setStoreName(rs.getString("store_name"));
				store.setStoreAddr(rs.getString("store_addr"));
				store.setStoreTel(rs.getString("store_tel"));
				store.setStoreOpenDt(rs.getString("store_open_dt"));
				store.setStoreCloseDt(rs.getString("store_close_dt"));
				store.setStoreCardYn(rs.getInt("store_card_yn"));
				store.setStoreStatus(rs.getInt("store_status"));
				store.setStoreCate(rs.getString("store_cate"));
				
				storeList.add(store);
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return storeList;
	}


}

