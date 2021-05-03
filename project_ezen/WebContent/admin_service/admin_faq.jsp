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
    <div>FAQ</div>
  </div>
  <!-- 현재위치표시 영역 끝 -->
  
  <!-- admin_faq 영역 시작 -->
  <div class="admin_faq_wrap">
  
    <!-- 상단타이틀 -->
    <div class="admin_faq_title">
  	  <h4><small class="adminService_small">▌</small>FAQ리스트</h4>
  	</div>
  	
  	<!-- 표 -->
    <div class="admin_faq_table">
      <form  name="admin_faq_content" action="admin_faq_content">
        <table class="admin_faq_table_wrap">
          <tr>
            <th>질문</th>
            <td onclick="location.href='/project_ezen/admin_service/admin_faq_view.jsp?faq_idx=${dto.faq_idx}';" style="cursor:pointer;">자주하는 질문입니다.</td>
          </tr>
          <tr>
            <th>질문</th>
            <td onclick="location.href='/project_ezen/admin_service/admin_faq_view.jsp?faq_idx=${dto.faq_idx}';" style="cursor:pointer;">자주하는 질문입니다.</td>
          </tr>
          <tr>
            <th>질문</th>
            <td onclick="location.href='/project_ezen/admin_service/admin_faq_view.jsp?faq_idx=${dto.faq_idx}';" style="cursor:pointer;">자주하는 질문입니다.</td>
          </tr>
          <tr>
            <th>질문</th>
            <td onclick="location.href='/project_ezen/admin_service/admin_faq_view.jsp?faq_idx=${dto.faq_idx}';" style="cursor:pointer;">자주하는 질문입니다.</td>
          </tr>
        </table>
      </form>
    </div>
    
    <!-- 버튼 -->
    <div>
      <a href="admin_faq_write.jsp">
        <input class="fwritebtn" type="button" value="글쓰기"/>
      </a>	
    </div>
      
  </div>
  <!-- admin_faq 영역 끝 -->
  
  <a id="back-to-top" href="#" class="back-to-top" role="button" title="" data-toggle="tooltip" data-placement="left" data-original-title="" style="display: block;">
    <i class="fas fa-arrow-alt-circle-up"></i>
  </a>

  <c:import url="/footer.jsp" />