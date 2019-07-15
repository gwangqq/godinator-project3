<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/board/temp/tempheader.jsp" %>
<%@ include file="/WEB-INF/views/board/temp/headstyle.jsp" %>
<!-- 모달창 들  -->
<!--장소검색  Modal -->
<c:set var = "selected" value = "${article.region}"/>
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
				//alert(schoolName);
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
							//alert(response.uSchoolList);
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
			//alert(schoolType+"|||||" + schoolName);
			$.ajax({
				url:'${root}/board/searchschool',
				type: 'POST',
				contentType:'application/json;charset=UTF-8',
				dataType : 'json',
				data: param,
				success : function(response) {
					if(schoolType == "고등학교"){
						listHSchool(response);
						$("#schoolName").val(""); 
					} else {
						//alert(response.uSchoolList);
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
		//alert(hschoolcnt);
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
		//alert(uschoolcnt);
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
		//alert(checkschool);
		if(checkschool != "검색결과가 없습니다."){
			$(this).parent().siblings("#checkedschool").find("#finalcheck").text(checkschool);
		} else {
			$(this).parent().siblings("#checkedschool").find("#finalcheck").text("");
		}
	});  
		
//modal창 확인 눌렀을 때 바깥 textfield에 학교 이름 뿌리기
	$(document).on("click", "#confirmschool", function(){
		var checkschool = $(this).parent().prev().find("#finalcheck").text();
		//alert(checkschool);
		$("#searchSchool").val(checkschool);
		$("#searchresult").empty();
		$("#finalcheck").empty();
	}); 
	
	//------------------------------[학교 검색 모달창 끝]-----------------------------------	
//글 수정 완료 눌렀을 때 
	$("#modifyBtn").click(function() {
		
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
			$("#modifyForm").attr("action", "${root}/board/modify").submit();
			alert("글 수정을 완료했습니다.");
		}
	});
	
		
//글작성 취소 눌렀을 때 list로 돌아가기 
	$("#cancelBtn").click(function() {
		history.back();
	});
	
//셀렉트 박스 셀렉트 해놓기
	
	//alert(choice);
	var selected = "${selected}";
	var options = $("#region").children(".regionchoice");
		
	for(var i = 0; i < options.length; i ++){
		if(options[i].value == selected){
			options[i].selected = "selected";
		}
	}
	
});
</script>	

							<!-- Content -->
									<header class="main">
									<br>
									<c:if test="${parameter.boardCategory == 1}">
										<label>홍보게시판</label>
									</c:if>
									<c:if test="${parameter.boardCategory == 2}">
										<label>고등학교 게시판</label>
									</c:if>
									<c:if test="${parameter.boardCategory == 3}">
										<label>대학교 게시판</label>
									</c:if>
									<c:if test="${parameter.boardCategory == 4}">
										<label><font color="red">Hot</font> 게시판</label> 
									</c:if>
									</header>
								<hr class = "major"/>	
								<!-- 작성 전체 폼 -->
<form id="modifyForm" name="modifyForm" method="post" action="">
				<!-- enctype="multipart/form-data" --> 
								<div class = "row">
				
				<input type="hidden" name="boardCategory" value="${parameter.boardCategory}">
				<input type="hidden" name="boardNo" value="${article.boardNo}">
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
								<input type="text" name="boardSubject" id="subject" value="${article.boardSubject.replace('<','&lt;')}" placeholder="게시물의 제목을 입력해주세요.(75자까지 입력가능)" maxlength="75"/>
								</div>
								<div class = "col-2"></div>
								
								
								<!-- 지도 파일 첨부 -->
								<div class = "col-2"></div>
								<div class = "col-1">
								<label>지역 선택</label>
								</div>
								<div class = "col-3">
								<select name ="region" id = "region" style="color: #7f888f;">
