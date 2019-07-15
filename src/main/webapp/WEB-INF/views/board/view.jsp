<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/header.jsp" %>
<%@ include file="/WEB-INF/views/board/temp/board_common.jsp" %>
<%@ include file="/WEB-INF/views/board/temp/headstyle.jsp" %> 
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
<script>

$(document).ready(function() {
	//리스트 돌아가기
	$("#moveListBtn").click(function() {
		$("#boardCategory").val("${boardCategory}");
		$("#pg").val("1");
		$("#key").val("");
		$("#word").val("");
		$("#boardNo").val("");
		$("#commonForm").attr("method", "GET").attr("action", "${root}/board/list").submit();
	});
	
	//수정 버튼
	$(".moveModifyBtn").click(function() {
		$("#boardCategory").val("${boardCategory}");
		$("#pg").val("${pg}");
		$("#key").val("${key}");
		$("#word").val("${word}");
		$("#boardNo").val("${boardNo}");
		$("#commonForm").attr("method", "GET").attr("action", "${root}/board/modify").submit();
	});
	
	//글작성
	$("#moveWriteBtn").click(function() {
		$("#boardCategory").val("${boardCategory}");
		$("#pg").val("1");
		$("#key").val("");
		$("#word").val("");
		$("#commonForm").attr("method", "GET").attr("action", "${root}/board/write").submit();
	});
	
	//삭제버튼
	$(".DeleteBtn").click(function() {
		var flag = confirm("게시물을 삭제하시겠습니까?");
		if (flag == true) {
			$("#boardCategory").val("${boardCategory}");
			$("#pg").val("1");
			$("#key").val("");
			$("#word").val("");
			$("#boardNo").val("${boardNo}");
			$("#commonForm").attr("method", "GET").attr("action", "${root}/board/delete").submit();
		}
		
	})
	
	
	//이전 글  
	$("#preView").click(function(){
			$("#boardCategory").val("${boardCategory}");
			$("#pg").val("${pg}");
			$("#key").val("${key}");
			$("#word").val("${word}");
			$("#boardNo").val("${boardNo}");
			$("#commonForm").attr("method", "GET").attr("action", "${root}/board/prev").submit();
	});
	
	
	//다음 글
	$("#nextView").click(function(){
			$("#boardCategory").val("${boardCategory}");
			$("#pg").val("${pg}");
			$("#key").val("${key}");
			$("#word").val("${word}");
			$("#boardNo").val("${boardNo}");
			$("#commonForm").attr("method", "GET").attr("action", "${root}/board/next").submit();
		
	});
	
	<%--댓글 기능 시작--%>
	<%--댓글 작성--%>
	$("#commentBtn").click(function() {
		if('${userInfo == null}' == true){
			alert("로그인 하세요");
		} else {
			var boardNo ='${article.boardNo}';
			var commentContent = $("#commentContent").val();
			var param = JSON.stringify({'boardNo' : boardNo, 'commentContent' : commentContent});
			if(commentContent.trim().length != 0){
				$.ajax({
					url:'${root}/comment',
					type: 'POST',
					contentType:'application/json;charset=UTF-8',
					dataType : 'json',
					data:param,
					success : function(response) {
						makeMemoList(response);
						$("#commentContent").val('');
					}
				});
			}
		}
	});
	
	<%--댓글을 리스트로 보여주기--%>
	 getMemoList();
	$(document).on("click",".mdeleteBtn", function() {
		var flag = confirm("댓글을 삭제하시겠습니까??");
		if(flag == true){
			$.ajax({
				url:'${root}/comment/'+$(this).parent("td").attr("data-seq")+'/'+$(this).parent("td").attr("data-mseq"),
				type: 'DELETE',
				contentType:'application/json;charset=UTF-8',
				dataType : 'json',
				success : function(response) {
					makeMemoList(response);
					$("#commentContent").val('');
				}
			});
		}
	});
 	
	
 	
	function makeMemoList(memos) {
		var memocnt = memos.commentList.length;
		$("#ccount").text(memos.count);
		var memostr = '';
		for(var i=0;i<memocnt;i++){
			var memo = memos.commentList[i];
//댓글 하나 달기 
		memostr += '<tbody>';
		memostr += '<tr style = "height:70px;">';
		memostr += '	<td colspan="2" rowspan ="1">' + memo.CUserId+ '</td>';
		memostr += '	<td colspan="5" rowspan ="1" width = "450">'+memo.commentContent+'</td>';
		memostr += '	<td colspan="3" rowspan ="1">'+memo.CPostdate+'</td>';
		memostr += '	<td colspan="2" rowspan ="1" ></td>';
		
		//자기가 작성한 댓글에 수정 삭제 
 		if('${userInfo.userId}' == memo.CUserId){
			memostr += '<td colspan="2" rowspan ="1" data-seq="'+memo.boardNo+'" data-mseq="'+memo.commentNo+'"  style = "maring:0;padding:0;"><a href= "#" class = "mmodifyBtn">수정</a><br><a href = "#" class="mdeleteBtn">삭제</a></td>';
			
			//댓글 수정 창 
			memostr +='<tr class = "modifyComment" style = "display : none;">';
			memostr +='		<td colspan="1" rowspan ="1">' + memo.CUserId+ '</td>';
			memostr +='		<td colspan="7"><textarea class="commentContent" cols="500" rows="2" style = "resize : none;">'+memo.commentContent+'</textarea>';
			memostr +='		</td>';
			memostr +='		<td colspan="2" width="100" style="padding: 10px" data-mseq="'+memo.commentNo+'">';
			memostr +='			<a href = "#" class= "memoModifyBtn">수정</a><br>';
			memostr +='			<a href = "#" class= "memoModifyCancelBtn">취소</a>';
			memostr +='		</td>';
			memostr +='</tr>'; 
		}
 		memostr += '	</tr>';
		memostr += '</tbody>';
		}
		$("#mlist").empty();
		$("#mlist").append(memostr);
	}
	
	
	getMemoList();
	<%-- 댓글 수정 버튼 --%>
	$(document).on("click", ".mmodifyBtn", function() {
/* 		$(".modifyComment").attr("style",  "display : '';"); */
		$(this).parent().parent().css("display", "none");
		$(this).parent().parent().next().css("display", "table-row");
	});
	
	$(document).on("click", ".memoModifyCancelBtn", function() {
		/* $(".modifyComment").attr("style",  "display : '';"); */
		$(this).parent().parent().css("display", "none");
		$(this).parent().parent().prev().css("display", "table-row");
	});
	
	$(document).on("click", ".memoModifyBtn", function() {
		var boardNo ='${article.boardNo}';
		var commentContent = $(this).parent().prev().find(".commentContent").val();
		var commentNo = $(this).parent().attr("data-mseq");
		//alert(boardNo + "||" + commentContent + "|" +commentNo);
		var param = JSON.stringify({'boardNo' : boardNo, 'commentContent' : commentContent, 'commentNo' : commentNo});
		if(commentContent.trim().length != 0){
			$.ajax({
				url:'${root}/comment',
				type: 'PUT',
				contentType:'application/json;charset=UTF-8',
				dataType : 'json',
				data:param,
				success : function(response) {
					makeMemoList(response);
				}
			});
		} else{
			alert("댓글의 내용을 작성해주세요");
		}
	});
	
	
	//기본 댓글 불러들이는 메소드
	function getMemoList(memos) {
		$.ajax({
			url:'${root}/comment',
			type: 'GET',
			contentType:'application/json;charset=UTF-8',
			dataType : 'json',
			data:{boardNo : '${article.boardNo}'},
			success : function(response) {
				makeMemoList(response);
				//$("#ccount").text(response.count);
			}
		});
	}
	
	
//----------------------------------좋아요 기능------------------------------------
	$(".likeBtn").click(function() {
		//alert("눌렸다");
		var boardNo ='${article.boardNo}';
		var userId = '${userInfo.userId}';
		var likeUnlike = $(this).attr("likeUnlike");
		if(userId != null){
			var param = JSON.stringify({'boardNo' : boardNo, 'userId' : userId, 'likeUnlike' : likeUnlike});
			$.ajax({
				url:'${root}/board/like',
				type: 'POST',
				contentType:'application/json;charset=UTF-8',
				data:param,
				dataType : 'json',
				success : function(result) {
					if(result.likeCheck != "like"){
						alert(result.likeCheck);
					}
					
					$("#totalLike").text(result.totalLike);
					$("#totalHate").text(result.totalHate);
				}
			});
			
		} else {
			alert("로그인이 필요합니다");
			return false;
		}
		
	});
	
	
});



