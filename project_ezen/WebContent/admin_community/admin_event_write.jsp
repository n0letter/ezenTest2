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

<!-- 현재 위치 표시 -->
   <div class="where">
      <a href="/project_ezen/index.jsp">H</a>
      <div>관리자 커뮤니티</div>
      <div>이벤트 글쓰기</div>
   </div>
        <div class="admin_notice_write_wrap">
                    
   <div class="admin_notice_write_content">
      <form name="nwrite" method="post" action="nwrite">
      	<input type="hidden" name="" value="${ member_name }">
        <table class="admin_notice_write_table">
          <tr>
            <th>제목</th>
            <td class="admin_notice_write_td">
              <input class="ntitle" type="text" name="ftitle" placeholder="제목을 입력해 주세요!">
          
                 <tr>
                    <th class="board_select">카테고리</th>
                    <td class="board_select00">
                      <select name="category" id="">
                        <option value="0" selected>채용안내</option>
                        <option value="1" selected>공지사항</option>
                        <option value="2" selected>이벤트</option>
                        <option value="3" selected>이용후기</option>
                      </select>
                    </td>
                  </tr>
          <tr>
            <td colspan="2">
              <textarea name="qna_content" class="ckeditor" cols="52" value=""></textarea>
            </td>
          </tr>
        </table>
        <div class="nbuttons">
          <input class="nwritesub" type="submit" value="등록"/>
		  <a href="admin_notice.jsp">
            <input class="nwritebutton" type="button" value="취소"/>
         
          </a>	
	    </div>
      </form>
    </div>
      
  </div>

  
  <script src="https://cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>
  
  <a id="back-to-top" href="#" class="back-to-top" role="button" title="" data-toggle="tooltip" data-placement="left" data-original-title="" style="display: block;">
    <i class="fas fa-arrow-alt-circle-up"></i>
  </a>

  <c:import url="/footer.jsp" />

 
