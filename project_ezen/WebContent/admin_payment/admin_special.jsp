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
    <div>결제관리</div>
    <div>결제내역</div>
    <div>스페셜 회원권</div>
  </div>
  <!-- 현재위치표시 영역 끝 -->
  
  <!-- special 영역 시작 -->
  <div class="payspecial_wrap">
  
    <!-- 상단타이틀+버튼 -->
    <div class="payspecial_title">
  	  <h4><small class="adminPay_small">▌</small>스페셜 회원권 결제관리</h4>
  	  <a href="admin_special_add.jsp">
        <input class="payspecial_btn" type="button" value="추가하기"/>
      </a>
  	</div>
  	
  	<!-- 표 -->
    <div class="payspecial_table"> 	        
      <form  name="payspecial_content" action="payspecial_content" id="special">
        <table class="payspecial_table_wrap" id="special_content">
          <thead>
            <tr>
              <th>번호</th>
              <th>유형</th>
              <th>결제일시</th>
              <th>결제상품</th>
              <th>시작일</th>
              <th>만료일</th>
              <th>고객명</th>
              <th>쿠폰사용</th>
              <th>결제금액</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>1</td>
              <td>현장</td>
              <td>2021-03-21</td>
              <td>스페셜회원권-그룹PT</td>
              <td>2021-04-01</td>
              <td>2021-07-01</td>
              <td>홍길동</td>
              <td>-0원</td>
              <td>400,000원</td>
            </tr>
            <tr>
              <td>2</td>
              <td>온라인</td>
              <td>2021-03-21</td>
              <td>스페셜회원권-필라테스</td>
              <td>2021-04-01</td>
              <td>2022-07-01</td>
              <td>세종대왕</td>
              <td>-50,000원</td>
              <td>510,000원</td>
            </tr>
            <tr>
              <td>3</td>
              <td>온라인</td>
              <td>2021-03-20</td>
              <td>스페셜회원권-필라테스</td>
              <td>2021-04-01</td>
              <td>2021-07-01</td>
              <td>이순신</td>
              <td>-30,000원</td>
              <td>530,000원</td>
            </tr>
            <tr>
              <td>4</td>
              <td>현장</td>
              <td>2021-03-20</td>
              <td>스페셜회원권-그룹PT</td>
              <td>2021-04-01</td>
              <td>2021-07-01</td>
              <td>선덕여왕</td>
              <td>-0원</td>
              <td>400,000원</td>
            </tr>
            <tr>
              <td>5</td>
              <td>현장</td>
              <td>2021-03-19</td>
              <td>스페셜회원권-골프</td>
              <td>2021-04-01</td>
              <td>2021-07-01</td>
              <td>수로왕</td>
              <td>-0원</td>
              <td>450,000원</td>
            </tr>
            <tr>
              <td>6</td>
              <td >온라인</td>
              <td>2021-03-19</td>
              <td>스페셜회원권-그룹PT</td>
              <td>2021-04-01</td>
              <td>2021-07-01</td>
              <td>광개토대왕</td>
              <td>-50,000원</td>
              <td>350,000원</td>
            </tr>          
          </tbody>
        </table> 	
      </form>
    </div>
      
  </div>
  <!-- special 영역 끝 -->

  <script>
    var $special = $('#special');

    $special.submit(function (e) {
      e.preventDefault();
      var rowPerPage =2; // 일단 데이터2개당 페이지넘어가게 설정 (**나중에 데이터연동때 바꾸기**)
      var zeroWarning = 'Sorry, but we cat\'t display "0" rows page. + \nPlease try again.'
      
      if (!rowPerPage) {
       alert(zeroWarning);
       return;
      }
      
      $('#paynav').remove();
      var $special_content = $('#special_content');

      $special_content.after('<div id="paynav">');
      var $tr = $($special_content).find('tbody tr');
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
    
    $special.submit();
  </script>
  
  <a id="back-to-top" href="#" class="back-to-top" role="button" title="" data-toggle="tooltip" data-placement="left" data-original-title="" style="display: block;">
    <i class="fas fa-arrow-alt-circle-up"></i>
  </a>

  <c:import url="/footer.jsp" />