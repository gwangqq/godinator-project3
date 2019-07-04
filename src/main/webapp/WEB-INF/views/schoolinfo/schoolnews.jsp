<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
<c:set var="resources" value="${root}/resources/assets/"></c:set>
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
		<link rel="stylesheet" href="${root}/css/main.css" />
		<style>
			h1.newsH1C {
				text-align: center;
			}
			h3.newsH3C {
				text-align: center;
			}
			div#newsarea {
				margin: 4%;
				padding: 3%;
				border: 1px solid red;
			}
			div#newsarea p.newsContent {
				margin-bottom: 1px;
			}
			div#newsarea p.subject {
				font-size: 1em;
				color: #622DB7;
				font-weight: bold;
			}
			div#newsarea p.press_date>span.press {
				color: #29703E;
			}
			div#newsarea p.subject:hover {
				cursor: pointer;
			}
			ul#schoolScrollDiv {
				float: left;
			}
			ul#schoolScrollUl {
				overflow-y:auto;
				height: 100px;
				top: 1px;
				left: 1px;
				display: none;
				list-style: none;
				z-index: 10;
			}
			ul#schoolScrollUl>li:hover {
				cursor: pointer;
				font-weight: bold;
			}
			img {
				width: 60% !important;
				
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
									<a href="index.html" class="logo"><strong>학교 뉴스</strong></a>
									<ul class="icons">
										<!-- <li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
										<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
										<li><a href="#" class="icon brands fa-snapchat-ghost"><span class="label">Snapchat</span></a></li>
										<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
										<li><a href="#" class="icon brands fa-medium-m"><span class="label">Medium</span></a></li> -->
									</ul>
								</header>

							<!-- Content -->
								<section>
									<header class="main">
										<h1 class="newsH1C">학교 뉴스 종합</h1>
									</header>
									<div class="row">
										<div class="col-4 col-12-small">
										</div>
										<div class="col-2 col-12-small">
											<h3 class="mogyoH2R">학교 검색</h3>
										</div>
										<div class="col-2 col-12-small">
											<select id="schoolCate">
												<option value="hscool" selected="selected">고등학교</option>
												<option value="uscool">대학교</option>
											</select>
										</div>
										<div class="col-3 col-12-small">
										<input type="text" id="newsSearch"/>
										<div id="schoolScrollDiv"><ul id="schoolScrollUl"></ul></div>
										</div>
										<div class="col-1 col-12-small">
										<input type="hidden" id="schoolCode" />
										<a href="#" class="button primary" id="submit">검색</a>
										</div>
									</div>
									<br>
									<input type="hidden" id="nextGoogle" />
									<input type="hidden" id="nextNaver" />
									<h3 class="newsH3C">인천전자마이스터고</h3>
									<div id="newsarea">
								  	</div>
								  	<div class="row main-school-news">
											<div class="col-5 col-12-small">
											</div>
											<div class="col-2 col-1-small">
												<a href="#" class="button primary" id="submit">메인으로</a>
											</div>
									</div>
									<div id="log">
										<span>scrollHeight : <b id="scrollHeight">0</b></span><br>
										<span>scrollHeight : <b id="scrollPosition">0</b></span><br>
										<span>scrollHeight : <b id="bottom">0</b></span><br>
										<span id="b">scroll < 500px </span>
									</div>
								</section>

						</div>
					</div>

					<%@ include file="sidebar.jsp" %>

							<!-- Section -->
								<section>
									<header class="major">
										<h2>Ante interdum</h2>
									</header>
									<div class="mini-posts">
										<article>
											<a href="#" class="image"><img src="${root}/resources/images/pic07.jpg" alt="" /></a>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
										</article>
										<article>
											<a href="#" class="image"><img src="${root}/resources/images/pic08.jpg" alt="" /></a>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
										</article>
										<article>
											<a href="#" class="image"><img src="${root}/resources/images/pic09.jpg" alt="" /></a>
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
									<p>Sed varius enim lorem ullamcorper dolore aliquam aenean ornare velit lacus, ac varius enim lorem ullamcorper dolordata[i]. Proin sed aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
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
			<script src="${resources}js/jquery.min.js"></script>
			<script src="${resources}js/browser.min.js"></script>
			<script src="${resources}js/breakpoints.min.js"></script>
			<script src="${resources}js/util.js"></script>
			<script src="${resources}js/main.js"></script>
			<script>
			$(document).ready(function() {
				
				var isEnd = false;
				var pageCnt = 0;
				function makeAppendNews(data, mode) {
					var newsContentCnt = data.length;
					var newsContents = '';
					for(var i=0; i<newsContentCnt; i++) {
						//json 바인딩
						newsContents += '<hr class="major" />';
						newsContents += '	<div class="news">';
						newsContents += '		<div class="row">';
						newsContents += '			<div class="col-3 col-3-small">';
						newsContents += '				<span class="image main"><img src="'+data[i].imgUrl+'" alt="" /></span>';
						newsContents += '			</div>';
						newsContents += '			<div class="col-9 col-9-small">';
						newsContents += '				<p class="newsContent subject"><a href="'+data[i].url+'">'+data[i].subject+'</a></p>';
						newsContents += '	      		<p class="newsContent press_date"><span class="press">'+data[i].press+'</span>&#9475;<span class="date">'+data[i].date+'</span></p>';
						newsContents += '	      		<p class="newsContent detail">'+data[i].detail+'</p>';
						newsContents += '			</div>';
						newsContents += '		</div>';
						newsContents += '	</div>';			
					}
					if(mode == "first") {
						console.log("first");
						$("div#newsarea").html(newsContents);
					} else {
						console.log("append");
						$("div#newsarea").append(newsContents);
					}
					$("p.subject>a").click(function() {
						$(this).attr('target','_blank');
					});
					pageCnt++;
					console.log("pageCnt : " + pageCnt);
					if(pageCnt == 5)
						isEnd = true;
					//alert($("#page").val());
				};
				
				//ajax 호출
				function searchNews(mode) {
					if(!isEnd) { 
						var schoolName = $("#newsSearch").val();
						var nextGoogle = $("#nextGoogle").val();
						var nextNaver = $("#nextNaver").val();
						var param = JSON.stringify({"keyWord" : schoolName, "nextGoogle" : nextGoogle, "nextNaver" : nextNaver});
						$.ajax({
							url : '${root}/schoolnews/searchnews/',
							type : 'POST',
							contentType : "application/json;charset=UTF-8",
							dataType : 'json',
							data : param,
							success : function(result) {
								makeAppendNews(result.schoolnews, mode);
								
							},
							error : function(jqXHR, textStatus, errorThrown) {
								alert("jqXHR : " + jqXHR + "\ntextStatus : " + textStatus + "\nerrorThrown : " + errorThrown)
							}
						});	
					}
				}
				
				$("#submit").click(function() {
					var selectSchool = $("#schoolCode").val();
					pageCnt = 0;
					isEnd = false;
					if(selectSchool.trim().length != 0) {
						$("div#newsarea").empty();
						searchNews("first");
					} else {
						alert("학교를 선택해주세요.");
						return false;
					}
					return false;
				});
				
				$("div#newsarea p.subject").click(function() {
					alert("학교 검색");
				});
				/* $(window).on("scroll", function() {
					var scrollHeight = $(document).height();
					var scrollPosition = $(window).height() + $(window).scrollTop();		

					$("#scrollHeight").text(scrollHeight);
					$("#scrollPosition").text(scrollPosition);
					$("#bottom").text(scrollHeight - scrollPosition);
					
					if (scrollPosition == scrollHeight && pageCnt < 5) {
						searchNews("append");
					} else {
						
					}
				}); */
				$(window).scroll(function(){
		            let $window = $(this);
		            let scrollTop = $window.scrollTop();
		            let windowHeight = $window.height();
		            let documentHeight = $(document).height();
		            
		            console.log("documentHeight:" + documentHeight + " | scrollTop:" + scrollTop + " | windowHeight: " + windowHeight );
		            var cnt = pageCnt;
		            
		            // scrollbar의 thumb가 바닥 전 30px까지 도달 하면 리스트를 가져온다.
				            setTimeout(function() {
					            if( scrollTop + windowHeight + 500 > documentHeight && (pageCnt < 5 && pageCnt != 0)){
							        if(cnt == pageCnt)
							            searchNews("append");
					            }
				            }, 300);
		        });
				$("#newsSearch").keydown(function(e) {
					var $schoolCate = $("#schoolCate").val();
					var $keyword = $(this).val();
					if($keyword.trim().length != 0) {
						$.ajax({
							url : "${root}/schoolnews/selectschool",
							type : "GET",
							contentType : "application/json;charset=UTF-8",
							data : "schoolCate="+$schoolCate+"&keyword="+$keyword,
							dataType : "JSON",
							success : function(result) {
								var school = result.schoolNames;
								var schoolNamesCnt = result.schoolNames.length;
								console.log(schoolNamesCnt);
								if(schoolNamesCnt != 0) {
									$("#schoolScrollUl").empty();
									for(var i=0; i<schoolNamesCnt; i++) {
										var li = $("<li/>", {
														"data-code" : school[i].schoolCode,
														"text" : school[i].schoolName,
														"click" : function() {
															$("#newsSearch").val($(this).text());
															$("#schoolScrollUl").css("display", "none");
															$("#schoolCode").val($(this).attr("data-code"));
														}
													});
										$("#schoolScrollUl").append(li);
									}
									$("#schoolScrollUl").css("display", "list-item");
								} else {
									$("#schoolScrollUl").css("display", "none");
									$("#schoolScrollUl").empty();
								}
							},
							error : function() {
								
							}
						});
					} else {
						$("#schoolScrollUl").css("display", "none");
						$("#schoolScrollUl").empty();
					}
				})
			});
		</script>
	</body>
</html>