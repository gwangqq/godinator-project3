<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
	<title>Generic - Editorial by HTML5 UP</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="/godinator/css/main.css" />
<style type="text/css">
label{
	text-align: center;
	padding-top: 14%;
}

select:hover{
	border-color: #f56a6a;
	box-shadow: 0 0 0 1px #f56a6a;
}

input:hover{
	border-color: #f56a6a;
	box-shadow: 0 0 0 1px #f56a6a;
}

textarea:hover{
	border-color: #f56a6a;
	box-shadow: 0 0 0 1px #f56a6a;
}
</style>
</head>
	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
								<header id="header">
									<a href="index.html" class="logo"><strong>Editorial</strong> by HTML5 UP</a>
									<ul class="icons">
										<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
										<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
										<li><a href="#" class="icon brands fa-snapchat-ghost"><span class="label">Snapchat</span></a></li>
										<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
										<li><a href="#" class="icon brands fa-medium-m"><span class="label">Medium</span></a></li>
									</ul>
								</header>

							<!-- Content -->
									<header class="main">
									<br>
										<h2>홍보게시판</h2>
									</header>
								<hr class = "major"/>	
								<!-- 작성 전체 폼 -->
								<div class = "row">
									<!-- 작성 조건.1 -->
									<div class = "col-2"></div>
									<div class = "col-1">
										<label>머리말</label>
									</div>
									<div class = "col-3">
										<select>
											<option>선택</option>
											<option>고등학교 입학 홍보</option>
											<option>대학교 입학 홍보</option>
											<option>교육 프로그램 홍보</option>
											<option>학교 행사 홍보</option>
											<option>기타</option>
										</select>
									</div>
									<div class = "col-1">
										<label>지역</label>
									</div>
									<div class = "col-3">
										<select>
											<option value="1">전체</option>
											<option value="2">서울</option>
											<option value="3">경기도</option>
											<option value="4">강원도</option>
											<option value="5">충청도</option>
											<option value="6">전라도</option>
											<option value="7">경상도</option>
											<option value="8">충청도</option>
											<option value="9">충청도</option>
											<option value="10">제주도</option>
										</select>
									</div>
									<div class = "col-2"></div>
									<!-- 기본 정보 -->
								<br>
								<!-- 제목 작성 -->
								<div class = "col-2"></div>
								<div class = "col-1">
								<label>게시물 제목</label>
								</div>
								<div class= "col-7">
								<input type="text" name="demo-name" id="demo-name" value="" placeholder="게시물의 제목을 입력해주세요" />
								</div>
								<div class = "col-2"></div>
								
								
								<!-- 지도 파일 첨부 -->
								<div class = "col-2"></div>
								<div class = "col-1">
								<label>파일 첨부</label>
								</div>
								<div class = "col-3">
								<button class="button icon solid fa-globe-americas" id = "searhMap" data-toggle="modal" data-target="#myModal">지도</button>
								<button class="button icon solid fa-upload" id = "upload">파일</button>
								</div>
								<div class = "col-6"></div>
								
								
								
								<!-- 학교이름 검색 -->
								<div class = "col-2"></div>
								<div class = "col-1">
								<label>학교 검색</label>
								</div>
								<div class = "col-6" style = "margin-right: 0;">
								<input type="text" name="demo-name" id="demo-name" value="" placeholder="학교 이름 입력" />
								</div>
								<div class = "col-1" style = "margin-left: 0;">
								<button class="button small icon solid fa-search">검색</button>
								</div>
								<div class = "col-2"></div>
								
																
								
								<!-- 게시물 내용 -->
								<div class = "col-2"></div>
								<div class = "col-1">
								<label>게시물 내용</label>
								</div>
								<div class = "col-9"></div>
								
								<div class = "col-2"></div>
								<div class = "col-8">
								<textarea name="demo-message" id="demo-message" placeholder="게시물의 내용을 작성해주세요" 
								rows="20" style="resize: none;"></textarea>
								</div>
								<div class = "col-2"></div>
								
								<br>
								<!-- 게시물 완료 버튼 및 위로가기 버튼 -->
								<div class = "col-8"></div>
								<div class = "col-2" style="padding-right: 0;">
									<button class = "button samll">이전</button>
									<button class = "button primary samll">완료</button>
								</div>
								<div class = "col-2"></div>
								
								
								
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
										<li><a href="index.html">Homepage</a></li>
										<li><a href="generic.html">Generic</a></li>
										<li><a href="elements.html">Elements</a></li>
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
											<a href="#" class="image"><img src="images/pic07.jpg" alt="" /></a>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
										</article>
										<article>
											<a href="#" class="image"><img src="images/pic08.jpg" alt="" /></a>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
										</article>
										<article>
											<a href="#" class="image"><img src="images/pic09.jpg" alt="" /></a>
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
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>