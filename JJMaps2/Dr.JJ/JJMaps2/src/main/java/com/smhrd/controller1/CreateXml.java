package com.smhrd.controller1;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dom4j.Document;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.XMLWriter;

import com.smhrd.model1.StoreDAO;
import com.smhrd.model1.StoreVO;

/**
 * Servlet implementation class CreateXml
 */
public class CreateXml extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StoreVO maker = new StoreVO();
		String jdbcDriver = "oracle.jdbc.driver.OracleDriver";
		String jdbcUrl = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
		String userName = "campus_f_1227_3";
		String userPwd = "smhrd3";
		StoreDAO dao = new StoreDAO();
		
			Document document;
			try {
				document = dao.createDocument(jdbcDriver,jdbcUrl,userName,userPwd);
				OutputFormat format = new OutputFormat("\t", true);
				Writer out = new OutputStreamWriter(new FileOutputStream("C:/Users/smhrd/git/repository17/JJMaps2/src/main/webapp/output.xml"), "UTF-8");
				XMLWriter writer = new XMLWriter(out, format);
				writer.write(document);
				out.close();
				RequestDispatcher rdi = request.getRequestDispatcher("Main.jsp");
				rdi.forward(request, response);
			} catch (IOException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	
	}


