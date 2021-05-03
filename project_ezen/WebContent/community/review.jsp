<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    <c:import url="/header.jsp" />
      <div class="mypage_header_img"></div>

<!-- 현재 위치 표시 -->
   <div class="where">
      <a href="/project_ezen/index.jsp">H</a>
      <div>커뮤니티</div>
      <div>이용후기</div>
   </div>
<div class="search">
      <form action="/page/board/search_result.php" method="get">
      <select name="catgo">
        <option value="title">제목</option>
        <option value="name">글쓴이</option>
        <option value="content">내용</option>
      </select>
      <input type="sumit" name="search" size="60" required="required"/> 
      <button>검색</button>
    </form>
  </div>
        
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
          <td class="t02_wrap"><a href="notice_view.jsp">정말 친절합니다.</a></td>
          <td class="t03_wrap">관리자</td>
          <td class="t04_wrap">2020-03-01</td>
          <td class="t05_wrap">356</td>
          </tr>
         <tr>
          <td class="t01_wrap">7</td>
          <td class="t02_wrap"><a href="notice_view.jsp">헬스기구가 깔끔해요.</a></td>
          <td class="t03_wrap">관리자</td>
          <td class="t04_wrap">2020-03-01</td>
          <td class="t05_wrap">356</td>
          </tr><tr>
          <td class="t01_wrap">6</td>
          <td class="t02_wrap"><a href="notice_view.jsp">트레이너분들이 친절합니다.</a></td>
          <td class="t03_wrap">관리자</td>
          <td class="t04_wrap">2020-03-01</td>
          <td class="t05_wrap">356</td>
          </tr><tr>
          <td class="t01_wrap">5</td>
          <td class="t02_wrap"><a href="notice_view.jsp">덕분에 살이빠졌습니다.</a></td>
          <td class="t03_wrap">관리자</td>
          <td class="t04_wrap">2020-03-01</td>
          <td class="t05_wrap">356</td>
          </tr><tr>
          <td class="t01_wrap">4</td>
          <td class="t02_wrap"><a href="notice_view.jsp">감사합니다.</a></td>
          <td class="t03_wrap">관리자</td>
          <td class="t04_wrap">2020-03-01</td>
          <td class="t05_wrap">356</td>
          </tr><tr>
          <td class="t01_wrap">3</td>
          <td class="t02_wrap"><a href="notice_view.jsp">여러분들 덕분입니다.</a></td>
          <td class="t03_wrap">관리자</td>
          <td class="t04_wrap">2020-03-01</td>
          <td class="t05_wrap">356</td>
          </tr><tr>
          <td class="t01_wrap">2</td>
          <td class="t02_wrap"><a href="notice_view.jsp">새로운 세상입니다.</a></td>
          <td class="t03_wrap">관리자</td>
          <td class="t04_wrap">2020-03-01</td>
          <td class="t05_wrap">356</td>
          </tr><tr>
          <td class="t01_wrap">1</td>
          <td class="t02_wrap"><a href="notice_view.jsp">효과가 뛰어납니다.</a></td>
          <td class="t03_wrap">관리자</td>
          <td class="t04_wrap">2020-03-01</td>
          <td class="t05_wrap">356</td>
          </tr>
      </table>
  </div>
</div>      
   
<div class="board_page">

<a href="notice_view.jsp"><class="bt prev"><</a>
<a href="notice_view.jsp"><class="num on">1</a>
<a href="notice_view.jsp"><class="num">2</a>
<a href="notice_view.jsp"><class="num">3</a>
<a href="notice_view.jsp"><class="num">4</a>
<a href="notice_view.jsp"><class="num">5</a>
<a href="notice_view.jsp"><class="num">6</a>
<a href="notice_view.jsp"><class="num">7</a>
<a href="notice_view.jsp"><class="num">8</a>
<a href="notice_view.jsp"><class="num">9</a>
<a href="notice_view.jsp"><class="bt next">></a>
   
   <div class="revbuttons">
          <input class="revsub" type="submit" value="글쓰기"/>
		  <a href="review_write.jsp">
		  </div>


  
  
<!-- notice 영역 끝 -->

   
<c:import url="/footer.jsp" />