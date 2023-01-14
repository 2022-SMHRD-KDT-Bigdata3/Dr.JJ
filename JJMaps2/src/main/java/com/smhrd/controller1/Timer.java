package com.smhrd.controller1;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Timer extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//픽업시간 
		int ptime = Integer.parseInt(request.getParameter("ptime"));
		//예약시간
		int rtime = Integer.parseInt(request.getParameter("rtime"));
		
		//현재시간 가져오기
	    Date nowTime = new Date(); 
	    SimpleDateFormat sf = new SimpleDateFormat("HH:mm");
	    String time=sf.format(nowTime).toString();
	    int now_h = Integer.parseInt(time.substring(0, 2));
	    int now_m = Integer.parseInt(time.substring(3)); 
	    int now=((now_h*60)+now_m);
		
	    
	    int prograss_fulltime = (ptime-rtime);
	    int prograss_per = ((ptime-now)/prograss_fulltime)*100;
	    int[] prograss = {prograss_per ,prograss_fulltime-(ptime-now) };
	    
	    
	    PrintWriter out = response.getWriter();
		
		if(prograss_per > 0) {
			System.out.println("중복된 회원이 존재함");
			//json에서 키 값은 무조건 string 이기 때문에 문자열 안에 
			// {"idcheck" : "NO" } 라고 print 안에 적으려면 역슬래시 활용하여 이스케이프 코드 사용하여야 한다.  
			out.print("{\"prograss\" : prograss}");
		}else {
			System.out.println("중복된 회원이 존재하지 않음");
			out.print("{\"prograss_now\" : 0}");
		}
		


	}

}
