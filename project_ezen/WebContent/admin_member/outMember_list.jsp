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
	<div class="mypage_header_img">
    </div>
   	
<!-- 현재 위치 표시 -->
	<div class="where">
		<a href="/project_ezen/main.jsp">H</a>
		<div>회원 관리</div>
		<div>탈퇴 회원 목록</div>
	</div>

<!-- 섹션 영역 시작 -->
	<div class="out_memList_wrap">
    	<form class="ml_search_wrap" method="post" action="out_memList_search">
	        <div>
	        	<select name="" class="memList_select">
		            <option value="탈퇴일">탈퇴일</option>
		            <option value="가입일">가입일</option>
		            <option value="이름">이름</option>
		            <option value="아이디">아이디</option>
	        	</select>
	        </div>
	        <div>
	        	<input type="text" class="ml_search_text">
	        </div>
	        <div>
	        	<input type="submit" class="ml_search_btn" value="검색">
	        </div>
    	</form>
    	
    	<div class="oml_table_wrap">
    	  <form name="out_mem_del" method="post" action="outMem_delete.do" onsubmit="return del_confirm()" id="general">
	        <table class="out_memList_table" id="general_content">
		      <thead>
		        <tr>
		            <th class="oml_t01"><input id="allCheck" type="checkbox" name="allCheck"/></th>
		            <th class="oml_t01">번호</th>
		            <th>탈퇴일</th>
		            <th>가입일</th>
		            <th>이름</th>
		            <th>아이디</th>
		            <th>구매 금액</th>
		            <th>삭제 예정일</th>
		        </tr>
		      </thead>
		      <tbody>
				<c:forEach var="dto" items="${ out_member_list }" begin="0" step="1" varStatus="status">
			        <tr onclick="location.href='/project_ezen/admin_member/outMember_view.do?out_member_idx=${dto.out_member_idx}';" style="cursor:pointer;">
			          <td class="oml_t01" onclick="event.cancelBubble=true"><input type="checkbox" value="${dto.out_member_idx}" name="chk" /></td> 
			          <td class="oml_t01">${dto.out_member_idx}</td>
			          <fmt:formatDate value="${dto.out_member_date}" pattern="yyyy-MM-dd" var="out_reg" />
			          <td>${ out_reg }</td>
			          <%-- <fmt:formatDate value="${dto.out_member_join_date}" pattern="yyyy-MM-dd" var="reg" /> --%>
			          <td>${ dto.out_member_join_date }</td>
			          <td class="oml_t02"><a href="/project_ezen/admin_member/outMember_view.do?out_member_idx=${dto.out_member_idx}">${dto.out_member_name}</a></td>
			          <td>${dto.out_member_id}</td>
			          <td>${dto.out_member_pay_sum}원</td>
			          <td>2022-03-01 <br>365일 남음</td>
			    	</tr>
		        </c:forEach>
	      	  </tbody> 
	        </table>
	        <ul class="pagination justify-content-center">
	        <c:if test="${outMemberCount > 0}">
			  <!--페이지 개수  -->
			    <c:set var="pageCount" value="${outMemberCount / pageSize + ( outMemberCount % pageSize == 0 ? 0 : 1)}" />
			    <c:set var="startPage" value="${pageGroupSize*(nowPageGroup-1)+1}" />
			    <c:set var="endPage" value="${startPage + pageGroupSize-1}" />
			    <c:if test="${endPage > pageCount}">
			      <c:set var="endPage" value="${pageCount}" />
			    </c:if>
			 
			    <c:if test="${nowPageGroup > 1}">
			      <li class="page-item">
			      	<a class="page-link" href="<c:url value = "/project_ezen/admin_member/outMember_list.do?page=${(nowPageGroup-2)*pageGroupSize+1 }&pageSize=${pageSize}"/>">
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
					    <a class="page-link" href="<c:url value="/project_ezen/admin_member/outMember_list.do?page=${i}&pageSize=${pageSize}"/>">				     
					        ${i} 
					    </a>
				      </li>
			        </c:when>
			        <c:otherwise>
				      <li class="page-item">
					    <a class="page-link" href="<c:url value="/project_ezen/admin_member/outMember_list.do?page=${i}&pageSize=${pageSize}"/>">				     
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
			        <a class="page-link" href="<c:url value = "/project_ezen/admin_member/outMember_list.do?page=${nowPageGroup*pageGroupSize+1}&pageSize=${pageSize}"/>">
			        다음
			        </a>
			      </li>
			    </c:if>
			  </c:if>
	        </ul>
	        
	        <input type="hidden" name="aaa" value="1" />
	        <div class="om_del_btn_wrap">
	        	<input type="submit" class="om_del_btn" value="선택 삭제" >
            </div> 	      
	      </form>  
	    </div>
	</div>
<i class="fas fa-arrow-alt-circle-up"></i>
    
<!-- 섹션 영역 끝 -->
  <script>
	$(function(){
		var chkObj = document.getElementsByName("chk");
		var rowCnt = chkObj.length;
		
		$("input[name='allCheck']").click(function(){
			var chk_listArr = $("input[name='chk']");
			for (var i=0; i<chk_listArr.length; i++){
				chk_listArr[i].checked = this.checked;
			}
		});
		$("input[name='chk']").click(function(){
			if($("input[name='chk']:checked").length == rowCnt){
				$("input[name='allCheck']")[0].checked = true;
			}
			else{
				$("input[name='allCheck']")[0].checked = false;
			}
		});
	});
  	function del_confirm() {
  		var valueArr = new Array();
  		var list = $("input[name='chk']");
  		for(var i = 0; i < list.length; i++) {
  			if(list[i].checked) {
  				valueArr.push(list[i].value);
  				console.log(valueArr[i]);
  			}
  		}
  		if(valueArr.length == 0){
			alert("선택한 회원이 없습니다.");
			return false;
		} else {
			var a = confirm("선택한 탈퇴 회원을 삭제하시겠습니까?")
	    	if(a == true){
	    		
	    	} else {
	    		window.history.go(0);
	    		return false;
	    	}
		}
  		
  	}  
  	
    /* var $general = $('#general');

    $general.submit(function (e) {
      e.preventDefault();
      var rowPerPage =2; // 일단 데이터2개당 페이지넘어가게 설정 (**나중에 데이터연동때 바꾸기**)
      var zeroWarning = 'Sorry, but we cat\'t display "0" rows page. + \nPlease try again.'
      
      if (!rowPerPage) {
       alert(zeroWarning);
       return;
      }
      
      $('#paynav').remove();
      var $general_content = $('#general_content');

      $general_content.after('<div id="paynav">');
      var $tr = $($general_content).find('tbody tr');
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
    
    $general.submit(); */
  </script>


	<c:import url="/footer.jsp" />	