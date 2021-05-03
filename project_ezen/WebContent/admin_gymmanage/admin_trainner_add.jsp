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
 	<div class="mypage_header_img">
    </div>
    	
<!-- 현재 위치 표시 -->
	<div class="where">
		<a href="/project_ezen/main.jsp">H</a>
		<div>헬스장 관리</div>
		<div>트레이너 추가</div>
	</div>
  
  <!-- 현재위치표시 영역 끝 -->
  
   <!-- trainner_modify 영역 시작 -->
  <div class="trainner_modify_wrap">
  <div class="admin_tmsection">
	<div class="admin_tmsection_section-text1"><small class="admin_tm_small">▌</small>트레이너 소개</div>
      <table width="100%" class="admin_tmtable">
                <tbody>
                  <tr>
                    <td class="admin_tm_form-left">트레이너 직책</td>
                    <td class="admin_tm_form-right1">
                      <select name="category" id="">
                        <option value="0" selected>PT트레이너</option>
                        <option value="1" selected>요가강사</option>
                      </select>
                    </td>
                  </tr>
            
                  <tr>
                    <td class="admin_tm-left">소개</td>
                    <td class="admin_tm-right">
                      <textarea class="trainner_modify_textarea" name="one2one_content" class="" cols="52"></textarea>
                    </td>
                  </tr>
        </tbody>
      </table>
      <div class="admin_tmfileup">
          <form action="fileupload.do" method="post" enctype="multipart/form-data">
            <input type="file" name="filename">
      </form>
      </div>
            <div class="admin_tmbtn">
           <a href="/project_ezen/main.jsp"><input class="tm_btnC" type="button" name="tm_btnA" value="추가"/></a>
           <a href="/project_ezen/admin_gymmanage/admin_trainner.jsp"><input class="tm_btnC" type="button" name="tm_btnB" value="목록으로"/></a>
           </div>  
    </div>
  </div>
  
	<!-- trainner_modify 영역 끝 -->


  <c:import url="/footer.jsp" />