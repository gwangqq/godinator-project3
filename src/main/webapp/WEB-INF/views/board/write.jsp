<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/board/temp/tempheader.jsp" %>	
<%@ include file="/WEB-INF/views/board/temp/headstyle.jsp" %>	
<!-- 모달창 들  -->
<!--장소검색  Modal -->
<script>
$(document).ready(function() {
//------------------------------[학교 검색 모달창 시작]-----------------------------------	
	
	//모달 엔터 클릭시 
	$("#schoolName").keypress(function(key) {
		$("#searchresult").empty();
		var schoolType = $("#schoolType option:selected").val();
		var schoolName = $("#schoolName").val();
		var param = JSON.stringify({'schoolType' : schoolType, 'schoolName' : schoolName});
		if(key.keyCode == 13){
			
			var schoolName = $("#schoolName").val();
			if(schoolName == ""){
				alert("학교 이름을 입력해주세요");
			} else {
				$.ajax({
					url:'${root}/board/searchschool/',
					type: 'POST',
					contentType:'application/json;charset=UTF-8',
					dataType : 'json',
					data: param,
					success : function(response) {
						if(schoolType == "고등학교"){
							listHSchool(response);
							$("#schoolName").val(""); 
						} else {
							listUSchool(response);
							$("#schoolName").val(""); 										
						}
					}
				});
			}
		}
	});
	
	//모달 검색 버튼
	$("#realSchoolSearchBtn").click(function() {
		$("#searchresult").empty();
		var schoolType = $("#schoolType option:selected").val();
		var schoolName = $("#schoolName").val();
		var param = JSON.stringify({'schoolType' : schoolType, 'schoolName' : schoolName});
		if(schoolName == ""){
			alert("학교 이름을 입력해주세요");
		} else {
			$.ajax({
				url:'${root}/board/searchschool/',
				type: 'POST',
				contentType:'application/json;charset=UTF-8',
				dataType : 'json',
				data: param,
				success : function(response) {
					if(schoolType == "고등학교"){
						listHSchool(response);
						$("#schoolName").val(""); 
					} else {
						listUSchool(response);
						$("#schoolName").val(""); 										
					}
					
				}
			});
		}
			
	});
	
	//학교 이름 동적으로 뿌려주는 메소드 (고등학교, 대학교)
	 function listHSchool(hschool) {
		 $("#searchresult").empty();
		var hschoolcnt = hschool.hSchoolList.length;
		var hschoolstr = '';
		if(hschoolcnt != 0){
			for(var i=0; i<hschoolcnt; i++){
				var schoolName = hschool.hSchoolList[i];
				hschoolstr += '<label class = "searchresult" style = "padding:0;margin:0;">' +schoolName+ '</label><br>';
			}
			$("#searchresult").append(hschoolstr);
		} else {
			hschoolstr += '<label class = "searchresult" style = "padding:0;margin:0;">' +"검색결과가 없습니다."+ '</label><br>';
			$("#searchresult").append(hschoolstr);
		}
	} 
	
	 function listUSchool(uschool) {
		 $("#searchresult").empty();
		var uschoolcnt = uschool.uSchoolList.length;
		var uschoolstr = '';
		if(uschoolcnt != 0){
			for(var i=0; i<uschoolcnt; i++){
				var schoolName = uschool.uSchoolList[i];
				uschoolstr += '<label class = "searchresult" style = "padding:0;margin:0;">' +schoolName+ '</label><br>';
			}
			$("#searchresult").append(uschoolstr);
		} else {
			uschoolstr += '<label class = "searchresult" style = "padding:0;margin:0;">' +"검색결과가 없습니다."+ '</label><br>';
			$("#searchresult").append(uschoolstr);
			
		}
	} 
	
//선택한 학교 label에 보여주기 
	$(document).on("click", ".searchresult", function(){
		var checkschool = $(this).text();
		if(checkschool != "검색결과가 없습니다."){
			$(this).parent().siblings("#checkedschool").find("#finalcheck").text(checkschool);
		} else {
			$(this).parent().siblings("#checkedschool").find("#finalcheck").text("");
		}
	});  
		
//modal창 확인 눌렀을 때 바깥 textfield에 학교 이름 뿌리기
	$(document).on("click", "#confirmschool", function(){
		var checkschool = $(this).parent().prev().find("#finalcheck").text();
		$("#searchSchool").val(checkschool);
		$("#searchresult").empty();
		$("#finalcheck").empty();
	}); 
	
	//------------------------------[학교 검색 모달창 끝]-----------------------------------	
	
//글 작성 완료 눌렀을 때 
	$("#writeBtn").click(function() {
		if($("#subject").val() == ""){
			alert("제목을 입력해주세요");
			return;
		} else if($("#searchSchool").val() == ""){
			alert("학교 이름을 입력해주세요");
			return;
		} else if($("#content").val() == ""){
			alert("내용을 입력해주세요");
			return;
		} else {
			$("#writeForm").attr("action", "${root}/board/write").submit();
			
		}
	});
	
		
//글작성 취소 눌렀을 때 list로 돌아가기 
	$("#cancelBtn").click(function() {
		$("#boardCategory").val("${boardCategory}");
		$("#pg").val("1");
		$("#key").val("");
		$("#word").val("");
		location.href="${root}/board/moveview";
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
<form id="writeForm" name="writeForm" method="post" action="" enctype="multipart/form-data">
								<div class = "row">
				
				<input type="hidden" name="boardCategory" value="${parameter.boardCategory}">
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
								<input type="button" id = "mapBtn"class="button" data-toggle="modal" data-target="#mapModal" value="장소검색" >
								<!-----------------------------------[지도 modal]----------------------------------------------->
 								  
  <div class="modal fade" id="mapModal">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
        <!--  modal header-->
          <h4 class="modal-title">장소검색</h4>
          <input type="button" class="button close" data-dismiss="modal" value="&times;" style="width:10;height:10;padding-top: 0;">
        </div>
        
		<!--  modal body-->
        <div class="modal-body">
        	
<!----------------------------[다음 지도 ]-------------------------------------------------------------->

<div id = "map" style="width:100%;height:300px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f22525e443605fce310be835dea5bdc2&libraries=services,clusterer,drawing&autoload=false"></script>
<script>
$(document).ready(function(){
	
	map();
	
	var address = "";
	var latitude = "";
	var longtitude = "";
	
	$("#addressSearch").keypress(function(key) {
		if(key.keyCode ==13){
			alert($("#addressSearch").val());
			address = $("#addressSearch").val();
			
			map();
		}
	});
	
	
	$("#addressBtn").click(function() {
		alert(address);
	});
	 
	
function map(){
	//모달에 카카오 맵 띄우기
	setTimeout(function() { 
		
		
		
		kakao.maps.load(function() {
			// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
			 var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = { 
			        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };
			 //지도 생성
			 var map = new kakao.maps.Map(mapContainer, mapOption);
			 
			// 주소-좌표 변환 객체를 생성합니다
			 var geocoder = new kakao.maps.services.Geocoder();
		 	
			
			//---------------------------------주소 입력시 마커 띄우기 
			// 주소로 좌표를 검색합니다
			 geocoder.addressSearch(address , function(result, status) {

			     // 정상적으로 검색이 완료됐으면 
			      if (status === kakao.maps.services.Status.OK) {

			         var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

			         // 결과값으로 받은 위치를 마커로 표시합니다
			         var marker = new kakao.maps.Marker({
			             map: map,
			             position: coords
			         });

			         // 인포윈도우로 장소에 대한 설명을 표시합니다
			         var infowindow = new kakao.maps.InfoWindow({
			             content: '<div style="width:150px;text-align:center;padding:6px 0;">'+address+'</div>'
			         });
			         infowindow.open(map, marker);

			         // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			         map.setCenter(coords);
			     } 
			     
			 });    
		 });
	
	}, 1700);
	
}
	
	
	 
		  
	
});
</script> 		

<!----------------------------[다음 지도 끝]-------------------------------------------------------------->


		<div class = "row">
			<div class = "col-2">
				<label>주소 검색</label>
			</div>
         	<div class = "col-8">
         		<input type="text" name = "addressSearch" id = "addressSearch">
         	</div>
			<div class = "col-2">
				<input type = "button" id = "addressBtn" value = "검색">		
			</div>
       		</div>
        </div>
        
         <!--  modal footer-->
        <div class="modal-footer">
          <input type="button" class="button" data-dismiss="modal" value = "Close">
        </div>
        
      </div>
    </div>
  </div>

								
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
									<input type="file" class="form-control-file border" name="file">
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