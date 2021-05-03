//package project_ezen;
//
//import java.io.IOException;
//import java.util.ArrayList;
//
//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//@WebServlet(urlPatterns= {"/", "*.do"})
//public class MyController_B extends HttpServlet {
//
//	@Override
//	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		doProcess(req, resp);
//	}
//
//	@Override
//	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		doProcess(req, resp);
//	}	
//	
//	void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		
//		request.setCharacterEncoding("UTF-8");
//		
//		String requestURI = request.getRequestURI();
//		int cmdIdx = requestURI.lastIndexOf("/")+1;
//		String command = requestURI.substring(cmdIdx);
//		String jspPage = "";
//		
//		System.out.println("command:"+command);
//		
//		//화면이 있음
//		if(command.equals("") || command.equals("/"))
//		{
//			response.sendRedirect("main.do");
//		}
//		
//		else if(command.equals("main.do")) { //메인 페이지
////			아래 주석은 메인 페이지에 정보 가져올 때의 예시
////	        ArrayList<BoardDto> list = BoardDao.list(); 
////	        request.setAttribute("list", list);
//			
//			
////			response.sendRedirect("main.jsp");
//			jspPage = "/main.jsp";
//		}
//		
//
//		if( !jspPage.equals("") ) { //jsp페이지가 비어있지 않다면,
//			RequestDispatcher dispatcher = request.getRequestDispatcher( jspPage );
//			dispatcher.forward(request, response);
//		}
//	}
//	
//	
//}