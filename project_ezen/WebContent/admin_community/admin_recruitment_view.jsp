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
      <div>커뮤니티</div>
      <div>공지사항 보기</div>
   </div>
  <div class="admin_board_wrap">
    
        <div class="admin_board_write_wrap">
            
                <div class="board00"></div>
  <div class="board">
    <div class="board-form">
      <table width="100%">
        <tbody>
          <tr>
            <td>
              <table>
                <tbody>
                  <tr>
                    <td class="board-left">제목</td>
                    <td class="board-right">
                      <input type="text" class="name" id="name">
                    </td>
                  </tr>
                  <tr>
                    <td class="board-left">카테고리</td>
                    <td class="board-right">
                      <select name="category" id="">
                        <option value="0" selected>채용안내</option>
                        <option value="1" selected>공지사항</option>
                        <option value="2" selected>이벤트</option>
                        <option value="3" selected>이용후기</option>
                      </select>
                    </td>
                  </tr>
                
                  <tr>
                    <td class="board-left">작성자</td>
                    <td class="board-right">
                      <input type="text" class="name" id="관리자">
              
                    
                    </td>
                  </tr>
                  <tr>
                    <td class="boardleft">작성일</td>
                    <td class="board-right">
                      <input type="text" class="input" id="mail">
                    </td>
                  </tr>
                
                  <tr>
                    <td class="ta-left">내용</td>
                    <td class="ta-right">
                      <textarea name="" class="" cols="52">
                      
                    굿초이스의 미래를 이끌어 갈 열정과 신념을 가진 신입 직원을 다음과 같이 모집
                    하오니 많은 응모 바랍니다. 
                    
                    1.지원대상 및 선발인원
                    -지원대상: 생활스포츠지도사 2급 이상 자격증 소지자
                    -선발인원: 0명
                    2.지원서 접수  : 2021-03-31 18:00까지
                    3.지원방식 :  이메일 접수(goodchoice@gmail.com)
                    4.지원서 양식
                    -이력서 기재사항: 이름, 나이, 성별, 경력, 연락처, 자기소개(자유형식)
                    -제출서류: 이력서, 자격증
                    
                    굿초이스 피트니스는 출퇴근이 자유롭고 고액연봉을 보장합니다. 회원과 1:1 맞춤 PT를 
                    함으로써 시간선택이 자유롭고 만족스럽습니다. 트레이너 분들의 많은 참여 바랍니다. 
                    문의(02-0000-0000)
                      
                    </textarea>
                    </td>
                  </tr>
                </tbody>
              </table>
            </td>
          </tr>
                  </tbody>
      </table>
    </div>
  </div>  
         <div class="rbuttons">
          <input class="rwritesub" type="submit" value="수정"/>
		  <a href="admin_recruitment.jsp">
            <input class="rwritebutton" type="button" value="취소"/>
        </div>
    </div>
 
 
 
 
    
   <c:import url="/footer.jsp" />