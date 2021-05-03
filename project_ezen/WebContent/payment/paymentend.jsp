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
    
  <div class="mypage_header_img"></div>  
  
  <!-- 현재위치표시 영역 시작 -->    
  <div class="where">
    <a href="/project_ezen/main.jsp">H</a>
    <div>온라인 결제</div>
    <div>결제 완료</div>
  </div>
  <!-- 현재위치표시 영역 끝 -->
  
  <!-- end 영역 시작 --> 
  <div class="paymentend_wrap">
  
    <img class="paymentend_img" src="/project_ezen/img/payment_image/payend.PNG">
    
    <div class="paymentend_title">
      <h4><small class="payment_small">▌</small>결제 완료</h4> <hr>
    </div>
    
    <div>
      <span class="paymentend_text_A">결제가 완료되었습니다. 이용해 주셔서 감사합니다.</span> <br>
      <span class="paymentend_text_B">결제 내역은 [마이페이지 > 결제내역]에서 다시 확인할 수 있습니다.</span>
    </div>
    
    <!-- 버튼 --> 
    <input class="paymentend_btn" name="end_btn" type="button" value="확인" onClick="location.href='/project_ezen/main.jsp'"/>
 
  </div>
  <!-- end 영역 끝 -->

  <a id="back-to-top" href="#" class="back-to-top" role="button" title="" data-toggle="tooltip" data-placement="left" data-original-title="" style="display: block;">
    <i class="fas fa-arrow-alt-circle-up"></i>
  </a>

  <c:import url="/footer.jsp" />