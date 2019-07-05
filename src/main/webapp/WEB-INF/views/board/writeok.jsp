<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/board/temp/tempheader.jsp" %>	
<%@ include file="/WEB-INF/views/board/temp/headstyle.jsp" %>	

<!-- 모달창 들  -->
<!--장소검색  Modal -->
<%@ include file="/WEB-INF/views/board/mapsearchmodal.jsp" %>


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
<form id="writeForm" name="writeForm" method="post" action="">
				<!-- enctype="multipart/form-data" --> 
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
								<label>제목</label>
								</div>
								<div class= "col-7">
								<input type="text" name="boardSubject" id="subject" value="" placeholder="게시물의 제목을 입력해주세요.(75자까지 입력가능)" maxlength="75"/>
								</div>
								<div class = "col-2"></div>
								
								
								<!-- 지도 파일 첨부 -->
								<div class = "col-2"></div>
								<div class = "col-1">
								<label>지역 선택</label>
								</div>
								<div class = "col-3">
								<select name ="region" id = "region" style="color: #7f888f;">
<option>전체</option><option>서울</option><option>부산</option><option>인천</option>
<option>대구</option><option>광주</option><option>대전</option><option>울산</option>
<option>강원</option><option>경기</option><option>경남</option><option>경북</option>
<option>전남</option><option>전북</option><option>충남</option><option>충북</option><option>제주</option>
								</select>
								</div>
								
								<div class = "col-1">
								<label>장소 첨부</label>
								</div>
								<div class = "col-3">
								<input type="button" class="button" data-toggle="modal" data-target="#mapModal" value="장소검색">
								</div>
								<div class = "col-2"></div>
								
								<!-- 학교이름 검색 -->
								<div class = "col-2"></div>
								<div class = "col-1">
								<label>학교 검색</label>
								</div>
								<div class = "col-7" id = "schooltext">
								<input name = "bSchoolName" type="text" name="searchSchool" id="searchSchool" value=""
								placeholder="학교 이름 입력" style="margin-right:0;" readonly="readonly" data-toggle="modal" data-target="#schoolModal"/>
								</div>
								<!-----------------------------학교 검색  modal---------------------------->							
									  <div class="modal fade" id="schoolModal">
									    <div class="modal-dialog modal-lg">
									      <div class="modal-content">
									      
									        <!-- Modal Header -->
									        <div class="modal-header">
									          <h4 class="modal-title">학교이름 검색</h4>
									          <input type="button" class="button close" data-dismiss="modal" value="&times;" style="width:10;height:10;padding-top: 0;">
									        </div>
									        
									        <!-- Modal body -->
									        <div class="modal-body">
										        <div class = "row" style="margin:auto 0;"> 
										        	<div class = "col-3" style="margin-left: 0;margin-right: 0;padding:0;">

										        	<select id = "schoolType">
										        		<option>고등학교</option>
														<option>대학교</option>
										        	</select>
										        	</div>
									
											        <div class = "col-7" style="margin-left: 0;margin-right: 0;padding:0;">
											        <input type = "text" id = "schoolName" name = "schoolName">
											        </div>
													<div class = "col-2" style="margin-left: 0;margin-right: 0;padding:0;">
													<input type = "button" id = "realSchoolSearchBtn" value = "검색">
													</div>
													
													<div class = "col-4"></div>
													<div id = "searchresult" class = "col-6" style = "overflow-y: auto;height: 150px; margin: 0 auto;" >
													</div>        
													<div class = "col-2"></div>
													<hr>
													<div class = "col-4"></div>
													<div class = "col-4" id = "checkedschool">
														<label id = "finalcheck"></label>
													</div>
													<div class = "col-4"></div>
										        </div>
									        </div>
									        
									        <!-- Modal footer -->
									        <div class="modal-footer">
									          <input id = "confirmschool" type="button" class="button primary" data-dismiss="modal" value = "확인">
									        </div>
									        
									      </div>
									    </div>
									  </div>				
								<div class = "col-2"></div>
								
								
								
							
								
								<!-- 게시물 내용 -->
								<div class = "col-2"></div>
								<div class = "col-1">
								<label>내용</label>
								</div>
								<div class = "col-9"></div>
								
								<div class = "col-2"></div>
								<div class = "col-8">
								<textarea name="boardContent" id="content" placeholder="게시물의 내용을 작성해주세요" 
								rows="20" style="resize: none;"></textarea>
								</div>
								<div class = "col-2"></div>
								
								<br>
								<!-- 게시물 완료 버튼 및 위로가기 버튼 -->

								
								
								<div class = "col-2"></div>
								<div class = "col-8">
									<!-- <input type="file" class="form-control-file border" name="file"> -->
								</div>
								<div class = "col-2"></div>
								
								<div class = "col-8"></div>
								<div class = "col-2" style="padding-right: 0;">
									<input type ="button" class = "button samll" id = "cancelBtn" value = "취소">
									<input type ="button" class = "button primary samll" id = "writeBtn" value = "완료">
								</div>
								<div class = "col-2"></div>
								</div>
</form> 
						</div>
					</div>
					
<%@ include file="/WEB-INF/views/mentor/temp/tempfooter.jsp" %>