<option class = "regionchoice" value="전국">전국</option><option class = "regionchoice" value="서울">서울</option><option class = "regionchoice" value="부산">부산</option><option class = "regionchoice" value="인천">인천</option>
<option class = "regionchoice" value="대구">대구</option><option class = "regionchoice" value="광주">광주</option><option class = "regionchoice" value="대전">대전</option><option class = "regionchoice" value="울산">울산</option>
<option class = "regionchoice" value="강원">강원</option><option class = "regionchoice" value="경기">경기</option><option class = "regionchoice" value="경남">경남</option><option class = "regionchoice" value="경북">경북</option>
<option class = "regionchoice" value="전남">전남</option><option class = "regionchoice" value="전북">전북</option><option class = "regionchoice" value="충남">충남</option><option class = "regionchoice" value="충북">충북</option><option class = "regionchoice" value="제주">제주</option>
								</select>
								</div>
								
								<div class = "col-1">
								<label>장소 첨부</label>
								</div>
								<div class = "col-3">																<!-- onclick="resizeMap();" -->
								<input type="button" id = "mapBtn"class="button" data-toggle="modal" data-target="#mapModal" value="장소검색" >
								<label id = "placeresult" style="padding: 0;margin: 0;"></label>
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
<script type="text/javascript">
$(document).ready(function(){
	
    	var place = "";
	 $("#search").keypress(function(key) {
		
		// ID를 alpreah_input로 가지는 곳에서 키를 누를 경우
	        //키의 코드가 13번일 경우 (13번은 엔터키)
	        if (key.keyCode == 13) {
	            
	        place = $("#search").val();
	        	//경고창을 출력한다.
	            alert(place);
	        	
	         // 키워드로 장소를 검색합니다
	       ps.keywordSearch(place, placesSearchCB);    
	       $("#search").val("");
	        }
		}); 
	 
 
setTimeout(function() { 
	kakao.maps.load(function() {
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new kakao.maps.Map(mapContainer, mapOption);
		//지도에 컨트롤을 추가해야 지도위에 표시됩니다
		var mapTypeControl = new kakao.maps.MapTypeControl();
		//kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
		
		//지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places();  	
		
	}); 
	
			
	}, 2000);
	
	
function placesSearchCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {
        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new kakao.maps.LatLngBounds();
        for (var i=0; i<data.length; i++) {
        	//console.log(data[i].x);
        	//console.log(data[i].y);
            //displayMarker(data[i]);    
            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
        }       
        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    } 
}
// 지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
    
    // 마커를 생성하고 지도에 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: new kakao.maps.LatLng(place.y, place.x)
    });
	var searchresult = "";
	// 마커에 클릭이벤트를 등록합니다
	kakao.maps.event.addListener(marker, 'click', function(mouseEvent) {
	   	searchresult = place.place_name;
		// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
	    infowindow.setContent('<div class = "result" style="padding:5px;font-size:12px;">' + searchresult + '</div>');
	    infowindow.open(map, marker); 
	});
} 
});
</script> 		

<!----------------------------[다음 지도 끝]-------------------------------------------------------------->


		<div class = "row">
         	<div class = "col-2">
				<label>장소 검색</label>
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
								<input name = "bSchoolName" type="text" name="searchSchool" id="searchSchool" value="${article.bSchoolName}"
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
								rows="20" style="resize: none;">${article.boardContent}</textarea>
								</div>
								<div class = "col-2"></div>
								
								<br>
								<!-- 게시물 완료 버튼 및 위로가기 버튼 -->

								
								<!-- 
								<div class = "col-2"></div>
								<div class = "col-8">
									<input type="file" class="form-control-file border" name="file">
								</div>
								<div class = "col-2"></div> -->
								
								<div class = "col-8"></div>
								<div class = "col-2" style="padding-right: 0;">
									<input type ="button" class = "button samll" id = "cancelBtn" value = "취소">
									<input type ="button" class = "button primary samll" id = "modifyBtn" value = "수정">
								</div>
								<div class = "col-2"></div>
								</div>
</form> 
						</div>
					</div>
					
<%@ include file="/WEB-INF/views/board/temp/tempfooter.jsp" %>	