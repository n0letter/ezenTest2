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
      <div>이용후기 상세보기</div>
   </div>
 
 <div class="admin_board_wrap">
    
        <div class="admin_board_write_wrap">
            
                <div class="board00"></div>
  <div class="board">
    <div class="board-form">
      <table width="100%">
        <tbody>
          <tr>
            <td>
              <table>
                <tbody>
                  <tr>
                    <td class="board-left">제목</td>
                    <td class="board-right">
                      <input type="text" class="name" id="name">
                    </td>
                  </tr>
                  <tr>
                    <td class="board-left">카테고리</td>
                    <td class="board-right">
                      <select name="category" id="">
                        <option value="0" selected>이벤트</option>
                        <option value="1" selected>공지사항</option>
                        <option value="2" selected>채용안내</option>
                        <option value="3" selected>이용후기</option>
                      </select>
                    </td>
                  </tr>
                
                  <tr>
                    <td class="board-left">작성자</td>
                    <td class="board-right">
                      <input type="text" class="name" id="관리자">
              
                    
                    </td>
                  </tr>
                  <tr>
                    <td class="boardleft">작성일</td>
                    <td class="board-right">
                      <input type="text" class="input" id="mail">
                    </td>
                  </tr>
                
                  <tr>
                    <td class="ta-left">내용</td>
                    <td class="ta-right">
                      <textarea name="" class="" cols="52">
                      
                      
                      
                      
                      이벤트에 많은참여 바랍니다.</textarea>
                    </td>
                  </tr>
                </tbody>
              </table>
            </td>
          </tr>
                  </tbody>
      </table>
    </div>
  </div>  
         <div class="nobuttons">
          <input class="nwritesub" type="submit" value="수정"/>
		  <a href="admin_notice.jsp">
            <input class="nowritebutton" type="button" value="삭제"/>
        </div>
    </div>
    
     <c:import url="/footer.jsp" />
