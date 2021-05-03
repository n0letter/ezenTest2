package project_ezen;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.FaqDao;
import dao.InquiryDao;
import dao.MemberDao;
import dao.OutMemberDao;
import dao.PayDao;
import dao.schedule2Dao;
import dao.scheduleDao;
import dto.FaqDto;
import dto.InquiryDto;
import dto.MemberDto;
import dto.OutMemberDto;
import dto.PayDto;
import dto.schedule2Dto;
import dto.scheduleDto;

@WebServlet(urlPatterns = { "/", "*.do" })
public class MyController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String requestURI = request.getRequestURI();
		int cmdIdx = requestURI.lastIndexOf("/") + 1;
		String command = requestURI.substring(cmdIdx);
		String jspPage = "";

		System.out.println("command:" + command);

		if (command.equals("") || command.equals("/")) {
			response.sendRedirect("main.do");
		}

		else if (command.equals("main.do")) { // 메인 페이지
			//메인페이지 스케줄 정보 불러오기
			scheduleDto dto = scheduleDao.scheduleViewmain(request);
			request.setAttribute("dto", dto);
			
			schedule2Dto dto2 = schedule2Dao.scheduleViewmain2(request);
			request.setAttribute("dto2", dto2);			

			jspPage = "/main.jsp";
		}

		
		
		// MyController.java

		// 약관 동의 액션 - hidden인 member_agree에 value값(Y, N) 주는 동작
		else if (command.equals("agreement.do")) {
			String marketing = request.getParameter("marketing");
			System.out.println("marketing Y N : " + marketing);

			if (marketing == null) {
				marketing = "N";
			}
			HttpSession session = request.getSession();
			session.setAttribute("check_agree", marketing);
//			RequestDispatcher dispatcher = request.getRequestDispatcher("/member/joinForm.jsp");
//			dispatcher.forward(request, response);
			response.sendRedirect("/project_ezen/member/joinForm.jsp");
		}
		// 회원가입액션
		else if (command.equals("JoinAction.do")) {

			request.setCharacterEncoding("UTF-8");
			MemberDao.insertMember(request);

			response.sendRedirect("main.do");
		}
		// 아이디 중복 체크
		else if (command.equals("idCheckAjax.do")) {

			int result = 0;
			try {
				result = MemberDao.idCheck(request);
			} catch (Exception e) {
				e.printStackTrace();
			}

			if (result == 1) { // 아이디 중복됨
				response.getWriter().print("1");
			} else {
				response.getWriter().print("0");
			}

		}
		// 로그인 액션
		else if(command.equals("login.do")) { 
			request.setCharacterEncoding("UTF-8");

			String login_referer = request.getParameter("login_referer");
			System.out.println("login_referer :" + login_referer);

			HttpSession session = request.getSession();
			
			int loginResult = 0;
			try {
				loginResult = MemberDao.login(request);
				System.out.println("loginResult : " + loginResult);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			if(loginResult == 2) {
				
				response.sendRedirect("/project_ezen/admin_member/pageFile.jsp");
			}
			else if (loginResult == 1) {

				response.sendRedirect(login_referer); 
				 
			} else {
				session.setAttribute("loginResult", loginResult);
				System.out.println("loginResult2 : " + loginResult);

				response.sendRedirect("/project_ezen/member/loginForm.jsp");

			}

		}	
		//마이페이지 
		else if(command.equals("Mypage.do")) { 
			
			//DTO 레코드 정보
			MemberDto dto = MemberDao.Mypage( request );
			request.setAttribute("dto", dto);
			
			jspPage = "/mypage/Mypage.jsp";
		}
		//관리자 메인 페이지 - 회원 목록
		else if (command.contains("member_list.do")) { 
			int page = Integer.parseInt(request.getParameter("page"));
			int pageSize = 2;// 한페이지에 나오는 게시물 개수
			int pageGroupSize = 3; // 페이지 번호가 몇개 나오느냐 개수
//			int startRow = (page - 1) * pageSize + 1; //한 페이지의 시작글 번호
//			int endRow = startRow + pageSize - 1; //한 페이지의 마지막 글번호
			System.out.println("콘트롤러:"+page);
	        
			ArrayList<MemberDto> member_list = MemberDao.member_list(page); 
	        
	        int memberCount = MemberDao.member_count();//게시물 총 개수
	        System.out.println("memberCount:"+memberCount);
	       
	        int pageGroupCount = memberCount / (pageSize * pageGroupSize) 
	        		+ (memberCount % (pageSize * pageGroupSize) == 0 ? 0 : 1);//총 그룹개수
	        int nowPageGroup = (int) Math.ceil((double) page / pageGroupSize); //현재 그룹페이지 번호
	        
//	        request.setAttribute("startRow", startRow);
//	        request.setAttribute("endRow", endRow);
	        request.setAttribute("member_list", member_list);
	        request.setAttribute("pageSize", pageSize);
	        request.setAttribute("pageGroupSize", pageGroupSize);
	        request.setAttribute("memberCount", memberCount);
	        request.setAttribute("pageGroupCount", pageGroupCount);
	        request.setAttribute("nowPageGroup", nowPageGroup);
	        
			jspPage = "/admin_member/member_list.jsp";
		}
		//아이디 찾기 액션
		else if(command.equals("idFind.do"))
		{
			String id_find_failed = null;
			try 
			{
//				String member_name = request.getParameter("find_name");
//				String member_email = request.getParameter("find_mail01");
//				System.out.println("name : "+member_name);
//				System.out.println("email : "+member_email);
				
				id_find_failed = MemberDao.idFind(request);
				
			} 
			catch (Exception e) 
			{
				e.printStackTrace();
			}
			if(id_find_failed.equals("failed")) {
				request.setAttribute("id_find_failed", id_find_failed);
				
				jspPage = "/member/find_id_pw.jsp";
			} else {
//				RequestDispatcher dispatcher = request.getRequestDispatcher("/member/find_id_pw.jsp");
//				dispatcher.forward(request, response);
				//위의 코드로 페이지 이동시키면 뒤로가기 연타 시 세션 문제가 발생하므로 아래처럼 보내줘야 함 
				response.sendRedirect("/project_ezen/member/find_id_pw.jsp");
			}
		}
		//찾은 아이디 넘기기
		else if (command.equals("id_move")) {
			String finded_id = request.getParameter("finded_id");
			System.out.println("finded_id : " + finded_id);

//			request.setAttribute("finded_id", finded_id);

			HttpSession session = request.getSession();
			session.setAttribute("finded_id",finded_id);
//			RequestDispatcher dispatcher = request.getRequestDispatcher("/member/loginForm.jsp");
//			dispatcher.forward(request, response);
			response.sendRedirect("/project_ezen/member/loginForm.jsp");
		}
		//비밀번호 찾기 액션
		else if(command.equals("find_pw.do"))
		{
			String pw_find_failed = null;
			try 
			{
				String member_id = request.getParameter("find_id");
				String member_email = request.getParameter("find_mail02");
				System.out.println("name : "+member_id);
				System.out.println("email : "+member_email);
				
				pw_find_failed = MemberDao.find_pw(request);
				
			} 
			catch (Exception e) 
			{
				e.printStackTrace();
			}
			if(pw_find_failed.equals("failed")) {
				request.setAttribute("pw_find_failed", pw_find_failed);
				
				jspPage = "/member/find_id_pw.jsp";
			} else {
//				RequestDispatcher dispatcher = request.getRequestDispatcher("/member/find_id_pw.jsp");
//				dispatcher.forward(request, response);
				//위의 코드로 페이지 이동시키면 뒤로가기 연타 시 세션 문제가 발생하므로 아래처럼 보내줘야 함 
				response.sendRedirect("/project_ezen/member/find_id_pw.jsp");
			}
		}		
		//관리자 페이지 - 회원 개인 정보 상세 페이지 보기
		else if(command.equals("member_view.do")) { 
			
			//DTO 레코드 정보
			MemberDto dto = MemberDao.admin_member_view( request );
			request.setAttribute("dto", dto);
			
//			request.setAttribute("member_gender", dto.getMember_gender());
//			request.setAttribute("member_email_receive", dto.getMember_email_receive());
//			request.setAttribute("member_agree", dto.getMember_agree());
//			request.setAttribute("member_coupon01", dto.getMember_coupon01());
//			request.setAttribute("member_coupon02", dto.getMember_coupon02());
			
			jspPage = "/admin_member/member_view.jsp";
		}
		//관리자 페이지 - 회원 삭제 액션
		else if(command.equals("mem_delete.do")) 
		{	
			MemberDao.mem_delete(request);
			
//			MemberDto dto = MemberDao.admin_member_view( request );
//			request.setAttribute("dto", dto);
			
//			jspPage = "/main.jsp";
			response.sendRedirect("/project_ezen/admin_member/member_view.do");
			
		}
		//관리자 페이지 - 회원 수정 액션
		else if(command.equals("mvModify.do")) //비밀글 수정 update
		{
			MemberDao.member_modify(request);
//			RequestDispatcher dispatcher = request.getRequestDispatcher("/admin_member/member_view.do");
//			dispatcher.forward(request, response);
//			MemberDto dto = MemberDao.admin_member_view( request );
//			request.setAttribute("dto", dto);
			
//			jspPage = "/admin_member/member_view.jsp";
			response.sendRedirect("/project_ezen/admin_member/member_list.do");
		}
		//마이페이지 - 개인정보 수정 페이지 보기
		else if(command.equals("mypage_modify.do")) { 
			
			//DTO 레코드 정보
			MemberDto dto = MemberDao.Mypage( request );
//			MemberDto dto = MemberDao.Mypage_modify_view( request );
			request.setAttribute("dto", dto);
			
			jspPage = "/mypage/mypage_modify.jsp";
		}	
		//마이페이지 - 개인정보 수정 액션, 비번 확인 포함
		else if(command.equals("myMemModify.do"))  
		{
			String member_idx = request.getParameter("member_idx");
			HttpSession session = request.getSession();
			int pw_check_result = MemberDao.modify_pw(request);
			System.out.println("pw_check_result : " + pw_check_result);
			
			if(pw_check_result==1)
			{
				MemberDao.my_mem_modify(request);
//				MemberDto dto = MemberDao.Mypage( request );
//				request.setAttribute("dto", dto);
				System.out.println("index : "+member_idx);
//				request.setAttribute("member_idx", member_idx);
//				jspPage = "/mypage/Mypage.jsp";
				response.sendRedirect("/project_ezen/mypage/Mypage.do?member_idx="+member_idx);
			}
			else 
			{
//				MemberDto dto = MemberDao.Mypage( request );
//				request.setAttribute("dto", dto);
				session.setAttribute("pw_check_result", pw_check_result);
				System.out.println("pw_check_result : " + pw_check_result);
				
//				jspPage = "/mypage/mypage_modify.jsp";
				response.sendRedirect("/project_ezen/mypage/mypage_modify.do?member_idx="+member_idx);
			}
			
		}
		//마이페이지 - 비밀번호 수정 페이지 보기
		else if(command.equals("password.do")) { 
			
			MemberDto dto = MemberDao.Mypage( request );
//			MemberDto dto = MemberDao.Mypage_modify_view( request );
			request.setAttribute("dto", dto);
			
			jspPage = "/mypage/password.jsp";
		}	
		//마이페이지 - 비밀번호 수정 액션(비번 확인 포함)
		else if(command.equals("myPwModify.do"))  
		{
			String member_idx = request.getParameter("member_idx");
			HttpSession session = request.getSession();
			int pw_check_result = MemberDao.modify_pw(request);
			System.out.println("pw_check_result : " + pw_check_result);
			
			if(pw_check_result==1)
			{
				MemberDao.myPwModify(request);
//				MemberDto dto = MemberDao.Mypage( request );
//				request.setAttribute("dto", dto);
				System.out.println("index : "+member_idx);
//				request.setAttribute("member_idx", member_idx);
//				jspPage = "/mypage/Mypage.jsp";
				response.sendRedirect("/project_ezen/mypage/Mypage.do?member_idx="+member_idx);
			}
			else 
			{
//				MemberDto dto = MemberDao.Mypage( request );
//				request.setAttribute("dto", dto);
				session.setAttribute("pw_check_result", pw_check_result);
				System.out.println("pw_check_result : " + pw_check_result);
				
//				jspPage = "/mypage/mypage_modify.jsp";
				response.sendRedirect("/project_ezen/mypage/password.do?member_idx="+member_idx);
			}
		}
		//마이페이지 - 회원탈퇴 페이지 보기
		else if(command.equals("joinout.do")) { 
			
			MemberDto dto = MemberDao.Mypage( request );
//			MemberDto dto = MemberDao.Mypage_modify_view( request );
			request.setAttribute("dto", dto);
			
			jspPage = "/mypage/joinout.jsp";
		}	
		//마이페이지 - 회원탈퇴 액션(비번 확인, 탈퇴 회원 등록, 게시글 삭제 포함)
		else if(command.equals("joinoutAction.do"))  
		{
			String member_idx = request.getParameter("member_idx");
			HttpSession session = request.getSession();
			int pw_check_result = OutMemberDao.joinout_pw(request);
			System.out.println("pw_check_result : " + pw_check_result);
			
			if(pw_check_result==1)
			{
				OutMemberDao.joinout_insert(request);
				System.out.println("탈퇴회원 등록 성공!");
				
				//게시글 삭제 추가 필요
				OutMemberDao.joinout(request);
				session.invalidate();
				
				response.sendRedirect("/project_ezen/main.do");
			}
			else 
			{
//				MemberDto dto = MemberDao.Mypage( request );
//				request.setAttribute("dto", dto);
				session.setAttribute("pw_check_result", pw_check_result);
				System.out.println("pw_check_result : " + pw_check_result);
				
//				jspPage = "/mypage/mypage_modify.jsp";
				response.sendRedirect("/project_ezen/mypage/joinout.do?member_idx="+member_idx);
			}
		}
		// 프로그램 - 스케줄 페이지 보기
		else if(command.equals("pro_schedule.do")) { 
			System.out.println("스케줄 컨트롤러");
			scheduleDto dto = scheduleDao.scheduleViewmain(request);
			request.setAttribute("dto", dto);
			
			schedule2Dto dto2 = schedule2Dao.scheduleViewmain2(request);
			request.setAttribute("dto2", dto2);	
			
			jspPage = "/program/pro_schedule.jsp";
		}
		//관리자 페이지 - 결제 내역 보기(팝업창)
		else if(command.equals("mv_popUp.do")) { 
//			scheduleDto dto = scheduleDao.scheduleViewmain(request);
//			request.setAttribute("dto", dto);
			System.out.println("팝업");
			int member_idx = Integer.parseInt(request.getParameter("mem_idx"));
			System.out.println("member_idx" + member_idx);
			request.setAttribute("member_idx", member_idx);
			
			jspPage = "/admin_member/mv_popUp.jsp";
		}
		//관리자 페이지 - 탈퇴 회원 목록 보기
		else if (command.contains("outMember_list.do")) { 
			System.out.println("탈퇴 회원 목록");
			
			int page = Integer.parseInt(request.getParameter("page"));
			int pageSize = 2;// 한페이지에 나오는 게시물 개수
			int pageGroupSize = 3; // 페이지 번호가 몇개 나오느냐 개수
//			int startRow = (page - 1) * pageSize + 1; //한 페이지의 시작글 번호
//			int endRow = startRow + pageSize - 1; //한 페이지의 마지막 글번호
			System.out.println("콘트롤러:"+page);
			
			ArrayList<OutMemberDto> out_member_list = OutMemberDao.out_member_list(page);
			
	        int outMemberCount = OutMemberDao.outMember_count();//게시물 총 개수
	        System.out.println("outMemberCount:"+outMemberCount);
	       
	        int pageGroupCount = outMemberCount / (pageSize * pageGroupSize) 
	        		+ (outMemberCount % (pageSize * pageGroupSize) == 0 ? 0 : 1);//총 그룹개수
	        int nowPageGroup = (int) Math.ceil((double) page / pageGroupSize); //현재 그룹페이지 번호
	        
//	        request.setAttribute("startRow", startRow);
//	        request.setAttribute("endRow", endRow);
	        request.setAttribute("pageSize", pageSize);
	        request.setAttribute("pageGroupSize", pageGroupSize);
	        request.setAttribute("outMemberCount", outMemberCount);
	        request.setAttribute("pageGroupCount", pageGroupCount);
	        request.setAttribute("nowPageGroup", nowPageGroup);
	         
	        request.setAttribute("out_member_list", out_member_list);
	        
			jspPage = "/admin_member/outMember_list.jsp";
		}
		//관리자 페이지 - 탈퇴 회원 정보 상세 페이지 보기
		else if(command.equals("outMember_view.do")) { 
			
			OutMemberDto dto = OutMemberDao.out_member_view( request );
			request.setAttribute("dto", dto);
			
			jspPage = "/admin_member/outMember_view.jsp";
		}
		//관리자 페이지 - 탈퇴 회원 선택 삭제 액션
		else if(command.equals("outMem_delete.do")) { 
			
			String[] strArry = request.getParameterValues("chk");
			if(strArry != null) {
				for(int i=0; i<strArry.length; i++) {
					int out_member_idx = Integer.parseInt(strArry[i]);
					System.out.println(out_member_idx);
					
					OutMemberDao.out_mem_delete(out_member_idx);
				}
			}
			response.sendRedirect("/project_ezen/admin_member/outMember_list.do");
		}
		//관리자 페이지 - 회원 검색
		else if(command.equals("memList_search.do")) { 
			
			ArrayList<MemberDto> member_list = MemberDao.mem_search(request); 
			int size = member_list.size();
			System.out.println("size"+size);
			request.setAttribute("member_list", member_list);
			request.setAttribute("size", size);
			
			
			jspPage = "/admin_member/member_list.jsp";
		}
		
		
		
		
		
		// MyController_A.java
		//관리자 시간표 페이지 보기
		else if(command.equals("admin_schedule.do")) { 
//			String schedule_idx = request.getParameter("schedule_idx");
			//DTO 레코드 정보
			System.out.println("시간표 :" );
			scheduleDto dto = scheduleDao.scheduleView(request);
			request.setAttribute("dto", dto);
			
			schedule2Dto dto2 = schedule2Dao.scheduleView2(request);
			request.setAttribute("dto2", dto2);
			
			jspPage = "/admin_gymmanage/admin_schedule.jsp";
		}
		//스케줄1 수정 액션
		else if(command.equals("schedule_update.do")) 
			{
				String gym_schedule_idx = request.getParameter("gym_schedule_idx");
				System.out.println("schedule_update:" + gym_schedule_idx);
				scheduleDao.schedule_update(request);
			
				response.sendRedirect("/project_ezen/admin_member/member_list.do");
			}
		//스케줄2 수정 액션	
		else if(command.equals("schedule2_update.do")) 
		{
			String gym_schedule2_idx = request.getParameter("gym_schedule2_idx");
			schedule2Dao.schedule2_update(request);
			response.sendRedirect("/project_ezen/admin_member/member_list.do");
		}
		
		// MyController_B.java

		// (온라인 결제)		
		// 상품선택 페이지
		else if(command.equals("choice.do")) { 		
		  jspPage = "/payment/choice.jsp";
		}
		// 상품선택 액션	 
		else if (command.equals("choiceform.do")) { 							
		  String pay_membershipA = request.getParameter("pay_membershipA");
		  String pay_membershipB = request.getParameter("pay_membershipB");	  
	      String choice_amount = request.getParameter("choice_amount");	  
		  String pay_start_dateA = request.getParameter("pay_start_dateA");
		  String pay_start_dateB = request.getParameter("pay_start_dateB");	  
		  String pay_end_dateA = request.getParameter("pay_end_dateA");
		  String pay_end_dateB = request.getParameter("pay_end_dateB");	  	
		  String pay_membership = null;
		  String pay_start_date = null;
		  String pay_end_date = null;

		  if (pay_membershipA != null) {
		    pay_membership = pay_membershipA;
		    pay_start_date = pay_start_dateA;
	        pay_end_date = pay_end_dateA;
		  }
		  if (pay_membershipB != "") {
		    pay_membership = pay_membershipB;
			pay_start_date = pay_start_dateB;
			pay_end_date = pay_end_dateB;
		  }
		  
		  HttpSession session = request.getSession();
		  session.setAttribute("pay_membership", pay_membership);
		  session.setAttribute("choice_amount", choice_amount);
		  session.setAttribute("pay_start_date", pay_start_date);
		  session.setAttribute("pay_end_date", pay_end_date);
		      
		  response.sendRedirect("pay.jsp");
		}	
        // 결제액션
		else if(command.equals("pay.do")) { 	  
		  request.setCharacterEncoding("UTF-8");
		  
		  // 결제정보 서버에 보내기
		  PayDao.payment(request);
		  
		  // 결제금액 합산
		  try {
		    PayDao.paySum(request);
		  } catch (Exception e) {
		    e.printStackTrace();
		  }
		  
		  // 쿠폰사용시 빼기
		  String pay_coupon_num = request.getParameter("pay_coupon_num");
		  
	      try {
	        if(pay_coupon_num.equals("1")){   
	          PayDao.paySub01(request);
	        }
	        else if(pay_coupon_num.equals("2"))
	        {
	          PayDao.paySub02(request);
	        }
	    	  
	      }catch (Exception e) {
	        e.printStackTrace();    	  
	      }

		  response.sendRedirect("paymentend.jsp");
		}
		
		// (고객센터)
		// 1대1문의 액션
		else if(command.equals("inquiry.do")) { 			
	      request.setCharacterEncoding("UTF-8");
		  InquiryDao.inquiry(request);

		  response.sendRedirect("/project_ezen/main.jsp");
		}
		// FAQ액션
		else if (command.contains("faq.do")) { 
		  ArrayList<FaqDto> faq_list = FaqDao.faq_list(); 
	      request.setAttribute("faq_list", faq_list);
	        
		  jspPage = "/service/faq.jsp";
		}
		
        // (마이페이지)
		// 결제내역
		else if(command.equals("paylist.do")) { 
		  String pay_member_idx = request.getParameter("member_idx");	
			
		  ArrayList<PayDto> pay_list = PayDao.pay_list(pay_member_idx); 
		  request.setAttribute("pay_list", pay_list);
				
		  jspPage = "/mypage/paylist.jsp";
		}
		// 1:1문의
		else if(command.equals("oneonone.do")) { 		
		  String inq_member_idx = request.getParameter("member_idx");	
				
		  ArrayList<InquiryDto> inq_list = InquiryDao.inq_list(inq_member_idx); 
		  request.setAttribute("inq_list", inq_list);	
			
		  jspPage = "/mypage/oneonone.jsp";
		}
		// 1:1문의 상세보기
		else if(command.equals("oneononeans.do")) {
		  String inq_idx = request.getParameter("inq_idx");
			
		  InquiryDto dto = InquiryDao.inq_view( inq_idx );
		  request.setAttribute("dto", dto);
				
		  jspPage = "/mypage/oneononeans.jsp";
	    }
			
		
		
		
		
		
		
		
		// MyController_C.java
		
		
		
		
		
		
//		아래의 코드는 맨 밑에 두도록 한다
		if (!jspPage.equals("")) { // jsp페이지가 비어있지 않다면,
			RequestDispatcher dispatcher = request.getRequestDispatcher(jspPage);
			dispatcher.forward(request, response);
		}

	}

}
