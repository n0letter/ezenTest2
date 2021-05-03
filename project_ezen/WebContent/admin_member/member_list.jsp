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
String uri = request.getRequestURI();
String referer = request.getHeader("referer");
System.out.println("이전 주소" + referer); 
System.out.println("현재 주소:" + uri);
System.out.println("member_idx:" + member_idx);
if(uri.indexOf("admin") != -1 && member_idx == null) {
	response.sendRedirect("/project_ezen/member/loginForm.jsp");
}
/* else if(uri.indexOf("member_list") != -1 && referer.indexOf("member_view") != -1) {
referer = "/project_ezen/admin_member/member_list.do"; 
response.sendRedirect("/project_ezen/admin_member/member_list.do");
}  */
	/* response.sendRedirect("/project_ezen/admin_member/member_list.do?page=0"); */
%>
	<div class="mypage_header_img">
    </div>
   	
<!-- 현재 위치 표시 -->
	<div class="where">
		<a href="/project_ezen/main.do">H</a>
		<div>회원 관리</div>
		<div>회원 목록</div>
	</div>

<!-- 섹션 영역 시작 -->
	<div class="memList_wrap">
    	<form class="ml_search_wrap" action="memList_search.do" 
    	name="ml_search" onsubmit="return mem_search()">
	        <div>
	        	<select name="ms_title" class="memList_select">
		            <option value="joinDay">가입일</option>
		            <option value="name">이름</option>
		            <option value="id">아이디</option>
	        	</select>
	        </div>
	        <div>
	        	<input type="text" name="keyword" 
	        	placeholder="검색어를 입력하시오." class="ml_search_text">
	        </div>
	        <div>
	        	<input type="submit" class="ml_search_btn" value="검색">
	        </div>
    	</form>
    	
    	<div class="ml_table_wrap" id="ml_general">
	        <table class="memList_table" id="ml_content">
	        	<thead>
			        <tr>
			            <th class="ml_t01">번호</th>
			            <th>가입일</th>
			            <th>이름</th>
			            <th>아이디</th>
			            <th>구매 금액</th>
			            <th>메일 수신 여부</th>
			        </tr>
		        </thead>
		       
		        <tbody>
		        	
		        	<%-- <c:if test="${fn:length(member_list) < 1} ">
			        
					</c:if> --%>
					<c:forEach var="dto" items="${ member_list }" begin="0" end="9" step="1" varStatus="status">
				        <tr onclick="location.href='/project_ezen/admin_member/member_view.do?mem_idx=${dto.member_idx}';" style="cursor:pointer;">
				          <td class="ml_t01">${dto.member_idx}</td>
				          <fmt:formatDate value="${dto.member_join_date}" pattern="yyyy-MM-dd" var="reg" />
				          <td>${ reg }</td>
				          <td class="ml_t02"><a href="/project_ezen/admin_member/member_view.do?mem_idx=${dto.member_idx}">${dto.member_name}</a></td>
				          <td>${dto.member_id}</td>
				          <td>${dto.member_pay_sum}원</td>
				   	      <td>
				   	      	<c:set var="trans" value="${dto.member_email_receive}"/>
				   	      	<c:choose>
								<c:when test="${ trans eq '0' }">
					          		${fn:replace(trans, 0, "비수신")}
								</c:when>
								<c:otherwise>
									${fn:replace(trans, 1, "수신")}
								</c:otherwise>
							</c:choose>
				   	      </td>
				        </tr>
			        </c:forEach>
			        
	      		</tbody>
	        </table>
	        <%
        	int list_size = (Integer)request.getAttribute("size") == null? 2:(Integer)request.getAttribute("size");
        	if(list_size == 0){
        	%>
        	<h4>검색 결과가 없습니다.</h4>
        	<% 
        	}
        	%>
	        <ul class="pagination justify-content-center">
	        <c:if test="${memberCount > 0}">
			  <!--페이지 개수  -->
			    <c:set var="pageCount" value="${memberCount / pageSize + ( memberCount % pageSize == 0 ? 0 : 1)}" />
			    <c:set var="startPage" value="${pageGroupSize*(nowPageGroup-1)+1}" />
			    <c:set var="endPage" value="${startPage + pageGroupSize-1}" />
			    <c:if test="${endPage > pageCount}">
			      <c:set var="endPage" value="${pageCount}" />
			    </c:if>
			 
			    <c:if test="${nowPageGroup > 1}">
			      <li class="page-item">
			      	<a class="page-link" href="<c:url value = "/project_ezen/admin_member/member_list.do?page=${(nowPageGroup-2)*pageGroupSize+1 }&pageSize=${pageSize}"/>">
			      	이전
			      	</a>
			      </li>
			      <%-- <li class="page-item">
       				<a class="page-link" href="/project_ezen/admin_member/member_list.do?page=${param.page-1 }">
       				<
       				</a>
        		  </li> --%>
			    </c:if>
			 
			    <c:forEach var="i" begin="${startPage}" end="${endPage}">
			      <c:choose>
	        		<c:when test="${param.page eq i }">
				      <li class="page-item active" aria-current="page">
					    <a class="page-link" href="<c:url value="/project_ezen/admin_member/member_list.do?page=${i}&pageSize=${pageSize}"/>">				     
					        ${i} 
					    </a>
				      </li>
			        </c:when>
			        <c:otherwise>
				      <li class="page-item">
					    <a class="page-link" href="<c:url value="/project_ezen/admin_member/member_list.do?page=${i}&pageSize=${pageSize}"/>">				     
					        ${i} 
					    </a>
				     </li>
			        </c:otherwise>
			      </c:choose>
			    </c:forEach>
			    <c:if test="${nowPageGroup < pageGroupCount}">
			      <%-- <li class="page-item">
       				<a class="page-link" href="/project_ezen/admin_member/member_list.do?page=${param.page+1 }">
       				>
       				</a>
        		  </li> --%>
			      <li class="page-item">
			        <a class="page-link" href="<c:url value = "/project_ezen/admin_member/member_list.do?page=${nowPageGroup*pageGroupSize+1}&pageSize=${pageSize}"/>">
			        다음
			        </a>
			      </li>
			    </c:if>
			  </c:if>

	        </ul>
	    </div>
	</div>
