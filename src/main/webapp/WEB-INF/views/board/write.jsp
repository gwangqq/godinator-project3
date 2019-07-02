<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/mentor/temp/tempheader.jsp" %>	
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<style type="text/css">
a{
	color: 	#f56a6a;
	text-decoration: none;
	border-bottom: none;
	text-decoration: none;
}

a:hover{
	color: 	#f56a6a;
	text-decoration: none;
	border-bottom: none;
	text-decoration: none;
}
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

<script>
$(document).ready(function() {
	
	$("#writeBtn").click(function() {
		if($("#subject").val() == ""){
			alert("제목입력!!!!");
			return;
		} else if($("#content").val() == ""){
			alert("내용 입력!!!");
			return;
		} else {
			$("#writeForm").attr("action", "${root}/board/write").submit();
		}
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
									<header class="main">
									<br>
										<h2>홍보게시판</h2>
									</header>
								<hr class = "major"/>	
								<!-- 작성 전체 폼 -->
			<!-- <form id="writeForm" name="writeForm" method="post" action=""
				enctype="multipart/form-data"> -->
								<div class = "row">
				
				<input type="hidden" name="bcode" value="${parameter.bcode}">
				<input type="hidden" name="pg" value="1">
				<input type="hidden" name="key" value="">
				<input type="hidden" name="word" value="">
				
									<!-- 기본 정보 -->
								<br>
								<!-- 제목 작성 -->
								<div class = "col-2"></div>
								<div class = "col-1">
								<label>게시물 제목</label>
								</div>
								<div class= "col-7">
								<input type="text" name="subject" id="subject" value="" placeholder="게시물의 제목을 입력해주세요" />
								</div>
								<div class = "col-2"></div>
								
								
								<!-- 지도 파일 첨부 -->
								<div class = "col-2"></div>
								<div class = "col-1">
								<label>지역 선택</label>
								</div>
								<div class = "col-4">
								<select id = "region" style="color: #7f888f;">
									<option>전체</option>
									<option>서울</option>
									<option>부산</option>
									<option>인천</option>
									<option>대구</option>
									<option>광주</option>
									<option>대전</option>
									<option>울산</option>
									<option>강원</option>
									<option>경기</option>
									<option>경남</option>
									<option>경북</option>
									<option>전남</option>
									<option>전북</option>
									<option>충남</option>
									<option>충북</option>
									<option>제주</option>
								</select>
								</div>
								<div class = "col-5"></div>
								
								
								<!-- 지도 파일 첨부 -->
								<div class = "col-2"></div>
								<div class = "col-1">
								<label>장소 첨부</label>
								</div>
								<div class = "col-3">
								<input type="button" class="button" data-toggle="modal" data-target="#myModal" value="장소검색">
								
								
								
								
								
								
								
								
								<!-- The Modal -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Modal Heading</h4>
          <input type="button" class="button close" data-dismiss="modal">
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          Modal body..
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <input type="button" class="button" data-dismiss="modal" value = "Close">
        </div>
        
      </div>
    </div>
  </div>
								
								
								</div>
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								<div class = "col-6"></div>
								
								
								
								<!-- 학교이름 검색 -->
								<div class = "col-2"></div>
								<div class = "col-1">
								<label>학교 검색</label>
								</div>
								<div class = "col-6" style = "margin-right: 0;">
								<input type="text" name="demo-name" id="demo-name" value="" placeholder="학교 이름 입력" style="margin-right:0;"/>
								</div>
								<div class = "col-1" style = "margin-left: 0;">
								<input type = "button" class = "button medium" value = "검색">
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
								<textarea name="content" id="content" placeholder="게시물의 내용을 작성해주세요" 
								rows="20" style="resize: none;"></textarea>
								</div>
								<div class = "col-2"></div>
								
								<br>
								<!-- 게시물 완료 버튼 및 위로가기 버튼 -->

								
								
								<div class = "col-2"></div>
								<div class = "col-8">
									<input type="file" class="form-control-file border" name="file">
								</div>
								<div class = "col-2"></div>
								
								<div class = "col-8"></div>
								<div class = "col-2" style="padding-right: 0;">
									<button class = "button samll" >이전</button>
									<button class = "button primary samll" id = "writeBtn">완료</button>
								</div>
								<div class = "col-2"></div>
								</div>
	<!-- 	</form> -->
						</div>
					</div>
					
<%@ include file="/WEB-INF/views/mentor/temp/tempfooter.jsp" %>