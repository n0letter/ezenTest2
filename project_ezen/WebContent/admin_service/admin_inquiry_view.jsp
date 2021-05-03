<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
  <c:import url="/admin_header.jsp" />
<%
String member_idx = (String)session.getAttribute("member_idx");
String uri = request.getRequestURI();
System.out.println("현재 주소:" + uri);
System.out.println("member_idx:" + member_idx);
if(uri.indexOf("admin") != -1 && member_idx == null) {
	response.sendRedirect("/project_ezen/member/loginForm.jsp");
}
%>  
  <div class="mypage_header_img"></div>  
  
  <!-- 현재위치표시 영역 시작 -->    
  <div class="where">
    <a href="/project_ezen/main.jsp">H</a>
    <div>고객센터</div>
    <div>1:1문의</div>
    <div>상세보기</div>
  </div>
  <!-- 현재위치표시 영역 끝 -->
  
  <!-- admin_inquiry_view 영역 시작 -->
  <div class="admin_inquiry_view_wrap">
  
    <!-- 상단타이틀+버튼 -->
    <div class="admin_inquiry_view_title">
  	  <h4><small class="adminService_small">▌</small>1:1문의 상세보기</h4>
  	</div>
  	
  	<!-- 1:1문의 상세보기 -->
  	<div class="admin_inquiry_view_table">
      <div class="admin_inquiry_view_top">
        <div class="admin_inquiry_view_left">질문</div>
        <div class="admin_inquiry_view_right">{1:1문의 질문 제목입니다.}</div>
      </div>
       <div class="admin_inquiry_view_content">{1:1문의 질문 내용입니다.}</div>
    </div> 
    
    <!-- 1:1문의 답변하기+답변상태+버튼 -->
    <hr>
    <div class="admin_inquiry_view_Answer">
      <form name="inquiryAnswer" method="post" action="iAnswer">
        <input class="admin_inquiry_Answer_content" type=text name="iAnswercontent" placeholder="답변을 작성해 주세요.">
	    <div class="Answer_bottom">
	      <select class="iselect" name="iselect">
            <option value="">답변상태</option>
	        <option value="iselect0">미 답변</option>
		    <option value="iselect1">답변</option>  
	      </select> 
          <input class="iAnswersub" type="submit" value="답변하기"/>
		  <a href="admin_inquiry.jsp">
            <input class="iAnswerbtn" type="button" value="목록"/>
          </a>	
	    </div>    
      </form>
    </div>
          
  </div>
  <!-- admin_inquiry 영역 끝 -->
  
  <a id="back-to-top" href="#" class="back-to-top" role="button" title="" data-toggle="tooltip" data-placement="left" data-original-title="" style="display: block;">
    <i class="fas fa-arrow-alt-circle-up"></i>
  </a>

  <c:import url="/footer.jsp" />