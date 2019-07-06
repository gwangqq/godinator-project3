<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>	
<!DOCTYPE HTML>
<style>

.pre{
	font-size: 2em;
	line-height: 100px;
	text-align: left;
}

.iconHigh{
	text-decoration: none;
    border-bottom: none;
    position: relative;
    WIDTH: 150PX;
    float: left;
    margin-left: 30px;

}

.iconUni{
	text-decoration: none;
    border-bottom: none;
    position: relative;
    WIDTH: 150PX;
    float: left;
    margin-left: 30px;

}

.icon {
    text-decoration: none;
    border-bottom: none;
    position: relative;
    WIDTH: 150PX;
    margin-left: 30px;
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script type="text/javascript">
	function allowDrop(ev){
		ev.preventDefault();
	}
	
	function drag(ev){
		ev.dataTransfer.setData("text", ev.target.id);
	}
	
	function drop(ev){
		var a = $("#attr").text();
		
		ev.preventDefault();
		var data = ev.dataTransfer.getData("text");
		
		var dataTemp = document.getElementById(data);
		console.log(dataTemp);
		$(dataTemp).css("width","40px");
		$(dataTemp).css("height","40px");
		$(dataTemp).css("font-size","small");
		$(dataTemp).attr("class","");
		$(dataTemp).click(function(e) {
			alert("이미지 클릭!");
		});
		
		ev.target.appendChild(dataTemp);
		var text = $(ev.target).text();
		
		var data = year + "/" + month + "/" + text;
		init
	}
</script>
<html>
	<head>
		<title>register_3.jsp</title>
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
									
										<h1>회원가입</h1>
										<h3 class="subtitle">학교 선택 기준은?</h3>
									</header>

<br>

									<!-- Content -->
									<h2 class="schoolName">고등학교 우선순위</h2>
									<form id="HighPreferenceForm" name="HighPreferenceForm">
									<div id="boardsHigh">
											<div title="firstH" class="pre">우선순위1</div>
											<div title="secondH" class="pre">우선순위2</div>
											<div title="thirdH" class="pre">우선순위3</div>
											<div title="fourthH" class="pre">우선순위4</div>
											<div title="fifthH" class="pre">우선순위5</div>
											<div title="sixthH" class="pre">우선순위6</div>
									</div>	
										
									<br>									
									<div id="imagesHigh">
											<div><img src="/godinator/resources/images/user/facility.jpg" id="facilityH" class="iconHigh"
													draggable="true" ondragstart="drag(event)"></div>
											<div><img src="/godinator/resources/images/user/group.jpg" id="groupH" class="iconHigh"
													draggable="true" ondragstart="drag(event)"></div>
											<div><img src="/godinator/resources/images/user/result_instruct.jpg" id="instructH" class="iconHigh"
												draggable="true" ondragstart="drag(event)"></div>
											<div><img src="/godinator/resources/images/user/result.jpg" id="resultH" class="iconHigh"
													draggable="true" ondragstart="drag(event)"></div>
											<div><img src="/godinator/resources/images/user/study_atmos.jpg" id="studyH" class="iconHigh"
													draggable="true" ondragstart="drag(event)"></div>
											<div><img src="/godinator/resources/images/user/teacher.jpg" id="teacherH" class="icon"
													draggable="true" ondragstart="drag(event)"></div>
									</div>
									</form>
									<br>
									<hr>
									<br>
										<h2 class="schoolName">대학교 우선순위</h2>
									<form id="UniPreferenceForm" name="UniPreferenceForm">
									
									<div id="boardsUni">
											<div title="firstU" class="pre">우선순위1</div>
											<div title="secondU" class="pre">우선순위2</div>
											<div title="thirdU" class="pre">우선순위3</div>
											<div title="fourthU" class="pre">우선순위4</div>
											<div title="fifthU" class="pre">우선순위5</div>
											<div title="sixthU" class="pre">우선순위6</div>
									</div>
									<br>	
									<div id="imagesUni">
											<div><img src="/godinator/resources/images/user/facility.jpg" id="facilityU" class="iconUni"></div>
											<div><img src="/godinator/resources/images/user/group.jpg" id="groupU" class="iconUni"></div>
											<div><img src="/godinator/resources/images/user/result_instruct.jpg" id="instructU" class="iconUni"></div>
											<div><img src="/godinator/resources/images/user/result.jpg" id="resultU" class="iconUni"></div>
											<div><img src="/godinator/resources/images/user/study_atmos.jpg" id="studyU" class="iconUni"></div>
											<div><img src="/godinator/resources/images/user/teacher.jpg" id="teacherU" class="icon"></div>
									</div>
										
									</form>
										   <br>
									<ul class="actions">
										<li>3/4</li>
										<li><a href="#" class="button primary" id="registerPreferenceBtn">다음페이지</a></li>
									</ul>
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
											<a href="#" class="image"><img src="/godinator/resources/images/pic07.jpg" alt="" /></a>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
										</article>
										<article>
											<a href="#" class="image"><img src="/godinator/resources/images/pic08.jpg" alt="" /></a>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
										</article>
										<article>
											<a href="#" class="image"><img src="/godinator/resources/images/pic09.jpg" alt="" /></a>
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
			<script src="/godinator/resources/assets/js/jquery.min.js"></script>
			<script src="/godinator/resources/assets/js/browser.min.js"></script>
			<script src="/godinator/resources/assets/js/breakpoints.min.js"></script>
			<script src="/godinator/resources/assets/js/util.js"></script>
			<script src="/godinator/resources/assets/js/main.js"></script>

	</body>
</html>