<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    <c:import url="/header.jsp" />
      <div class="mypage_header_img"></div>

<!-- 현재 위치 표시 -->
   <div class="where">
      <a href="/project_ezen/index.jsp">H</a>
      <div>커뮤니티</div>
      <div>이용후기 쓰기</div>
   </div>
  <div class="review_write_wrap">
                    
   <div class="review_write_content">
      <form name="rewrite" method="post" action="rwrite">
        <table class="review_write_table">
          <tr>
            <th>제목</th>
            <td class="review_write_td">
              <input class="retitle" type="text" name="ftitle" placeholder="제목을 입력해 주세요!">
          </tr>
         
        
            <td colspan="2">
              <textarea name="qna_content" class="ckeditor" cols="52" value=""></textarea>
            </td>
          </tr>
        </table>
       <div class="nbuttons">
          <input class="nwritesub" type="submit" value="등록"/>
		  <a href="review.jsp">
            <input class="nwritebutton" type="button" value="취소"/>
          </a>	
	    </div>
      </form>
    </div>
      
  </div>

   <script src="https://cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>
  

   
   
   <c:import url="/footer.jsp" />