<i class="fas fa-arrow-alt-circle-up"></i>
<!-- 섹션 영역 끝 -->
  <script>
  function mem_search() {
	  var frm = document.ml_search;
	  
	  if(!frm.keyword.value) {
		  alert("검색어를 입력해 주세요.")
		  frm.keyword.focus();
		  return false;  
	  } 
	  /* if(frm.ms_title.value == "joinDay") {
		  if(!/^[0-9]{8}$/.test(frm.keyword.value)) {
			  	alert("숫자8자리, 날짜 형식으로 입력하세요. 예)20200303")
			  	frm.keyword.focus();
				return false;  
	      }
	  	  
	  } */
	  
  }
  
/*     var $ml_general = $('#ml_general');

    $ml_general.submit(function (e) {
      e.preventDefault();
      var rowPerPage =2; //일단 데이터2개당 페이지 넘어가게 설정 (**나중에 데이터연동때 바꾸기**)
      var zeroWarning = 'Sorry, but we cat\'t display "0" rows page. + \nPlease try again.'
      
      if (!rowPerPage) {
       alert(zeroWarning);
       return;
      }
      
      $('#paynav').remove();
      var $ml_content = $('#ml_content');

      $ml_content.after('<div id="paynav">');
      var $tr = $($ml_content).find('tbody tr');
      var rowTotals = $tr.length;
      var pageTotal = Math.ceil(rowTotals/ rowPerPage);
      var i = 0;

      for (; i < pageTotal; i++) {
      $('<a href="#"></a>')
        .attr('rel', i)
        .html(i + 1)
        .appendTo('#paynav');
      }

      $tr.addClass('off-payscreen')
      .slice(0, rowPerPage)
      .removeClass('off-payscreen');
      var $pagingLink = $('#paynav a');
      $pagingLink.on('click', function (evt) {
      evt.preventDefault();
      var $this = $(this);
      
      if ($this.hasClass('active')) {
        return;
      }
      
      $pagingLink.removeClass('active');
      $this.addClass('active');

      var currPage = $this.attr('rel');
      var startItem = currPage * rowPerPage;
      var endItem = startItem + rowPerPage;

      $tr.css('opacity', '0.0')
        .addClass('off-payscreen')
        .slice(startItem, endItem)
        .removeClass('off-payscreen')
        .animate({opacity: 1}, 300);
      });
      
      $pagingLink.filter(':first').addClass('active');
    });
    
    $ml_general.submit(); */
  </script>    


	<c:import url="/footer.jsp" />	