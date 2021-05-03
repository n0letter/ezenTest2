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
    <div>결제관리</div>
    <div>결제내역</div>
  </div>  
  <!-- 현재위치표시 영역 끝 -->
  
  <!-- paymain 영역 시작 -->
  <div class="paymain_wrap">
  
    <!-- 결제 수 한눈에 보기 -->
    <div class="paymain_top">
      <h4 class="paymain_top_A"><small class="adminPay_small">▌</small>회원권 결제 수</h4>
      <div class="paymain_square">
        <span class="paymain_square_text">일반 회원권<br>결제 수</span>
        <span class="paymain_square_text">스페셜 회원권<br>결제 수</span>
        <span class="paymain_square_text_A">총<br>결제 수</span>
      </div>
      <div class="paymain_top_B">
        <div class="paymain_Shape">
          <span class="paymain_Shape_text">{00}건</span>
        </div>
        <div class="paymain_Shape_A">
          <span class="paymain_Symbol">+</span> 
        </div>
        <div class="paymain_Shape">
          <span class="paymain_Shape_text">{00}건</span>
        </div>
        <div class="paymain_Shape_A">
          <span class="paymain_Symbol">=</span>
        </div>
        <div class="paymain_Shape_B">
          <span class="paymain_Shape_text_A">{00}건</span>
        </div>
      </div>
    </div>
    
    <!-- 결제내역 보기+버튼 -->
    <div class="paymain_bottom">
      <div class="paymain_bottom_A">
        <h5>일반 회원권 결제내역</h5>
        <a href="admin_general.jsp">
          <input class="paymain_btn" type="button" value="보기"/>
        </a>
      </div>
      <div class="paymain_bottom_B">
        <h5>스페셜 회원권 결제내역</h5>
        <a href="admin_special.jsp">
          <input class="paymain_btn" type="button" value="보기"/>
        </a>
      </div>
    </div>  
    
  </div> 
  <!-- paymain 영역 끝 -->
  
  <a id="back-to-top" href="#" class="back-to-top" role="button" title="" data-toggle="tooltip" data-placement="left" data-original-title="" style="display: block;">
    <i class="fas fa-arrow-alt-circle-up"></i>
  </a>

  <c:import url="/footer.jsp" />