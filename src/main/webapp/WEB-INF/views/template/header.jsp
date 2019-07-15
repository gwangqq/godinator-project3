<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>	
<!DOCTYPE HTML>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<!-- Scripts -->

<html>
<head>
<title>Godinator</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${root}/css/main.css" />
<link rel="stylesheet" href="${root}/css/recommendation.css"/>
<link rel="stylesheet" href="${root}/css/schooldetail.css"/>
<link rel="stylesheet" href="${root}/css/schoolnews.css"/>
<link rel="stylesheet" href="${root}/css/schoolrating.css"/>
<link rel="stylesheet" href="${root}/css/searchschool.css"/>
<link rel="stylesheet" href="${root}/css/login.css"/>
<link rel="stylesheet" href="${root}/css/register.css"/>
<!-- <link href="https://fonts.googleapis.com/css?family=Gamja+Flower&display=swap" rel="stylesheet"> -->
<!-- <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet"> -->

<!-- 카카오톡 로그인 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<script src="${root}/js/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	if("${withdrawMsg}"!=""){
		alert("${withdrawMsg}");
	}
	
	$("#loginBtn").click(function() {
		$("#loginBtn").attr("href","${root}/view/user/login.jsp");
		
		//location.href("/godinator/view/user/login.jsp");
	});
	
		Kakao.init('18f3deb02686176a9f41dc7fd612c3d0');
	$("#logoutBtn").click(function() {
		alert("로그아웃 되었습니다.")
		//$("#logoutBtn").attr("method","post").attr("action","${root}/user/logout").submit();
				var isKakao = $(this).attr("data-pass");
				if(isKakao == 'kakao'){
					Kakao.Auth.logout(function(data){
						$.ajax({
							url: '${root}/user/logout',
							type: 'post',
							success: function(msg) {
								alert(msg);
								location.href="${root}/view/user/main.jsp";
							} 
						});
					});
				} else {
					$.ajax({
						url: '${root}/user/logout',
						type: 'post',
						success: function(msg) {
							alert(msg);
							location.href="${root}/view/user/main.jsp";
						} 
					});
				}
		return false;
	});
		
	$(document).on("click", "#moveMypageBtn", function() {//회원정보수정
		//alert("회원수정하러 가실렵니까?");
		$("#editForm").attr("method","post").attr("action","${root}/user/moveMypage").submit();
		return false;
	});
	});
</script>
</head>

<body class="is-preload">
<div id="wrapper">
	<div id="main">
		<div class="inner">
			<header id="header">
			<c:if test="${not empty userInfo}">
				<a href="index.html" class="logo" id="userNameShow"><strong>${userInfo.userName}</strong> 님 환영합니다.</a>
			</c:if>
				<ul class="icons">
				<c:if test="${empty userInfo}">
					<li><a id="loginBtn"  href="">로그인</a></li>
				</c:if>	
				<c:if test="${not empty userInfo}">
					<li><a href="" id="logoutBtn">로그아웃</a></li>
					<li><a href="" id="moveMypageBtn">회원정보수정</a></li>
					<c:if test="${sessionScope.userInfo.userId == 'admin'}">
						<li><a href="${root}/member/main" id="logoutBtn">관리자페이지</a></li>
					</c:if>	
				</c:if>	
				</ul>
			</header>