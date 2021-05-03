<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
response.setHeader("Pragma", "no-cache"); 
response.setHeader("Cache-Control", "no-cache"); 
response.setHeader("Cache-Control", "no-store"); 
response.setDateHeader("Expires", 0L); 
%>  
  <c:import url="/header.jsp" />
    
  <!-- 현재위치표시 영역 시작 -->  
  
  <div class="mypage_header_img"></div>
  
  <div class="where">
    <a href="/project_ezen/main.jsp">H</a>
    <div>고객센터</div>
    <div>FAQ</div>
  </div>
  
  <!-- 현재위치표시 영역 끝 -->
  
  <!-- FAQ_view 영역 시작 --> 
  
  <div class="faq_view_wrap">
    <h4 class="faq_view_title"><small class="service_small">▌</small>FAQ</h4>
    <div class="faq_view_table">
       <div class="faq_view_table_top">
          <div class="faq_view_table_left">질문</div>
          <div class="faq_view_table_right">{자주하는 질문 제목입니다.}</div>
       </div>
       <div class="faq_view_table_content">{자주하는 질문 내용입니다.}</div>
    </div>  
    <a href="faq.jsp">
      <input class="faq_view_btn" name="faq_view_btn" type="button" value="목록"/>
    </a>
  </div>
  
  <!-- FAQ_view 영역 끝 -->
  
  <c:import url="/footer.jsp" />