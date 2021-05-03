<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
  <title>메인 페이지</title>
    
    <link rel="stylesheet" href="/project_ezen/css/main_style.css"> 
    <link rel="stylesheet" href="/project_ezen/css/admin_main_style.css">
    <link rel="stylesheet" href="/project_ezen/css/admin_trainner_modify_style.css">
    <link rel="stylesheet" href="/project_ezen/css/Mypage_style.css">
    <link rel="stylesheet" href="/project_ezen/css/adminMem_style.css">
    <link rel="stylesheet" href="/project_ezen/css/adminPay_style.css">
    <link rel="stylesheet" href="/project_ezen/css/adminService_style.css">
    <link rel="stylesheet" href="/project_ezen/css/admin_notice_style.css">
    
    <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
        
    <!-- css새로 만들 때마다 추가 기입해야 함 -->
    <style>
		@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap');
    </style>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
    <script type="text/javascript" src="/project_ezen/js/join_check.js"></script>

<!-- 	<script>
		if (self.name != 'reload') {
		    self.name = 'reload';
		    self.location.reload(true);
		}
		else self.name = '';
	</script> -->
</head>
<body>
<div id="wrap">
  <div class="top">
    <div class="topMenu">
      <span class="home"><a href="/project_ezen/admin_member/member_list.do?member_name=${member_name}&page=1">HOME</a></span>
	  <%
	    String member_idx = (String)session.getAttribute("member_idx");
	    String member_name = (String)session.getAttribute("member_name");
		/* String member_id = (String)session.getAttribute("member_id");  */
	    /* String member_phone = (String)session.getAttribute("member_phone");
	    String member_email = (String)session.getAttribute("member_email"); */ 
	    
		//null체크
		if( member_idx != null) 
		{
			//로그인 상태
	  %>
	    <span onclick="location.href='/project_ezen/admin_member/member_list.do?member_name=${member_name}&page=1';" style="cursor:pointer; color: #5467F5;">
	    <%= member_name %>님&nbsp;
	     	<a href="/project_ezen/admin_member/member_list.do?member_name=${member_name}&page=1">마이페이지</a> 
	    </span>
		<span><a href="/project_ezen/member/logout.jsp">로그아웃</a></span>
	  <%
		}
		else
		{
	  %>
		<span><a href="/project_ezen/member/loginForm.jsp">로그인</a></span>
        <span><a href="/project_ezen/member/join_agree.jsp">회원가입</a></span>
	  <%
		}
	  %> 
    </div>
  </div>
  <!-- 네비 -->

