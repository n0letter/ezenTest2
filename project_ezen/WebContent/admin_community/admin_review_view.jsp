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
      <div>이용후기 상세보기</div>
   </div>

<div class="admin_review_wrap">
   <div class="admin_table_wrap">
      <table class="admin_table">
			<tr>
				<th class="adrv01">이용후기 게시판</th>
				<th class="adrv02">조회수</th>
				<th class="adrv03">ID표기</th>
				<th class="adrv04">작성일 표기</th>				     
			</tr>
</table>                         
                <div class="admin_table_wrap">
            (내용표기)<br>
                     정말 친절합니다.<br>
                         이렇게 친절하다니<br>
                             어떻게 이럴 수 있죠?<br>                               
                                    다음에도 이용할게요.<br>
            <table class="admin_table_01">
             <div class="admin_table_text">
			
</table>                         
                                    
                </div>
            </div>
         
                <div class="admin_review_board">
               <tr>
			
						     
			</tr>
           (작성된 댓글)
       
                </div>
            </div>
            	<div class="admin_reple_box">
			  <div class="admin_reple_text">
		        <p>		 <br>
		        <br>
		       
						최대 500자까지 작성이 가능합니다.(띄어쓰기 포함)<br>
						*욕설, 이상한 비방글을 적어논 경우 관리자에 의해 삭제됩니다.
					
											</p>
								</div>
								</div>	 
             <div class="admin_reple_btn">
             <div class="admin_reple_btn01">      
		     <a href="review.jsp" class="on">등록</a>
			 
			 <div class="admin_reple_btn02">  			
		 
                <a href="review.jsp" class="on">목록</a>
                <a href="review.jsp" class="on">수정</a>
                <a href="review.jsp" class="on">삭제</a>
                </div>	 
            </div>
           </div>	 

   
   <c:import url="/footer.jsp" />