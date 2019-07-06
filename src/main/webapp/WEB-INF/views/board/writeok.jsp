<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/board/temp/tempheader.jsp" %>	
<%@ include file="/WEB-INF/views/board/temp/headstyle.jsp" %>	



<script>

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
									<a href="index.html" class="logo"><strong>${parameter.bUserId }</strong>님 환영합니다</a>
									<a>로그아웃</a>  <a>마이 페이지</a>
								</header>

							<!-- Content -->
									<header class="main">
									<br>
										<h2>홍보게시판</h2>
									</header>
								<hr class = "major"/>	
								<!-- 작성 전체 폼 -->
								<div class = "row">
								<h2>글 작성을 완료 했습니다</h2>
								</div>
						</div>
					</div>
					
<%@ include file="/WEB-INF/views/mentor/temp/tempfooter.jsp" %>