<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
response.setHeader("Pragma", "no-cache"); //HTTP 1.0
response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1
response.setHeader("Cache-Control", "no-store"); //HTTP 1.1
response.setDateHeader("Expires", 0L); // Do not cache in proxy server
%>  
	<c:import url="/admin_header.jsp" />
<%
String member_idx = (String)session.getAttribute("member_idx");
/* String mem_idx = (String)request.getParameter("mem_idx"); */
String uri = request.getRequestURI();
String referer = request.getHeader("referer");
System.out.println("이전 주소" + referer); 
System.out.println("현재 주소:" + uri);
System.out.println("member_idx:" + member_idx);
/* System.out.println("mem_idx:" + mem_idx); */
if(uri.indexOf("admin") != -1 && member_idx == null) {
	response.sendRedirect("/project_ezen/member/loginForm.jsp");
	/* 아래는 회원 삭제 후 멤버리스트 페이지로 돌아오는데 이때 뒤로가기를 누르면 
	데이터가 없어 오류페이지 뜨는 것 방지 시도 중 */
} 
/* else if(referer.indexOf("mvModify") != -1 || uri.indexOf("mvModify") != -1) {
referer = "/project_ezen/admin_member/member_list.do";  
response.sendRedirect("/project_ezen/admin_member/member_view.do"); 
}   */ 
/* else if(referer.indexOf("mem_idx") != -1 && uri.indexOf("member_list") != -1) {
referer = "/project_ezen/admin_payment/admin_paymain.jsp";
response.sendRedirect("/project_ezen/admin_payment/admin_paymain.jsp");
 referer = "/project_ezen/admin_member/member_list.do"; 
}  */	
%>
	<div class="mypage_header_img">
    </div>
   	
<!-- 현재 위치 표시 -->
	<div class="where">
		<a href="/project_ezen/main.jsp">H</a>
		<div>회원 관리</div>
		<div>회원 정보</div>
	</div>

