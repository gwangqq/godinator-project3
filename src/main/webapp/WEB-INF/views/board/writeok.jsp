<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/board/temp/tempheader.jsp" %>	
<%@ include file="/WEB-INF/views/board/temp/headstyle.jsp" %>    
<%@ include file="/WEB-INF/views/board/temp/board_common.jsp" %>    
<script>

$(document).ready(function() {
	
	
	$("#moveListBtn").click(function() {
		$("#boardCategory").val("${boardCategory}");
		$("#pg").val("1");
		$("#key").val("");
		$("#word").val("");
		$("#boardNo").val("");
		$("#commonForm").attr("method", "GET").attr("action", "${root}/board/list").submit();
	});
	
	$("#confirmMyArticle").click(function() {
		$("#boardCategory").val("${boardCategory}");
		$("#pg").val("1");
		$("#key").val("");
		$("#word").val("");
		$("#boardNo").val("${boardNo}");
		$("#commonForm").attr("method", "GET").attr("action", "${root}/board/view").submit();
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
									<a href="index.html" class="logo"><strong>${parameter.bUserId}</strong></a>님 환영합니다.
									               <a>로그인</a><a>마이페이지</a>
								</header>

							<!-- Content -->
							
							<!-- 제목 -->
										
							<!-- 게시물 상단 부분 -->
								<div class = "row" style=";margin: 0 auto;">
							<br><br>
							
							<div class = "col-2"></div>
							<div class = "col-8" style="text-align: center;margin: 0 auto; height : 200px;padding-top: 200px;" >
								게시물이 작성이 완료되었습니다.
							</div>
							<div class = "col-2"></div>
									<br><br><br>
									
									<div class = "col-4"></div>
									<div class = "col-2" style="padding-top: 200px; margin-right: 0;">
										<input type="button" name = "confirmMyArticle" id = "confirmMyArticle" value = "작성한 글 확인">
									</div>
									<div class = "col-2" style="padding-top: 200px; margin-left: 0;">
										<input type="button" name = "combackList" id = "moveListBtn" value = "목록">
									</div>
									<div class = "col-4"></div>
									
									<div class = "col-2"></div>
									
								<br><br><br>
									
								<!-- 작성 전체 폼 -->
									<div class = "col-2"></div>
									<div class = "col-8" style = "clear: both;text-align: left;" >
										
									</div>
									<div class = "col-2"></div>
									
									
									
								
								
								
								
								
									
									
							
									
									
									
							
								</div>
						</div>
					</div>
<%@ include file="/WEB-INF/views/mentor/temp/tempfooter.jsp" %>	