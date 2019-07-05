<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/board/temp/tempheader.jsp" %>	
<%@ include file="/WEB-INF/views/board/temp/headstyle.jsp" %>    
<%@ include file="/WEB-INF/views/board/temp/board_common.jsp" %>    
<script>

$(document).ready(function() {
	
	
	$("#moveListBtn").click(function() {
		$("#bcode").val("${bcode}");
		$("#pg").val("1");
		$("#key").val("");
		$("#word").val("");
		$("#boardNo").val("");
		$("#commonForm").attr("method", "GET").attr("action", "${root}/board/moveList").submit();
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
								<div class = "row" style="padding: 0;margin: 0;">
							<br><br>
							<div class = "col-2"></div>
							<div class = "col-8">
								<font size="6">[${parameter.region}/${parameter.bSchoolName}]${parameter.boardSubject}</font>
								<hr style="margin: 0;">
							</div>
							<div class = "col-2"></div>
									<!-- 아이디 -->
									<div class = "col-2"></div>
									<div class="col-8">
									<hr style="margin: 0;">
										<span style = "float:left;">
										<a href="#">
											<img class="profile_icon" alt="작성자 프로필 사진" src="/godinator/resources/images/pic11.jpg">
										</a>
										</span>
										
										<span style = "float: left;">
											<a id="writerId" class="font_bold_small" href="#" style="color: #7f888f; padding-top: 0;padding-bottom: 5em;" >${parameter.bUserId}</a>
										</span>
									<!-- 작성시간 -->
									<span style="float:right;">${parameter.bPostdate}</span>
									<br>
									<!-- 첨부파일 -->
									<span style="float:right;"><a href = "#" id = "download"><i class = "fas fa-download"></i>첨부파일</a></span>&nbsp;
									<br>
									<hr style="margin: 0;">
									</div>
									<div class = "col-2"></div>
									
								<br><br><br>
									
								<!-- 작성 전체 폼 -->
									<div class = "col-2"></div>
									<div class = "col-8" style = "clear: both;text-align: left;" >
									
										<p id = "viewcontent">
										${parameter.boardContent}
										</p>
										<img src = "/godinator/resources/images/pic02.jpg" width="600px"/>
									</div>
									<div class = "col-2"></div>
									<br><br><br><br>
									
									
									<!-- 좋아요 싫어요 버튼  -->
									<div class = "col-5"></div>
									<div class = "col-2">
										<div class="rounded-lg" style="background-color: white; width:20vh; height: 100px; padding-top: 15px; margin:auto; text-align: center;">
											
											<div class="btnLike" style="float:left; margin-left: 0.8em;">
												<a href="#"><img alt="좋아요 아이콘" src="/godinator/resources/images/like.png"></a>
												<span style="display: block;">27</span>
											</div>
											<div class="btnLike" style="float:right; margin-right: 0.8em;">
												<a href="#"><img alt="싫어요 아이콘" src="/godinator/resources/images/unlike.png"></a>
												<span style="display: block;">6</span>
											</div>
											
											<div style="clear: both;"></div>
										</div>
									</div>
									<div class = "col-5"></div>
									
								
								
								
								<!-- 글정보 및 신고하기 -->
									<div class = "col-2"></div>
									<div class = "col-8" id = "boradInfo">
									<span>댓글2| 조회수  ${parameter.bViewCount}| 좋아요 27|<a href="#" style="color: #7f888f"><i class = "fas fa-exclamation-triangle	"></i>게시물 신고</a></span>
									<hr style="margin: 0;">
									</div>
									<div class = "col-2"></div>
									<br><br>
									
									
								<!-- 댓글 하나  -->
									<div class = "col-2"></div>
									<div class = "col-8" style="margin-bottom: 2em;">
										<span class="font_light_small">
										<a href="#">
											<img class="profile_icon" alt="작성자 프로필 사진" src="/godinator/resources/images/pic11.jpg">
										</a>
											<a id="writerId" class="font_bold_small" href="#" style="color: #7f888f">lucky1123</a></span>
								
								<!-- 댓글 내용 -->
									&nbsp;&nbsp;&nbsp;&nbsp;
									<span>
									정확한 시간을 알려주실 수 있나요????
									</span>
									<span style="float: right;"><a href = "#">댓글</a> &nbsp;<a href = "#">신고</a></span>
									<hr style="margin: 1em;">
									</div>
									
									<div class = "col-2"></div>
								<!-- 댓글 하나 끝 -->
									
									
									
								<!-- 댓글 쓰기 -->	
									<div class = "col-2"></div>
									<div class = "col-8">
									<span><textarea  cols="4" style="resize: none;"></textarea></span>
									<span style="float: right;"><button class = "button primary" style="height: 100%;">등록</button></span>
									</div>
									
									<div class = "col-2"></div>
								<!-- 댓글 쓰기 끝 -->	
								
									<div class = "col-2"></div>
									<div class = "col-8">
									<br><br>
									<span style = "float:right;">
									<button class = "button small" id = "preV">이전글</button>
									<button class = "button small" id = "nextV">다음글</button>
									<button class = "button small" id = "moveListBtn">목록</button>
									</span>
									</div>
									<div class = "col-2"></div>
								</div>
						</div>
					</div>
<%@ include file="/WEB-INF/views/mentor/temp/tempfooter.jsp" %>	