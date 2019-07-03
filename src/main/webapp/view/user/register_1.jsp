<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	 $("#zipcodeSearchBtn").click(function() {
		//alert($("#demo-category").val())
		  url:"/godinator/zipcode/zipSearch", //Controller호출        
		  type:"post",
		  data:$("#zipform").serialize(), // 요청변수 설정 
		  dataType:"json",             // 데이터 결과 JSON
		  success:function(jsonStr){  // jsonStr : 주소 검색 결과 JSON 데이터          
			  $("#list").html("");  
			  var errCode = jsonStr.results.common.errorCode;  
			  var errDesc = jsonStr.results.common.errorMessage;           
				  if(errCode!= ＂0＂){
					  alert(errCode+"="+errDesc);
					  }else{             
					  if(xmlStr!= null){                 
						  makeListJson(jsonStr); // JSON데이터 HTML형태로 변환         
						  }
					  }        
				  },
		  error: function(xhr,status, error){
			  alert("에러발생"); // AJAX 호출 에러        
			  } 
				
	}); 
	
function makeListJson(jsonStr){
	var htmlStr = "";
	htmlStr += "<table>";
	// jquery를 이용한 JSON 결과 데이터 파싱
	$(jsonStr.results.juso).each(function(){
		htmlStr += "<tr>";
		htmlStr += "<td>"+this.roadAddr+"</td>";
		htmlStr += "<td>"+this.roadAddrPart1+"</td>";
		htmlStr += "<td>"+this.roadAddrPart2+"</td>";
		htmlStr += "<td>"+this.jibunAddr+"</td>";
		htmlStr += "<td>"+this.engAddr+"</td>";
		htmlStr += "<td>"+this.zipNo+"</td>";
		htmlStr += "<td>"+this.admCd+"</td>";
		htmlStr += "<td>"+this.rnMgtSn+"</td>";
		htmlStr += "<td>"+this.bdMgtSn+"</td>";
		htmlStr += "<td>"+this.detBdNmList+"</td>";
		/** API 서비스 제공항목 확대 (2017.02) **/
		htmlStr += "<td>"+this.bdNm+"</td>";
		htmlStr += "<td>"+this.bdKdcd+"</td>";
		htmlStr += "<td>"+this.siNm+"</td>";
		htmlStr += "<td>"+this.sggNm+"</td>";
		htmlStr += "<td>"+this.emdNm+"</td>";
		htmlStr += "<td>"+this.liNm+"</td>";
		htmlStr += "<td>"+this.rn+"</td>";
		htmlStr += "<td>"+this.udrtYn+"</td>";
		htmlStr += "<td>"+this.buldMnnm+"</td>";
		htmlStr += "<td>"+this.buldSlno+"</td>";
		htmlStr += "<td>"+this.mtYn+"</td>";
		htmlStr += "<td>"+this.lnbrMnnm+"</td>";
		htmlStr += "<td>"+this.lnbrSlno+"</td>";
		htmlStr += "<td>"+this.emdNo+"</td>";
		htmlStr += "</tr>";
	});
	htmlStr += "</table>";
	// 결과 HTML을 FORM의 결과 출력 DIV에 삽입
	$("#list").html(htmlStr);
}	
});
</script>
<html>
	<head>
		<title>register_1.jsp</title>
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
										<h4 class="subtitle">기본 인적사항을 입력해주세요!</h4>
									</header>
<br><br>
									<!-- Content -->
									<form id="loginForm" name="loginForm">
									<div>
										<h3 id="contentId">이름</h3>
										   <input type="text" name="loginId" id="loginId" value="" />
										   <br>
									
										<h3 id="contentPwd">아이디</h3>
										   <input type="text" name="loginPwd" id="loginPwd" value="" />
										   <div id="idCheck"></div>
										   <br>
									
										<h3 id="contentPwd">비밀번호</h3>
										   <input type="text" name="loginPwd" id="loginPwd" value="" />
										   <br>
									
										<h3 id="contentPwd">비밀번호 확인</h3>
										   <input type="text" name="loginPwd" id="loginPwd" value="" />
										   <div id="pwdCheck"></div>
										   <br>
											 
										<h3 id="contentPwd">메일</h3>
										   <input type="text" name="loginPwd" id="loginPwd" value="" />@

										  
											<select name="demo-category" id="demo-category" >
												<option value="">주소를 선택해주세요</option>
												<option value="naver.com">naver.com</option>
												<option value="gmail.com">gmail.com</option>
												<option value="daum.net">daum.net</option>
												<option value="hanmail.net">hanmail.net</option>
											</select>
										 
										   <br>
										<h5 id="contentPwd">인증번호</h5> <!-- sns로그인시 인증불필요 -->
										   <input type="text" name="loginPwd" id="loginPwd" value="" />
										   <a class="button" id="emailCheckBtn">이메일 인증</a>
										   <div id="emailCheck"></div>
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
										   <a href="#" class="button" id="zipcodeSearchBtn">우편번호검색</a>
										   
									<form name="zipform" id="zipform" method="post">    <!-- 요청 변수 설정 (검색결과형식 설정, json) -->     
									<input type="hidden" name="currentPage" value="1"/>				<!-- 요청 변수 설정 (현재 페이지. currentPage : n > 0) -->
									  <input type="hidden" name="countPerPage" value="10"/>				<!-- 요청 변수 설정 (페이지당 출력 개수. countPerPage 범위 : 0 < n <= 100) -->
									  <input type="hidden" name="resultType" value="json"/> 			<!-- 요청 변수 설정 (검색결과형식 설정, json) --> 
									  <input type="hidden" name="confmKey" value="TESTJUSOGOKR"/>		<!-- 요청 변수 설정 (승인키) -->  
									  <input type="text"   name="keyword" value=""/>					<!-- 요청 변수 설정 (키워드) -->
									</form> 
 	   								<div id="list"> <!-- 검색 결과 리스트 출력 영역 -->
 	   								 </div>
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
										<li>1/4</li>
										<li><a href="#" class="button primary">다음페이지</a></li>
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