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
  
  <!-- 현재위치표시 영역 시작 -->    
  <div class="where">
    <a href="/project_ezen/main.jsp">H</a>
    <div>고객센터</div>
    <div>1:1문의</div>
  </div>
  <!-- 현재위치표시 영역 끝 -->
  
  <!-- admin_inquiry 영역 시작 -->
  <div class="admin_inquiry_wrap">
  
    <!-- 상단타이틀+버튼 -->
    <div class="admin_inquiry_title">
  	  <h4><small class="adminService_small">▌</small>1:1문의 리스트</h4>
	  <input type="button" class="admin_inquiry_btn" id="admin_inquiry_btn" value="답변없는 문의만 보기">
  	</div>
  	
    <!-- 표 -->
    <div class="admin_inquiry_table"> 	        
      <form  name="admin_inquiry_content" action="admin_inquiry_content" id="general">
        <table class="admin_inquiry_table_wrap" id="general_content">
          <thead>
            <tr>
              <th>번호</th>
              <th>유형</th>
              <th>제목</th>
              <th>작성자</th>
              <th>답변상태</th>
              <th>작성일</th>
            </tr>
          </thead>
          <tbody>
            <tr class="X" onclick="location.href='/project_ezen/admin_service/admin_inquiry_view.jsp?inquiry_idx=${dto.inquiry_idx}';" style="cursor:pointer;" >
              <td>1</td>
              <td>결제</td>
              <td>결제 후 시작일을 잘못입력 했습니다.</td>
              <td>홍길동</td>
              <td>미답변</td>
              <td>2021-03-22</td>
            </tr>
            <tr class="X" onclick="location.href='/project_ezen/admin_service/admin_inquiry_view.jsp?inquiry_idx=${dto.inquiry_idx}';" style="cursor:pointer;">
              <td>2</td>
              <td>환불</td>
              <td>일반회원권 개월 수를 잘못결제 했습니다.</td>
              <td>이순신</td>
              <td>미답변</td>
              <td>2021-03-22</td>
            </tr>
            <tr class="O" onclick="location.href='/project_ezen/admin_service/admin_inquiry_view.jsp?inquiry_idx=${dto.inquiry_idx}';" style="cursor:pointer;">
              <td>3</td>
              <td>결제</td>
              <td>어떻게 해결해야하나요?</td>
              <td>세종대왕</td>
              <td>답변완료</td>
              <td>2021-03-22</td>
            </tr>
            <tr class="O" onclick="location.href='/project_ezen/admin_service/admin_inquiry_view.jsp?inquiry_idx=${dto.inquiry_idx}';" style="cursor:pointer;">
              <td>4</td>
              <td>회원정보</td>
              <td>관리자님께 문의드립니다.</td>
              <td>을지문덕</td>
              <td>답변완료</td>
              <td>2021-03-21</td>
            </tr>
            <tr class="O" onclick="location.href='/project_ezen/admin_service/admin_inquiry_view.jsp?inquiry_idx=${dto.inquiry_idx}';" style="cursor:pointer;">
              <td>5</td>
              <td>결제</td>
              <td>결제했는데 문제가 생겼습니다.</td>
              <td>단군</td>
              <td>답변완료</td>
              <td>2021-03-20</td>
            </tr>
            <tr class="O" onclick="location.href='/project_ezen/admin_service/admin_inquiry_view.jsp?inquiry_idx=${dto.inquiry_idx}';" style="cursor:pointer;">
              <td>6</td>
              <td>기타</td>
              <td>쿠폰은 어떻게 사용하나요?</td>
              <td>문익점</td>
              <td>답변완료</td>
              <td>2021-03-20</td>
            </tr>          
          </tbody>
        </table> 	
      </form>
    </div>
      
  </div>
  <!-- admin_inquiry 영역 끝 -->
  
  <script>
  var $general = $('#general');

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
  
  $general.submit();
  </script>
  
  <script>
  $("[id^='admin_inquiry_btn']").click(function() { 
      $("[class^='O']").hide(); 
      var n = $(this).text(); 
      $("[class^='X']").show(); 
  }); 
  </script>
  
  <a id="back-to-top" href="#" class="back-to-top" role="button" title="" data-toggle="tooltip" data-placement="left" data-original-title="" style="display: block;">
    <i class="fas fa-arrow-alt-circle-up"></i>
  </a>

  <c:import url="/footer.jsp" />