<!-- 섹션 영역 시작 -->
	<div class="member_view_wrap">
		<div class="">
        	<h4><small class="mv_title">▌</small>가입 정보</h4>
        </div>
		<form name="mvModify" method="post" action="mvModify.do" onsubmit="return checkJoin()">
			<input type="hidden" name="mem_idx" value="${dto.member_idx}" /> 
			<table class="mv_table">
				<colgroup>
					<col width="16%">
					<col width="80%">
				</colgroup>
				<tbody>
					<tr>
						<th>이름</th>
						<td>${dto.member_name}</td>
					</tr>
					<tr>
						<th>아이디</th>
						<td>${dto.member_id}</td>
					</tr>
					<!-- <tr>
						<th>비밀번호</th>
						<td>
							<input type="password" name="pwd" value="" size="20" maxlength="16" 
							style="width:35%;"> &nbsp;
						</td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td>
							<input type="password" name="pwd1" value="" size="20" maxlength="16" 
							style="width:35%;">
						</td>
					</tr> -->
					
			
					<tr>
						<th>생년월일/성별</th>
						<td class="join_date_wrap">
							<input type="date" name="joinBirthday" class="join_date" value="${dto.member_birth_date}" />&nbsp;&nbsp;&nbsp;&nbsp;
							<select name="join_gender" id="join_gender" >
							<c:set var="trans" value="${dto.member_gender}"/>
				   	      	<c:choose>
								<c:when test="${ trans eq 'M' }">
					          		<option value="M" selected="selected">남자</option>
									<option value="F">여자</option>
								</c:when>
								<c:otherwise>
									<option value="M">남자</option>
									<option value="F" selected="selected">여자</option>
								</c:otherwise>
							</c:choose>
							<%-- <%
							String member_gender = (String)request.getAttribute("member_gender"); 
							if(member_gender.equals("M")) {
							%>
								<option value="M" selected="selected">남자</option>
								<option value="F">여자</option>
							<% 
							} else {
							%> 
								<option value="M">남자</option>
								<option value="F" selected="selected">여자</option>
							<% 
							}
							%>  --%>
								
							</select>
						</td>
					</tr>
					
					<tr>
						<th>휴대폰</th>
						<td>
							<!-- <select name="htel1" style="width:120px">
								<option value="">선택</option>
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
							</select> -->
							<!-- <span class="bar">-</span> -->
							<!-- <input type="text" name="htel2" value="" size="5" maxlength="4" 
								onkeyup="checkNumber(this);" style="width:10%">
							<span class="bar">-</span> -->
							<input type="text" name="htel3" value="${dto.member_phone}" size="5" maxlength="12" 
								onkeyup="checkNumber(this);" style="width:30%">
						</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>
							<input type="text" name="email" value="${dto.member_email}" size="15" maxlength="20" style="width:30%"> 
							&nbsp;
						
							<span class="mv_small">메일 수신 여부 &nbsp; : &nbsp;&nbsp;
							<c:set var="trans" value="${dto.member_email_receive}"/>
				   	      	<c:choose>
								<c:when test="${ trans eq '0' }">
					          		${fn:replace(trans, 0, "비수신")}
								</c:when>
								<c:otherwise>
									${fn:replace(trans, 1, "수신")}
								</c:otherwise>
							</c:choose>
							<%-- <%
							int member_email_receive = (Integer)request.getAttribute("member_email_receive"); 
							if(member_email_receive == 1) {
							%>
								<label for="gudoc1">
									 예 
								</label> 
							<% 
							} else {
							%> 
								<label for="gudoc2">
									 아니오
								</label>
							<% 
							}
							%>   --%>
								
							</span>
						</td>
					</tr>
					<tr>
						<th>동의 내역</th>
						<td>
							| 이용약관 : 동의 &nbsp;&nbsp; | 개인정보 처리방침 : 동의 &nbsp;&nbsp; | 마케팅 동의 : 
							<c:set var="trans" value="${dto.member_agree}"/>
				   	      	<c:choose>
								<c:when test="${ trans eq 'Y' }">
					          		${fn:replace(trans, 'Y', "동의")}
								</c:when>
								<c:otherwise>
									${fn:replace(trans, 'N', "비동의")}
								</c:otherwise>
							</c:choose>
							<%-- <%
							String member_agree = (String)request.getAttribute("member_agree"); 
							if(member_agree.equals("Y")) {
							%>
								동의
							<% 
							} else {
							%> 
								비동의 
							<% 
							}
							%> --%>
							
						</td>
					</tr>
					
				</tbody>
			</table>
			<div class="mv_mid">
	        	<h4><small class="mv_title">▌</small>이용/운영 정보</h4>
	        </div>
	        
			<table class="mv_table">
				<colgroup>
					<col width="16%">
					<col width="30%">
				</colgroup>
				<tbody>
					<tr>
						<th>가입일</th>
						<fmt:formatDate value="${dto.member_join_date}" pattern="yyyy-MM-dd HH:mm:ss" var="reg" />
			            <td>${ reg }</td>
						<th class="mv_right">1주년 쿠폰</th>
						<td>10,000원
							<select name="mv_coup01" style="width:50px">
								<option value="">선택</option>
							<c:set var="trans" value="${dto.member_coupon01}"/>
				   	      	<c:choose>
								<c:when test="${ trans eq '0' }">
					          		<option value="0" selected="selected">0</option>
									<option value="1">1</option>
									<option value="2">2</option>
								</c:when>
								<c:when test="${ trans eq '1' }">
					          		<option value="0">0</option>
									<option value="1" selected="selected">1</option>
									<option value="2">2</option>
								</c:when>
								<c:when test="${ trans eq '2' }">
					          		<option value="0">0</option>
									<option value="1">1</option>
									<option value="2" selected="selected">2</option>
								</c:when>
							</c:choose>
							<%-- <%
							int member_coupon01 = (Integer)request.getAttribute("member_coupon01"); 
							if(member_coupon01 == 0) {
							%>	
								<option value="0" selected="selected">0</option>
								<option value="1">1</option>
								<option value="2">2</option>
							<%
							} else if(member_coupon01 == 1) {
							%>
								<option value="0">0</option>
								<option value="1" selected="selected">1</option>
								<option value="2">2</option>
							<% 
							} else if(member_coupon01 == 2) {
							%>
								<option value="0">0</option>
								<option value="1">1</option>
								<option value="2" selected="selected">2</option>
							<% 
							}
							%> --%>
							</select>
						</td>
					</tr>
					<tr>
						<th>총 구매 금액</th>
						<td>
							${dto.member_pay_sum}원
							<button class="mv_payResult" onclick="mv_popUp(this.form)" style="outline: none;">
					    		<a>결제 내역 보기</a>
					    	</button>
						</td>
						<th class="mv_right">후기 이벤트 쿠폰</th>
						<td>10% 할인
							<select name="mv_coup02" style="width:50px">
								<option value="">선택</option>
							<c:set var="trans" value="${dto.member_coupon02}"/>
				   	      	<c:choose>
								<c:when test="${ trans eq '0' }">
					          		<option value="0" selected="selected">0</option>
									<option value="1">1</option>
									<option value="2">2</option>
								</c:when>
								<c:when test="${ trans eq '1' }">
					          		<option value="0">0</option>
									<option value="1" selected="selected">1</option>
									<option value="2">2</option>
								</c:when>
								<c:when test="${ trans eq '2' }">
					          		<option value="0">0</option>
									<option value="1">1</option>
									<option value="2" selected="selected">2</option>
								</c:when>
							</c:choose>
							<%-- <%
							int member_coupon02 = (Integer)request.getAttribute("member_coupon02"); 
							if(member_coupon02 == 0) {
							%>	
								<option value="0" selected="selected">0</option>
								<option value="1">1</option>
								<option value="2">2</option>
							<%
							} else if(member_coupon02 == 1) {
							%>
								<option value="0">0</option>
								<option value="1" selected="selected">1</option>
								<option value="2">2</option>
							<% 
							} else if(member_coupon02 == 2) {
							%>
								<option value="0">0</option>
								<option value="1">1</option>
								<option value="2" selected="selected">2</option>
							<% 
							}
							%> --%>
							</select>
						</td>
					</tr>
					<tr class="" >
						<th>사물함 번호</th>
						<td>
							<input type="text" name="locker" value="${dto.member_locker}" size="20" maxlength="16" 
							style="width:35%;"> &nbsp;
						</td>
						<th style="background: #fff; border-right: none;"></th>
						<td></td>
					</tr>
				</tbody>
			</table>			
			<div class="mv_btnArea">
				<input type="button" class="mv_btn mv_btn01" value="회원 삭제" onclick="deletecheck()" />
				<input type="submit" class="mv_btn" value="수정" />
				<a href="javascript:mvModify.reset();" ><input type="button" class="mv_btn mv_btn03" value="취소" /></a>
				<a href="/project_ezen/admin_member/member_list.do?member_name=${member_name}&page=1"><input type="button" class="mv_btn mv_btn04" value="목록 보기" /></a>
			</div>
		</form>
		<form name="frmM" method="post" target="HiddenFrame">
			<input type="hidden" name="mem_delete">
		</form>
	</div>
	



<i class="fas fa-arrow-alt-circle-up"></i>

    <script>
	    function mv_popUp(frm){  
	      /* window.open("/project_ezen/admin_member/mv_popUp.do", "새창", 
	    		  "top=100, left=800, width=540, height=563, toolbar=no, menubar=no, scrollbars=yes, resizable=no" ); */  
	    	var url = "mv_popUp.do";
	        var title = "pay_pop";
	        var status = "top=100, left=800, width=540, height=563, toolbar=no, menubar=no, scrollbars=yes, resizable=no";
	    	window.open("", title, status);
	    	frm.target = title;
	    	frm.action = url;
	    	frm.method = "post";
	    	frm.submit();
	    }
	    
	    function deletecheck() {
	    	frmM.mem_delete.value = mvModify.mem_idx.value;
	    	var a = confirm("회원을 삭제하시겠습니까?")
	    	if(a == true){
	    		frmM.action = "mem_delete.do"
	    		frmM.submit();
	    	} else {
	    		
	    		window.history.go(0);
	    	}
			/* return false; */
	    }
    </script>
<!-- 섹션 영역 끝 -->

	<c:import url="/footer.jsp" />	