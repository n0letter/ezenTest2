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
    <div>상세보기</div>
  </div>
  <!-- 현재위치표시 영역 끝 -->
  
  <!-- admin_faq_view 영역 시작 -->
  <div class="admin_faq_view_wrap">
  
    <!-- 상단타이틀 -->
    <div class="admin_faq_view_title">
  	  <h4><small class="adminService_small">▌</small>FAQ 상세보기</h4>
  	</div>
  	
  	<!-- 글쓰기 -->
    <div class="admin_faq_view_content">
      <form name="fview" method="post" action="fview">
        <table class="admin_faq_view_table">
          <tr>
            <th>제목</th>
            <td class="admin_faq_view_td">
              <input class="fviewtitle" type="text" name="fviewtitle" value="자주하는질문입니다.${dto.qna_title}">
            </td>
          </tr>
          <tr>
            <td colspan="2">
              <textarea name="qna_content" class="ckeditor" cols="52" value="${dto.qna_content }">자주하는질문입니다.</textarea>
            </td>
          </tr>
        </table>
        <div class="fviewbuttons">
          <input class="fviewsubA" type="submit" value="수정하기"/>
          <input class="fviewsubB" type="submit" value="삭제하기"/>
		  <a href="admin_faq.jsp">
            <input class="fviewbutton" type="button" value="목록"/>
          </a>	
	    </div>
      </form>
    </div>
      
  </div>
  <!-- admin_faq_write 영역 끝 -->
  
  <script src="https://cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>
  
  <a id="back-to-top" href="#" class="back-to-top" role="button" title="" data-toggle="tooltip" data-placement="left" data-original-title="" style="display: block;">
    <i class="fas fa-arrow-alt-circle-up"></i>
  </a>

  <c:import url="/footer.jsp" />