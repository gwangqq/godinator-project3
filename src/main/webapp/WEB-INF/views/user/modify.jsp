<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>modify.jsp</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="/godinator/css/main.css" />
		<link rel="stylesheet" href="/godinator/css/register.css"/>
	</head>
	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
								<header id="header">
									
								</header>

							<!-- Content -->
								<div id="loginAll">
									<header class="main">
									
										<h1>개인정보 수정</h1>
									
									</header>

									<!-- Content -->
									<form id="loginForm" name="loginForm">
									<div>
										<h3 id="contentId">이름</h3>
										   <input type="text" name="loginId" id="loginId" value="" />
										   <br>
									
										<h3 id="contentPwd">아이디</h3>
										   <input type="text" name="loginPwd" id="loginPwd" value="" disabled="disabled"/>
										   <br>
									
										<h3 id="contentPwd">비밀번호</h3>
										   <input type="text" name="loginPwd" id="loginPwd" value="" />
										   <br>
									
										<h3 id="contentPwd">비밀번호 확인</h3>
										   <input type="text" name="loginPwd" id="loginPwd" value="" />
										   <div id="pwdCheck"></div>
										   <br>
											
										
										<h3 id="contentPwd">전화번호</h3>
										<div id="telAll">
											<div class="tel">
										   <input type="text" name="tel1" id="tel1" value="">
										   </div>
										   
											   <div class="tel">
											    <input type="text" name="tel2" id="tel2"  value="">
											    </div>
											   
											    <div class="tel">
											     <input type="text" name="tel3" id="tel3"  value="">
											     </div>
										 </div>
										   <br> <br>
									   
										<h3 id="contentPwd">우편번호</h3>
										   <input type="text" name="loginPwd" id="loginPwd" value="" />
										   <a href="#" class="button">우편번호검색</a>
										   <br>
										   <br>
										<h3 id="contentPwd">주소</h3>
										   <input type="text" name="loginPwd" id="loginPwd" value=""/>
										   <br>
									
										<h3 id="contentPwd">상세주소</h3>
										   <input type="text" name="loginPwd" id="loginPwd" value=""/>
									
									
											
									</div>
									</form>
										   <br>
									<ul class="actions">
										<li><a href="#" class="button primary">수정하기</a></li>
										<li><a href="#" class="button primary">탈퇴</a></li>
										<li><a href="#" class="button">취소</a></li>
									</ul>
									
									<hr class="major" />
								</div>

						</div>
					</div>

				<!-- Sidebar -->
					<div id="sidebar">
						<div class="inner">

							<!-- Search -->
								<section id="search" class="alt">
									<form method="post" action="#">
										<input type="text" name="query" id="query" placeholder="Search" />
									</form>
								</section>

							<!-- Menu -->
								<nav id="menu">
									<header class="major">
										<h2>Menu</h2>
									</header>
									<ul>
										<li><a href="/godinator/index.jsp">Homepage</a></li>
										<li><a href="/godinator/generic.jsp">Generic</a></li>
										<li><a href="/godinator/elements.jsp">Elements</a></li>
										<li>
											<span class="opener">Submenu</span>
											<ul>
												<li><a href="#">Lorem Dolor</a></li>
												<li><a href="#">Ipsum Adipiscing</a></li>
												<li><a href="#">Tempus Magna</a></li>
												<li><a href="#">Feugiat Veroeros</a></li>
											</ul>
										</li>
										<li><a href="#">Etiam Dolore</a></li>
										<li><a href="#">Adipiscing</a></li>
										<li>
											<span class="opener">Another Submenu</span>
											<ul>
												<li><a href="#">Lorem Dolor</a></li>
												<li><a href="#">Ipsum Adipiscing</a></li>
												<li><a href="#">Tempus Magna</a></li>
												<li><a href="#">Feugiat Veroeros</a></li>
											</ul>
										</li>
										<li><a href="#">Maximus Erat</a></li>
										<li><a href="#">Sapien Mauris</a></li>
										<li><a href="#">Amet Lacinia</a></li>
									</ul>
								</nav>

							<!-- Section -->
								<section>
									<header class="major">
										<h2>Ante interdum</h2>
									</header>
									<div class="mini-posts">
										<article>
											<a href="#" class="image"><img src="../images/pic07.jpg" alt="" /></a>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
										</article>
										<article>
											<a href="#" class="image"><img src="../images/pic08.jpg" alt="" /></a>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
										</article>
										<article>
											<a href="#" class="image"><img src="../images/pic09.jpg" alt="" /></a>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
										</article>
									</div>
									<ul class="actions">
										<li><a href="#" class="button">More</a></li>
									</ul>
								</section>

							<!-- Section -->
								<section>
									<header class="major">
										<h2>Get in touch</h2>
									</header>
									<p>Sed varius enim lorem ullamcorper dolore aliquam aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin sed aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
									<ul class="contact">
										<li class="icon solid fa-envelope"><a href="#">information@untitled.tld</a></li>
										<li class="icon solid fa-phone">(000) 000-0000</li>
										<li class="icon solid fa-home">1234 Somewhere Road #8254<br />
										Nashville, TN 00000-0000</li>
									</ul>
								</section>

							<!-- Footer -->
								<footer id="footer">
									<p class="copyright">&copy; Untitled. All rights reserved. Demo Images: <a href="https://unsplash.com">Unsplash</a>. Design: <a href="https://html5up.net">HTML5 UP</a>.</p>
								</footer>

						</div>
					</div>

			</div>

		<!-- Scripts -->
			<script src="godinator/assets/js/jquery.min.js"></script>
			<script src="godinator/assets/js/browser.min.js"></script>
			<script src="godinator/assets/js/breakpoints.min.js"></script>
			<script src="godinator/assets/js/util.js"></script>
			<script src="godinator/assets/js/main.js"></script>

	</body>
</html>