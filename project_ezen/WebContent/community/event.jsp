<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    <c:import url="/header.jsp" />
      <div class="mypage_header_img"></div>

<!-- 현재 위치 표시 -->
   <div class="where">
      <a href="/project_ezen/index.jsp">H</a>
      <div>커뮤니티</div>
      <div>이벤트</div>
   </div>


<div class="notice_wrap">
   <div class="table_wrap">
      <table class="table">
         <tr>
          <th class="t01">번호</th>
          <th class="t02">제목</th>
          <th class="t03">작성자</th>
          <th class="t04">작성일</th>
          <th class="t05">조회수</th>          
        </tr>
        <tr>
          <td class="t01_wrap">8</td>
          <td class="t02_wrap"><a href="notice_view.jsp">새로운 이벤트.</a></td>
          <td class="t03_wrap">관리자</td>
          <td class="t04_wrap">2020-03-01</td>
          <td class="t05_wrap">356</td>
          </tr>
         <tr>
          <td class="t01_wrap">7</td>
          <td class="t02_wrap"><a href="notice_view.jsp">굿초이스 1월이벤트</a></td>
          <td class="t03_wrap">관리자</td>
          <td class="t04_wrap">2020-03-01</td>
          <td class="t05_wrap">356</td>
          </tr><tr>
          <td class="t01_wrap">6</td>
          <td class="t02_wrap"><a href="notice_view.jsp">후기쓰신 분들에게 상품증정</a></td>
          <td class="t03_wrap">관리자</td>
          <td class="t04_wrap">2020-03-01</td>
          <td class="t05_wrap">356</td>
          </tr><tr>
          <td class="t01_wrap">5</td>
          <td class="t02_wrap"><a href="notice_view.jsp">2월의 이벤트</a></td>
          <td class="t03_wrap">관리자</td>
          <td class="t04_wrap">2020-03-01</td>
          <td class="t05_wrap">356</td>
          </tr><tr>
          <td class="t01_wrap">4</td>
          <td class="t02_wrap"><a href="notice_view.jsp">3월의 이벤트.</a></td>
          <td class="t03_wrap">관리자</td>
          <td class="t04_wrap">2020-03-01</td>
          <td class="t05_wrap">356</td>
          </tr><tr>
          <td class="t01_wrap">3</td>
          <td class="t02_wrap"><a href="notice_view.jsp">1+1이벤트.</a></td>
          <td class="t03_wrap">관리자</td>
          <td class="t04_wrap">2020-03-01</td>
          <td class="t05_wrap">356</td>
          </tr><tr>
          <td class="t01_wrap">2</td>
          <td class="t02_wrap"><a href="notice_view.jsp">이용후기 이벤트.</a></td>
          <td class="t03_wrap">관리자</td>
          <td class="t04_wrap">2020-03-01</td>
          <td class="t05_wrap">356</td>
          </tr><tr>
          <td class="t01_wrap">1</td>
          <td class="t02_wrap"><a href="notice_view.jsp">이벤트 게시판.</a></td>
          <td class="t03_wrap">관리자</td>
          <td class="t04_wrap">2020-03-01</td>
          <td class="t05_wrap">356</td>
          </tr>
      </table>
  </div>
</div>      
   
<div class="board_page">

<a href="notice.jsp"><class="bt prev"><</a>
<a href="notice.jsp"><class="num on">1</a>
<a href="notice.jsp"><class="num">2</a>
<a href="notice.jsp"><class="num">3</a>
<a href="notice.jsp"><class="num">4</a>
<a href="notice.jsp.jsp"><class="num">5</a>
<a href="notice.jsp.jsp"><class="num">6</a>
<a href="notice.jsp.jsp"><class="num">7</a>
<a href="notice.jsp.jsp"><class="num">8</a>
<a href="notice.jsp.jsp"><class="num">9</a>
<a href="notice.jsp.jsp"><class="bt next">></a>

</div>
<!-- notice 영역 끝 -->

   
<c:import url="/footer.jsp" />