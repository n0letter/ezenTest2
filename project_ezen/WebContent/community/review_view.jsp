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

<div class="review_wrap">
   <div class="table_wrap">
      <table class="table">
			<tr>
				<th class="rv01">이용후기 게시판</th>
				<th class="rv02">조회수</th>
				<th class="rv03">ID표기</th>
				<th class="rv04">작성일 표기</th>				     
			</tr>
</table>                         
                <div class="table_wrap">
            (내용표기)<br>
                     정말 친절합니다.<br>
                         이렇게 친절하다니<br>
                             어떻게 이럴 수 있죠?<br>                               
                                    다음에도 이용할게요.<br>
            <table class="table_01">
             <div class="table_text">
			<tr>
				<th>댓글 51개</th>
						     
			</tr>
</table>                         
                                    
                </div>
            </div>
         
                <div class="review_board">
          
       
                </div>
            </div>
            	<div class="reple_box">
			  <div class="reple_text">
		        <p>		 <br>
		        <br>
		       
						최대 500자까지 작성이 가능합니다.(띄어쓰기 포함)<br>
						*욕설, 이상한 비방글을 적어논 경우 관리자에 의해 삭제됩니다.
					
											</p>
								</div>
								</div>	 
             <div class="rebuttons">
          <input class="rewritesub" type="submit" value="등록"/>
			 <a href="review.jsp">
			
			 
			 <div class="rebuttons02">  	
			 <input class="rewritesub02" type="submit" value="목록"/>	
			  <a href="review.jsp">	
		     <input class="rewritesub02" type="submit" value="수정"/>
		
            <input class="rewritesub02" type="button" value="삭제"/>
                </div>	 
            </div>
           </div>	 
 

   <c:import url="/footer.jsp" />