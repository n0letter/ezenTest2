<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
response.setHeader("Pragma", "no-cache"); //HTTP 1.0
response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1
response.setHeader("Cache-Control", "no-store"); //HTTP 1.1
response.setDateHeader("Expires", 0L); // Do not cache in proxy server
%>      
  <c:import url="/header.jsp" />
<%
String member_idx = (String)session.getAttribute("member_idx");
String uri = request.getRequestURI();
System.out.println("현재 주소:" + uri);
System.out.println("member_idx:" + member_idx);
if(uri.indexOf("mypage") != -1 && member_idx == null) {
	response.sendRedirect("/project_ezen/member/loginForm.jsp");
}
%>    
 	<div class="mypage_header_img">
    </div>
    	
<!-- 현재 위치 표시 -->
	<div class="where">
		<a href="/project_ezen/main.jsp">H</a>
		<div>마이페이지</div>
		<div>나의 후기</div>
	</div>
  
  <!-- 현재위치표시 영역 끝 -->
  

  
   <!-- mypage 영역 시작 -->
  
  <div class="mypage_wrap">
		<div class="mypage_menu">
		<table class="mypage_menutable">
			<tbody>
				<tr>
					<th>마이페이지</th>
				
				</tr>
				<tr>
					<th><a href="/project_ezen/mypage/Mypage.jsp"> > 회원정보</a> </th>
					
				</tr>
				<tr>
					<th> 결제내역</th>
				</tr>
				<tr>
				   <th><a href="/project_ezen/mypage/paylist.do?member_idx=${member_idx}"> > 결제내역</a></th>
		        </tr>
				<tr>
					<th> 게시판 이용 내역</th>
				</tr>
				<tr>
					<th><a href="/project_ezen/mypage/oneonone.do?member_idx=${member_idx}">> 1:1문의</a><br>
						<a href="/project_ezen/mypage/myafter.jsp"> >나의 후기</a>
					</th>
				</tr>
				<tr>
					<th> 개인정보 수정</th>
				</tr>
				<tr>
					<th><a href="/project_ezen/mypage/mypage_modify.jsp"> > 개인정보 수정</a> <br>
						<a href="/project_ezen/mypage/password.jsp"> > 비밀번호 변경</a><br>
						<a href="/project_ezen/mypage/joinout.jsp"> > 회원탈퇴</a>
					</th>
				</tr>
			</tbody>
		</table>  

		<!-- 1:1문의 게시판 -->
		<table class="oneonone_table">
			<tr>
				<th>번호</th>
				<th>내용</th>
				<th>작성자</th>
				
				<th>등록일</th>          
			</tr>
			<tr>
				<td class="oneonone_t01">2</td>
				<td class="oneonone_t02"><a href="/project_ezen/mypage/myafter.jsp">헬스장이용후기</a></td>
				<td class="oneonone_t03">{name}</td>
			
				<td class="oneonone_t04">{date}</td>
				</tr>
				<tr>
					<td class="oneonone_t01">1</td>
					<td class="oneonone_t02"><a href="/project_ezen/mypage/myafter.jsp">헬스장이용후기</a></td>
					<td class="oneonone_t03">{name}</td>
					<td class="oneonone_t04">{date}</td>
					</tr>
			</table>
	</div>
	
	
  </div>
  
	<!-- mypage 영역 끝 -->

  <c:import url="/footer.jsp" />