</script>
							
							<!-- 제목 -->
										
							<!-- 게시물 상단 부분 -->
							<div class = "row" style="padding: 0;margin: 0;">
							<br><br>
							<div class = "col-2"></div>
							<div class = "col-8">
								<font size="6">[${article.region}/${article.bSchoolName}]${article.boardSubject.replace('<','&lt;')}</font>
								<hr style="margin: 0;">
							</div>
							<div class = "col-2"></div>
									<!-- 아이디 -->
									<div class = "col-2"></div>
									<div class="col-8">
										<!-- <span style = "float:left;">
										<a href="#">
											<img class="profile_icon" alt="작성자 프로필 사진" src="/godinator/resources/images/pic11.jpg">
										</a>
										</span> -->
										
										<span style = "float: left;">
											<a id="writerId" class="font_bold_small" href="#" style="color: #7f888f; padding-top: 0;padding-bottom: 5em;" >${article.bUserId}</a>
										</span>
									<!-- 작성시간 -->
									<span style="float:right;">${article.bPostdate}</span>
									<br>
									<!-- 첨부파일 -->
									<!-- <span style="float:right;"><a href = "#" id = "download"><i class = "fas fa-download"></i>첨부파일</a></span>&nbsp;
									<br> -->
									<hr style="margin: 0;">
									</div>
									<div class = "col-2"></div>
									
								<br><br><br>
									
								<!-- 작성 전체 폼 -->
									<div class = "col-2"></div>
									<div class = "col-8" style = "clear: both;text-align: left;" >
									
										<p id = "viewcontent">
										${article.boardContent}
										</p>
										
									</div>
									<div class = "col-2"></div>
									<br><br><br><br>
									<c:if test='${article.latitude !=0 && article.longtitude !=0}'>
								<!-- 지도 -->
								<div class = "row col-12">
									<div class = "col-2"></div>
									<div class = "col-8" id = "maparea" style="width:300px;height:300px;"></div>
										<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f22525e443605fce310be835dea5bdc2&libraries=services,clusterer,drawing&autoload=false"></script>
										<script>
						 	map();
										
							function map(){ 
								//모달에 카카오 맵 띄우기
								setTimeout(function() { 
										
									kakao.maps.load(function() {
											var latitude = ${article.latitude};
											var longtitude = ${article.longtitude};
											
											var mapContainer = document.getElementById('maparea'), // 지도를 표시할 div 
											    mapOption = { 
											        center: new kakao.maps.LatLng(latitude, longtitude), // 지도의 중심좌표
											        level: 4
											// 지도의 확대 레벨
											    };
											
											var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
											
										
											map.relayout();
											
											// 마커가 표시될 위치입니다 
											var markerPosition  = new kakao.maps.LatLng(latitude, longtitude); 
											
											
											var imageSrc = 'https://i.ya-webdesign.com/images/address-icon-png-8.png', // 마커이미지의 주소입니다    
										    imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
										    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
										      
										// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
										var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
										    markerPosition = new kakao.maps.LatLng(latitude, longtitude); // 마커가 표시될 위치입니다 
											
											var marker = new kakao.maps.Marker({
											    position: markerPosition,
											    image: markerImage
											});
											
											// 마커가 지도 위에 표시되도록 설정합니다
											marker.setMap(map);
											
											// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
											// marker.setMap(null);  
											

											
										});
								
							}, 700);
						 } 
											</script>
									
									<div class = "col-2"></div>
								</div>
							</c:if>
									
									<!-- 좋아요 싫어요 버튼  -->
									<div class = "col-5"></div>
									<div class = "col-2">
										<div class="rounded-lg" style="background-color: white; width:20vh; height: 100px; padding-top: 15px; margin:auto; text-align: center;">
											
											<div style="float:left; margin-left: 0.8em;">
												<label id = "like" likeUnlike = "L" class = "likeBtn"><i class='far fa-thumbs-up' style='font-size:48px;'></i></label>
												<span style="display: block;" id = "totalLike">${totalLike}</span>
											</div>
											<div  style="float:right; margin-right: 0.8em;" >
												<label id = "unlike"  likeUnlike = "U" class = "likeBtn"><i class='far fa-thumbs-down' style='font-size:48px;'></i></label>
												<span style="display: block;" id = "totalHate">${totalHate}</span>
											</div>
											
											<div style="clear: both;"></div>
										</div>
									</div>
									<div class = "col-5"></div>
									<!-- 수정 삭제 버튼  -->	
									<div class = "col-2"></div>
									<div class = "col-6"></div>
									<div class = "col-2">	
									<c:if test='${userInfo.userId == article.bUserId}'>		
										<input type="button" class = "button small moveModifyBtn" value="글수정"> 
										<input type="button" class = "button small DeleteBtn" value="글삭제">
									</c:if>	
									</div>
									<div class = "col-2"></div>
								
								
								<!-- 댓글 쓰기 -->
								<div class = "row col-12">	
									<div class = "col-2"></div>
	
									<div class = "col-8">
									<span><textarea id = "commentContent" cols="4" style="resize: none;" maxlength="200" placeholder="최대 200자까지 작성 가능합니다."></textarea></span>
									<span style="float: right;"><button class = "button primary" id = "commentBtn"style="height: 100%;">등록</button></span>
									</div>
									<div class = "col-2"></div>
								</div>
								
								
							
								
								<!-- 댓글 쓰기 끝 -->	
								<div class = "row col-12">
									<div class = "col-2"></div>
									<div class = "col-8">
									<br><br>
									<span style = "float:right;">
									<c:if test='${isNext != "0"}'>
									<button class = "button small" id = "nextView">이전글</button>
									</c:if>
									<c:if test='${isPrev != "0"}'>
									<button class = "button small" id = "preView">다음글</button>
									</c:if>
									<button class = "button small" id = "moveListBtn">목록</button>
									</span>
									<c:if test='${userInfo.userId == article.bUserId}'>	
										<button class = "button small" id = "moveWriteBtn">글작성</button>
									</c:if>
									</div>
									<div class = "col-2"></div>
								</div>
								<!-- 글정보 및 신고하기 -->
								<div class =  "row col-12">
									<div class = "col-2"></div>
									<div class = "col-8" id = "boradInfo">
									<span>댓글</span><span id = "ccount"></span><span>| 조회수  ${article.bViewCount} | 좋아요 <span id = "likecount"></span>|<!-- <a href="#" style="color: #7f888f"><i class = "fas fa-exclamation-triangle	"></i>게시물 신고</a> --></span>
									</div>
									<div class = "col-2"></div>
								</div>
								<!-- 댓글 내용 나오는 곳 -->
								<div class =  "row col-12">
									<div class = "col-2"></div>
									<div  class = "col-8">
										<table id = "mlist">
											
										</table>
									</div>
									<div class = "col-2"></div>
								</div>
								</div>
						</div>
							
						
						
						
					</div>
<%@ include file="/WEB-INF/views/board/temp/tempfooter.jsp" %>	