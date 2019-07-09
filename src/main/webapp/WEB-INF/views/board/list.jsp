<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/board/temp/tempheader.jsp" %>
<%@ include file="/WEB-INF/views/board/temp/board_common.jsp" %>
<%@ include file="/WEB-INF/views/board/temp/headstyle.jsp" %>


<script>
$(document).ready(function() {
	
	$(".moveWriteBtn").click(function() {
		$("#boardCategory").val("${boardCategory}");
		$("#pg").val("1");
		$("#key").val("${key}");
		$("#word").val("${word}");
		$("#boardNo").val("${boardNo}}");
		$("#commonForm").attr("method", "GET").attr("action", "${root}/board/write").submit();
	});
	
	
	$(".viewBtn").click(function() {
		$("#boardCategory").val("${boardCategory}");
		$("#pg").val("1");
		$("#key").val("${key}");
		$("#word").val("${word}");
		$("#boardNo").val($(this).attr("data-seq"));
		$("#commonForm").attr("method", "GET").attr("action", "${root}/board/view").submit();
	});
	
	$(".firstListBtn").click(function() {
		$("#boardCategory").val("${boardCategory}");
		$("#pg").val("1");
		$("#key").val("");
		$("#word").val("");
		$("#commonForm").attr("method", "GET").attr("action", "${root}/board/list").submit();
	});
	
	$(".moveListBtn").click(function() {
		$("#boardCategory").val("${boardCategory}");
		$("#pg").val($(this).attr("data-pg"));
		$("#key").val("${key}");
		$("#word").val("${word}");
		$("#commonForm").attr("method", "GET").attr("action", "${root}/board/list").submit();
	});
});
</script>	

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
							
							<!-- 게시판 제목 -->
								<section>
									<header class="main">
										<h1>홍보게시판</h1>
									</header>
									
									
									
							<!--========= table========== -->
									<div class = "table-wrapper">
											<table>
												<thead>
													<tr>
														<th>NO</th>
														<th>제목</th>
														<th>작성자</th>
														<th>작성일</th>
														<th>조회</th>
														<th>좋아요</th>
													</tr>
												</thead>
												<tbody>
												<c:forEach var = "article" items = "${articleList}">
													<tr class = "viewBtn" data-seq="${article.boardNo}">
														<td>${article.boardNo}</td>
														<td>[${article.region}/${article.bSchoolName}]${article.boardSubject.replace('<','&lt;')}</td>
														<td>${article.bUserId}</td>
														<td>${article.bPostdate}</td>
														<td>${article.bViewCount}</td>
														<td>좋아요 숫자</td>
													</tr>
												</c:forEach>
												</tbody>
											</table>
									</div>
									<div class = "col-2" style = "float: right;">
										<button class = "button moveWriteBtn" id = "moveWriteBtn">글쓰기</button>
										</div>
									<br>
									<hr class="major" />
									<br>
									
									
									
									<!-- ===============page 처리============ -->
										<div class = "row" align="center" style="margin: auto 0;">
										<div class = "col-2"></div>
										<div class = "col-8 page">
											<ul class="pagination">
												${navigator.navigator}
											</ul>
										</div>
										<div class = "col-2"></div>
										<!-- <li><span class="button disabled">최신게시물</span></li>
												<li><span class="button disabled">이전</span></li>
												<li><a href="#" class="page active">1</a></li>
												<li><a href="#" class="page">2</a></li>
												<li><a href="#" class="page">3</a></li>
												<li><a href="#" class="page">4</a></li>
												<li><a href="#" class="page">5</a></li>
												<li><a href="#" class="page">6</a></li>
												<li><a href="#" class="page">7</a></li>
												<li><a href="#" class="page">8</a></li>
												<li><a href="#" class="page">9</a></li>
												<li><a href="#" class="page">10</a></li>
												<li><a href="#" class="button">다음</a></li>
												<li><a href="#" class="button">끝 게시물</a></li> -->
								
								
								<!-- =============== 조건 검색 창 ===========-->
									
										<div class = "col-1"></div>
										<div class = "col-3" style="margin-right: 0; padding:0;">
										<select name = "key" id="key">
											<option value="1">전체</option>
											<option value="2">글제목</option>
											<option value="3">작성자</option>
											<option value="4">작성내용</option>
											<option value="5">학교이름</option>
											<option value="6">지역</option>
										</select>
										</div>
										<div class = "col-6" style="margin-left: 0;margin-right: 0;padding:0;">
										<input type="text" placeholder="검색내용을 입력해주세요" name = "word" id = "word">					
										</div>
										<div class = "col-1" style="margin-left: 0; margin-right: 0;padding:0;">
										<button class="button icon solid fa-search">검색</button>
										</div>
									</div>
									
								</section>

						</div>
					</div>

<%@ include file="/WEB-INF/views/board/temp/tempfooter.jsp" %>