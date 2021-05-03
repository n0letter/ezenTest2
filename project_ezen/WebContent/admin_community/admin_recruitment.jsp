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
      <div>채용안내</div>
   </div>
 

<div class="admin_notice_wrap">
   <div class="admin_table_wrap">
      <table class="admin_table">
         <tr>
          <th class="adt01">번호</th>
          <th class="adt02">제목</th>
          <th class="adt03">작성자</th>
          <th class="adt04">작성일</th>
          
        </tr>
        <tr>
          <td class="adt01_wrap">8</td>
          <td class="adt02_wrap"><a href="notice_view.jsp">굿초이스에서 새로운 가족을 모집합니다.</a></td>
          <td class="adt03_wrap">관리자</td>
          <td class="adt04_wrap">2020-03-01</td>
        
          </tr>
         <tr>
          <td class="adt01_wrap">7</td>
          <td class="adt02_wrap"><a href="notice_view.jsp">채용안내는 여기서 안내해 드립니다.</a></td>
          <td class="adt03_wrap">관리자</td>
          <td class="adt04_wrap">2020-03-01</td>
       
          </tr><tr>
          <td class="adt01_wrap">6</td>
          <td class="adt02_wrap"><a href="notice_view.jsp"></a></td>
          <td class="adt03_wrap">관리자</td>
          <td class="adt04_wrap">2020-03-01</td>
       
          </tr><tr>
          <td class="adt01_wrap">5</td>
          <td class="adt02_wrap"><a href="notice_view.jsp"></a></td>
          <td class="adt03_wrap">관리자</td>
          <td class="adt04_wrap">2020-03-01</td>
         
          </tr><tr>
          <td class="adt01_wrap">4</td>
          <td class="adt02_wrap"><a href="notice_view.jsp"></a></td>
          <td class="adt03_wrap">관리자</td>
          <td class="adt04_wrap">2020-03-01</td>
        
          </tr><tr>
          <td class="adt01_wrap">3</td>
          <td class="adt02_wrap"><a href="notice_view.jsp"></a></td>
          <td class="adt03_wrap">관리자</td>
          <td class="adt04_wrap">2020-03-01</td>
        
          </tr><tr>
          <td class="adt01_wrap">2</td>
          <td class="adt02_wrap"><a href="notice_view.jsp"></a></td>
          <td class="adt03_wrap">관리자</td>
          <td class="adt04_wrap">2020-03-01</td>
        
          </tr><tr>
          <td class="adt01_wrap">1</td>
          <td class="adt02_wrap"><a href="notice_view.jsp"></a></td>
          <td class="adt03_wrap">관리자</td>
          <td class="adt04_wrap">2020-03-01</td>
       
          </tr>
      </table>
  </div>
</div>      
   
<div class="admin_board_page">


<a href="notice_view.jsp"><class="num on">1</a>
<a href="notice_view.jsp"><class="num">2</a>
<a href="notice_view.jsp"><class="num">3</a>
<a href="notice_view.jsp"><class="num">4</a>
<a href="notice_view.jsp"><class="num">5</a>
<a href="notice_view.jsp"><class="num">6</a>
<a href="notice_view.jsp"><class="num">7</a>
<a href="notice_view.jsp"><class="num">8</a>
<a href="notice_view.jsp"><class="num">9</a>


           <div class="rebuttons">
          <input class="resub" type="submit" value="글쓰기"/>
		  <a href="admin_notice.jsp">
		  </div>
</div>

  <c:import url="/footer.jsp" />