<div class="navbar">
  <div class="logo">
  	<a href="/project_ezen/admin_member/member_list.do?member_name=${member_name}&page=1">
      <img src="/project_ezen/img/main_img/logo1.png" alt="로고">
    </a>
  </div>
  <div class="dropdown">
    <button class="dropbtn">회원관리
    </button>
    <div class="dropdown-content">
      <div class="row">
        <div class="column">
          <a href="/project_ezen/admin_member/member_list.do?member_name=${member_name}&page=1">회원리스트</a>
          <a href="/project_ezen/admin_member/outMember_list.do?page=1">탈퇴회원목록</a>
        </div>
        <div class="column">
          <a href="/project_ezen/admin_gymmanage/admin_trainner.jsp">트레이너수정</a>
          <a href="/project_ezen/admin_gymmanage/admin_schedule.do?member_idx=${member_idx}">시간표 수정</a>
        </div>
        <div class="column">
          <a href="/project_ezen/admin_payment/admin_paymain.jsp">온라인결제관리</a>
        </div>
        <div class="column">
        <!-- 아래 주석은 예시 - 나중에 이렇게 바꿔야 합니다 -->
          <%-- <a href="/project_ezen/admin_community/admin_noice.do?member_name=${member_name}">공지사항</a> --%>
          
          <a href="/project_ezen/admin_community/admin_notice.jsp">공지사항</a>
          <a href="/project_ezen/admin_community/admin_event.jsp">이벤트</a>
          <a href="/project_ezen/admin_community/admin_review.jsp">이용후기</a>
          <a href="/project_ezen/admin_community/admin_recruitment.jsp">채용안내</a>
        </div>
        <div class="column">
          <a href="/project_ezen/admin_service/admin_inquiry.jsp">1:1문의</a>
          <a href="/project_ezen/admin_service/admin_faq.jsp">FAQ</a>
        </div>
      </div>
    </div>
  </div>
  <div class="dropdown">
    <button class="dropbtn">헬스장관리
    </button>
        <div class="dropdown-content">
       <div class="row">
        <div class="column">
          <a href="/project_ezen/admin_member/member_list.do?member_name=${member_name}&page=1">회원리스트</a>
          <a href="/project_ezen/admin_member/outMember_list.do?page=1">탈퇴회원목록</a>
        </div>
        <div class="column">
          <a href="/project_ezen/admin_gymmanage/admin_trainner.jsp">트레이너수정</a>
          <a href="/project_ezen/admin_gymmanage/admin_schedule.do?member_idx=${member_idx}">시간표 수정</a>
        </div>
        <div class="column">
          <a href="/project_ezen/admin_payment/admin_paymain.jsp">온라인결제관리</a>
        </div>
        <div class="column">
          <a href="/project_ezen/admin_community/admin_notice.jsp">공지사항</a>
          <a href="/project_ezen/admin_community/admin_event.jsp">이벤트</a>
          <a href="/project_ezen/admin_community/admin_review.jsp">이용후기</a>
          <a href="/project_ezen/admin_community/admin_recruitment.jsp">채용안내</a>
        </div>
        <div class="column">
          <a href="/project_ezen/admin_service/admin_inquiry.jsp">1:1문의</a>
          <a href="/project_ezen/admin_service/admin_faq.jsp">FAQ</a>
        </div>
      </div>
    </div>
  </div>
  <div class="dropdown">
    <button class="dropbtn">온라인결제관리
    </button>
      <div class="dropdown-content">
       <div class="row">
        <div class="column">
          <a href="/project_ezen/admin_member/member_list.do?member_name=${member_name}&page=1">회원리스트</a>
          <a href="/project_ezen/admin_member/outMember_list.do?page=1">탈퇴회원목록</a>
        </div>
        <div class="column">
          <a href="/project_ezen/admin_gymmanage/admin_trainner.jsp">트레이너수정</a>
          <a href="/project_ezen/admin_gymmanage/admin_schedule.do?member_idx=${member_idx}">시간표 수정</a>
        </div>
        <div class="column">
          <a href="/project_ezen/admin_payment/admin_paymain.jsp">온라인결제관리</a>
        </div>
        <div class="column">
          <a href="/project_ezen/admin_community/admin_notice.jsp">공지사항</a>
          <a href="/project_ezen/admin_community/admin_event.jsp">이벤트</a>
          <a href="/project_ezen/admin_community/admin_review.jsp">이용후기</a>
          <a href="/project_ezen/admin_community/admin_recruitment.jsp">채용안내</a>
        </div>
        <div class="column">
          <a href="/project_ezen/admin_service/admin_inquiry.jsp">1:1문의</a>
          <a href="/project_ezen/admin_service/admin_faq.jsp">FAQ</a>
        </div>
      </div>
    </div>
  </div>
  <div class="dropdown">
    <button class="dropbtn">커뮤니티관리
    </button>
      <div class="dropdown-content">
       <div class="row">
        <div class="column">
          <a href="/project_ezen/admin_member/member_list.do?member_name=${member_name}&page=1">회원리스트</a>
          <a href="/project_ezen/admin_member/outMember_list.do?page=1">탈퇴회원목록</a>
        </div>
        <div class="column">
          <a href="/project_ezen/admin_gymmanage/admin_trainner.jsp">트레이너수정</a>
          <a href="/project_ezen/admin_gymmanage/admin_schedule.do?member_idx=${member_idx}">시간표 수정</a>
        </div>
        <div class="column">
          <a href="/project_ezen/admin_payment/admin_paymain.jsp">온라인결제관리</a>
        </div>
        <div class="column">
          <a href="/project_ezen/admin_community/admin_notice.jsp">공지사항</a>
          <a href="/project_ezen/admin_community/admin_event.jsp">이벤트</a>
          <a href="/project_ezen/admin_community/admin_review.jsp">이용후기</a>
          <a href="/project_ezen/admin_community/admin_recruitment.jsp">채용안내</a>
        </div>
        <div class="column">
          <a href="/project_ezen/admin_service/admin_inquiry.jsp">1:1문의</a>
          <a href="/project_ezen/admin_service/admin_faq.jsp">FAQ</a>
        </div>
      </div>
    </div>
  </div>
  <div class="dropdown">
    <button class="dropbtn">고객센터 관리
    </button>
      <div class="dropdown-content">
       <div class="row">
        <div class="column">
          <a href="/project_ezen/admin_member/member_list.do?member_name=${member_name}&page=1">회원리스트</a>
          <a href="/project_ezen/admin_member/outMember_list.do?page=1">탈퇴회원목록</a>
        </div>
        <div class="column">
          <a href="/project_ezen/admin_gymmanage/admin_trainner.jsp">트레이너수정</a>
          <a href="/project_ezen/admin_gymmanage/admin_schedule.do?member_idx=${member_idx}">시간표 수정</a>
        </div>
        <div class="column">
          <a href="/project_ezen/admin_payment/admin_paymain.jsp">온라인결제관리</a>
        </div>
        <div class="column">
          <a href="/project_ezen/admin_community/admin_notice.jsp">공지사항</a>
          <a href="/project_ezen/admin_community/admin_event.jsp">이벤트</a>
          <a href="/project_ezen/admin_community/admin_review.jsp">이용후기</a>
          <a href="/project_ezen/admin_community/admin_recruitment.jsp">채용안내</a>
        </div>
        <div class="column">
          <a href="/project_ezen/admin_service/admin_inquiry.jsp">1:1문의</a>
          <a href="/project_ezen/admin_service/admin_faq.jsp">FAQ</a>
        </div>
      </div>
    </div>
  </div>
</div>
</div>
