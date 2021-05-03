<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<%
response.setHeader("Pragma", "no-cache"); 
response.setHeader("Cache-Control", "no-cache"); 
response.setHeader("Cache-Control", "no-store"); 
response.setDateHeader("Expires", 0L); 
%>
 
  <c:import url="/header.jsp" />
    
  <div class="mypage_header_img"></div>  
  
  <!-- 현재위치표시 영역 시작 -->    
  <div class="where">
    <a href="/project_ezen/main.jsp">H</a>
    <div>온라인 결제</div>
    <div>결제</div>
  </div>
  <!-- 현재위치표시 영역 끝 -->
  
  <!-- pay 영역 시작 --> 
  <div class="pay_wrap">
  
  	<div class="pay_title">
  	  <h4><small class="payment_small">▌</small>결제하기</h4> <hr>
  	</div>
  	
  	<form class="payform" name="payform" action="pay.do" method="post">
  	
      <%  
	    String pay_membership = (String)session.getAttribute("pay_membership");
        String choice_amount = (String)session.getAttribute("choice_amount");
        String pay_start_date = (String)session.getAttribute("pay_start_date");
        String pay_end_date = (String)session.getAttribute("pay_end_date");
        String coupon_amount = (String)session.getAttribute("coupon_amount");
        String pay_amount = (String)session.getAttribute("pay_amount");
    
        System.out.println("pay_membership : "+ pay_membership);	  
	    System.out.println("choice_amount : "+ choice_amount);
        System.out.println("pay_start_date : "+ pay_start_date);
	    System.out.println("pay_end_date : "+ pay_end_date);
	    System.out.println("coupon_amount : "+ coupon_amount);
	    System.out.println("pay_amount : "+ pay_amount);
	  %> 
	  
	  <input type="hidden" name="pay_coupon_num" id="pay_coupon_num" value="0"/>
	  <input type="hidden" name="pay_member_idx" value="${member_idx}"/>
	  
  	  <!-- 회원정보 --> 
      <div class="pay_A">
    
        <div class="pay_A_title">
          <h5><small class="payment_small">▌</small>회원정보 확인</h5>
          <input class="pay_btnA" type="button" value="회원정보 수정" onClick="location.href='/project_ezen/mypage/mypage_modify.do?member_idx=${member_idx}'"/>
        </div>
       
        <div class="pay_A_table">
          <table>
            <tr>
              <th>이름</th>
              <td>
                <input type="text" class="paytext" name="pay_name" value="${member_name}" readonly>
              </td>
            </tr>
            <tr>
              <th>연락처</th>
              <td>
                <input type="text" class="paytext" value="${member_phone}" readonly>
              </td>
            </tr>
            <tr>
              <th>이메일</th>
              <td>
                <input type="text" class="paytext" value="${member_email}" readonly>
              </td>
            </tr>
          </table>
        </div>
      
      </div>
    
      <!-- 결제하기+버튼 --> 
      <h5 class="pay_B_title"><small class="payment_small">▌</small>결제금액 확인 및 결제수단 선택</h5>
      
      <div class="pay_B">	
        <table>
          <tr>
            <th>결제 상품</th>
  		    <td>
  		      <input name="pay_membership" type="text" class="paytext" value="${pay_membership}" readonly>
  		    </td>
          </tr>
          <tr>
            <th>시작일</th>
            <td>
              <input name="pay_start_date" type="text" class="paytext" value="${pay_start_date}" readonly>
            </td>
          </tr>  
          <tr>  
            <th>종료일</th>
            <td>
              <input name="pay_end_date" type="text" class="paytext" value="${pay_end_date}" readonly>
            </td>
          </tr>
          <tr>
            <th>총 상품 금액</th>
            <td>
              <input name="choice_amount" type="text" class="payamount" value="${choice_amount}" readonly>
              <lable>원</lable>
            </td>
          </tr>
          <tr>
            <th>쿠폰 사용</th>
            <td>
              <lable>-</lable>
              <input name="coupon_amount" id="coupon_amount" type="text" class="pay_coupon" placeholder="0" readonly>
              
              <input class="pay_coupon_btn" type="button"  onclick="pay_coupon(this.form)" value="쿠폰선택" />
            </td>
          </tr>
          <tr>
            <th>총 결제 금액</th>
            <td>
              <input name="pay_amount" id="pay_amount" type="text" class="payamount" value="${choice_amount}"readonly>
              <lable>원</lable>
            </td>
          </tr>
          <tr>
            <th>결제 수단</th>
            <td>
          	  <input class="pay_radio" type="radio" name="pay_radio" value="카드 결제" checked/>카드 결제 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input class="pay_radio" type="radio" name="pay_radio" value="토스 결제">토스 결제 <br>
              <input class="pay_radio" type="radio" name="pay_radio" value="네이버페이 결제">네이버페이 결제 &nbsp;&nbsp;&nbsp;&nbsp;
              <input class="pay_radio" type="radio" name="pay_radio" value="카카오페이 결제">카카오페이 결제 <br>
              <input class="pay_radio" type="radio" name="pay_radio" value="페이코 결제">페이코 결제 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input class="pay_radio" type="radio" name="pay_radio" value="휴대폰 결제">휴대폰 결제
            </td>
          </tr>
        </table>
        
        <div>
          <hr class="pay_hr">
          <input class="pay_btnB" type="submit"  value="결제하기"/>
          <input class="pay_btnC" type="button"  value="취소" onClick="paycheck()"/>
        </div>
      </div>
    </form>
  
  </div>
  <!-- pay 영역 끝 -->
  
  <!-- 취소버튼 되묻기 -->
  <script>
    function paycheck() {
      var p  = document.payform;
    	
      var a = confirm("진행중인 결제를 취소하시겠습니까?")
      if(a == true){
        location.href = "/project_ezen/payment/choice.do";
      }
    }
  </script>
  
  <!-- 쿠폰함 -->
  <script>
    function pay_coupon(frm){  
      var url = "pay_coupon.jsp";
	  var title = "pay_coupon";
	  var status = "top=200, left=500, width=480, height=190, toolbar=no, menubar=no, scrollbars=yes, resizable=no, location=no";
	  window.open(url, title, status);
    }
  </script>

    <a id="back-to-top" href="#" class="back-to-top" role="button" title="" data-toggle="tooltip" data-placement="left" data-original-title="" style="display: block;">
    <i class="fas fa-arrow-alt-circle-up"></i>
  </a>

  <c:import url="/footer.jsp" />