<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/board/temp/tempheader.jsp" %>


<style>
a{
	color: 	#f56a6a;
	text-decoration: none;
	border-bottom: none;
	text-decoration: none;
}

a:hover{
	color:	#f56a6a;
	text-decoration: none;
	border-bottom: none;
	text-decoration: none;
	
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
	
	$(".moveWriteBtn").click(function() {
		alert("눌렸따!!");
		//encodingURI, encodingComponent쓰면 쿼리스트링 encoding가능 form에 input hidden으로 보내는거 많이 사용
		$("#bcode").val("${bcode}");
		$("#pg").val("1");
		$("#key").val("");
		$("#word").val("");
		$("#seq").val("");
		$("#commonForm").attr("method", "GET").attr("action", "${root}/board/write").submit();
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
														<th>지역</th>
														<th>작성일</th>
														<th>조회</th>
														<th>좋아요</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>10</td>
														<td>[미국고등학교]입학설명회 안내드립니다</td>
														<td>미국고등학교알림이</td>
														<td>서울</td>
														<td>19.06.22</td>
														<td>23</td>
														<td>7</td>
													</tr>
													<tr>
														<td>9</td>
														<td>[영국고등학교]입학설명회 안내드립니다</td>
														<td>영국고등학교알림이</td>
														<td>서울</td>
														<td>19.06.22</td>
														<td>23</td>
														<td>7</td>
													</tr>
													<tr>
														<td>8</td>
														<td>[중국고등학교]중국고등학교 축제 홍보</td>
														<td>중국고알림이</td>
														<td>서울</td>
														<td>19.06.22</td>
														<td>23</td>
														<td>7</td>
													</tr>
													<tr>
														<td>7</td>
														<td>[대만고등학교]입학설명회 안내드립니다</td>
														<td>대만고등학교알림이</td>
														<td>서울</td>
														<td>19.06.22</td>
														<td>28</td>
														<td>0</td>
													</tr>
													<tr>
														<td>6</td>
														<td>[일본외국어고등학교]입학설명회 및 입학전형 변경 홍보</td>
														<td>일본외고짱짱</td>
														<td>서울</td>
														<td>19.06.22</td>
														<td>44</td>
														<td>10</td>
													</tr>
													<tr>
														<td>5</td>
														<td>[북한대학교]대학교 공동 설명회 개최 안내</td>
														<td>북한대마스터</td>
														<td>서울</td>
														<td>19.06.20</td>
														<td>23</td>
														<td>7</td>
													</tr>
													<tr>
														<td>4</td>
														<td>[스리랑카대학교]스리랑카 대학교 고등학생 대상 진로탐색 프로그램 개최</td>
														<td>스리랑카대지박령</td>
														<td>서울</td>
														<td>19.06.19</td>
														<td>23</td>
														<td>7</td>
													</tr>
													<tr>
														<td>3</td>
														<td>[필리핀고등학교]입학설명회 안내드립니다</td>
														<td>필리핀고컴컴</td>
														<td>서울</td>
														<td>19.06.19</td>
														<td>27</td>
														<td>3</td>
													</tr>
													<tr>
														<td>2</td>
														<td>[미국고등학교]입학설명회 안내드립니다</td>
														<td>미국고등학교알림이</td>
														<td>서울</td>
														<td>19.06.19</td>
														<td>23</td>
														<td>7</td>
													</tr>
													<tr>
														<td>1</td>
														<td>[미국고등학교]입학설명회 안내드립니다</td>
														<td>미국고등학교알림이</td>
														<td>서울</td>
														<td>19.06.19</td>
														<td>23</td>
														<td>7</td>
													</tr>
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
										<div class = "row">
										<div class = "col-3"></div>
										<div class = "col-6">
											<ul class="pagination" style="display: inline-block;">
												<li><span class="button disabled">Prev</span></li>
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
												<li><a href="#" class="button">Next</a></li>
											</ul>
										</div>
										<div class = "col-3"></div>	
										
								
								
								<!-- =============== 조건 검색 창 ===========-->
									
										<div class = "col-1"></div>
										<div class = "col-3" style="margin-right: 0; padding:0;">
										<select name = "key" id="demo-category">
											<option value="1">전체</option>
											<option value="2">글제목</option>
											<option value="3">작성자</option>
											<option value="4">작성내용</option>
											<option value="5">학교이름</option>
											<option value="6">지역</option>
										</select>
										</div>
										<div class = "col-6" style="margin-left: 0;margin-right: 0;padding:0;">
										<input type="text" placeholder="검색내용을 입력해주세요">					
										</div>
										<div class = "col-1" style="margin-left: 0; margin-right: 0;padding:0;">
										<button class="button icon solid fa-search">검색</button>
										</div>
									</div>
									
								</section>

						</div>
					</div>

<%@ include file="/WEB-INF/views/board/temp/tempfooter.jsp" %>