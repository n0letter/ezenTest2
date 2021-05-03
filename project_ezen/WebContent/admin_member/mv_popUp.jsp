<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
response.setHeader("Pragma", "no-cache"); //HTTP 1.0
response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1
response.setHeader("Cache-Control", "no-store"); //HTTP 1.1
response.setDateHeader("Expires", 0L); // Do not cache in proxy server
%>  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>결제 내역 보기</title>
	<link rel="stylesheet" href="/project_ezen/css/adminMem_style.css">
	<style>
		* {
			margin: 0; padding: 0;	
		}
	</style>
</head>
<body>
<!-- 섹션 영역 시작 -->
	<div class="mv_popUp_wrap">
		<%
		int member_idx = (Integer)request.getAttribute("member_idx");
		%>
		<input type="hidden" name="" value="${member_idx}" />
		<div class="">
        	<h4><small class="mv_title">▌</small>결제 내역 보기</h4><hr>
        </div>
        <div class="mvp_title">
        	<h4><small class="mv_title">▌</small>계정 : &nbsp;hong${dto.member_id}</h4>
        </div>
        <div class="mvp_table_wrap">
	        <table class="mv_popUp_table">
		        <tr>
		            <th class="mvp_t01">번호</th>
		            <th>주문일</th>
		            <th>주문 상품</th>
		            <th>결제 금액</th>
		            <th>결제 취소</th>
		        </tr>
		        <tr>
		          <td class="mvp_t01">01 </td>
		          <fmt:formatDate value="${dto.pay_date}" pattern="yyyy-MM-dd" var="reg" />
		          <td>2021-02-01 ${ reg }</td>
		          <td class="mvp_t02">일반 회원권 1개월 ${dto.pay_type}</td>
		          <td>115,000원</td>
		          <td><input type="button" value="삭제" /></td>
			    </tr>
			    <tr>
		          <td class="mvp_t01">02</td>
		          <fmt:formatDate value="${dto.pay_date}" pattern="yyyy-MM-dd" var="reg" />
		          <td>2021-03-01 ${ reg }</td>
		          <td class="mvp_t02">일반 회원권 1개월 ${dto.pay_type}</td>
		          <td>115,000원</td>
		          <td><input type="button" value="삭제" /></td>
			    </tr>
				<c:forEach var="dto" items="${ payList }" begin="0"  step="1" varStatus="status">
		          <tr>
			          <td class="mvp_t01">"${status.count}" </td>
			          <fmt:formatDate value="${dto.pay_date}" pattern="yyyy-MM-dd" var="reg" />
			          <td>${ reg }</td>
			          <td class="mvp_t02">${dto.pay_type}</td>
			          <td>${dto.pay_money}</td>
		         	  <td><a href="/project_ezen/admin_member/mv_popUp_delete.do?pay_idx=${dto.pay_idx}"><input type="button" value="삭제" /></a></td>
		          </tr>
		        </c:forEach>
	      
	        </table>
	    </div>
	    <button class="mvp_close" onclick="window.close();">닫기
	    	<a href="javascript:window.close();"></a>
	    </button>
    </div>
</body>
</html>