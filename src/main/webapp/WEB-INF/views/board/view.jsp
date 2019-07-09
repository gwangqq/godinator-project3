<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/board/temp/tempheader.jsp" %>	
<%@ include file="/WEB-INF/views/board/temp/board_common.jsp" %>
<%@ include file="/WEB-INF/views/board/temp/headstyle.jsp" %> 
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
<style>
.like :hover{
	color: #f56a6a;
}

.like{
	color:black;
}
</style>
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
	
	<%-- 수정 버튼--%>
	$(".moveModifyBtn").click(function() {
		$("#boardCategory").val("${boardCategory}");
		$("#pg").val("${pg}");
		$("#key").val("${key}");
		$("#word").val("${word}");
		$("#boardNo").val("${boardNo}");
		$("#commonForm").attr("method", "GET").attr("action", "${root}/board/modify").submit();
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
		var memostr = '';
		for(var i=0;i<memocnt;i++){
			var memo = memos.commentList[i];
//댓글 하나 달기 
		memostr += '<tbody>';
		memostr += '<tr style = "height:70px;">';
		memostr += '	<td colspan="2" rowspan ="1">' + memo.CUserId+ '</td>';
		memostr += '	<td colspan="5" rowspan ="1" width = "450">'+memo.commentContent+'</td>';
		memostr += '	<td colspan="3" rowspan ="1">'+memo.CPostdate+'</td>';
		memostr += '	<td colspan="2" rowspan ="1" ><a href = "#" style = "maring:0;padding:0;"><a href="#">신고</a></td>';
		
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
		alert(boardNo + "||" + commentContent + "|" +commentNo);
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
			}
		});
	}
	
	
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
									<a href="index.html" class="logo"><strong>${article.bUserId}</strong></a>님 환영합니다.
									<a>로그인</a><a>마이페이지</a>
								</header>

							<!-- Content -->
							
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
									<hr style="margin: 0;">
										<span style = "float:left;">
										<a href="#">
											<img class="profile_icon" alt="작성자 프로필 사진" src="/godinator/resources/images/pic11.jpg">
										</a>
										</span>
										
										<span style = "float: left;">
											<a id="writerId" class="font_bold_small" href="#" style="color: #7f888f; padding-top: 0;padding-bottom: 5em;" >${article.bUserId}</a>
										</span>
									<!-- 작성시간 -->
									<span style="float:right;">${article.bPostdate}</span>
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
										${article.boardContent}
										</p>
										
									</div>
									<div class = "col-2"></div>
									<br><br><br><br>
									
									
									<!-- 좋아요 싫어요 버튼  -->
									<div class = "col-5"></div>
									<div class = "col-2">
										<div class="rounded-lg" style="background-color: white; width:20vh; height: 100px; padding-top: 15px; margin:auto; text-align: center;">
											
											<div class="btnLike" style="float:left; margin-left: 0.8em;">
												<a href="#" class = "like"><i class='far fa-thumbs-up' style='font-size:48px;'></i></a>
												<span style="display: block;">0</span>
											</div>
											<div class="btnLike" style="float:right; margin-right: 0.8em;">
												<a href="#" class = "like"><i  class='far fa-thumbs-down' style='font-size:48px;'></i></a>
												<span style="display: block;">0</span>
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
									</div>
									<div class = "col-2"></div>
								</div>
								<!-- 글정보 및 신고하기 -->
								<div class =  "row col-12">
									<div class = "col-2"></div>
									<div class = "col-8" id = "boradInfo">
									<span>댓글0| 조회수  ${article.bViewCount}| 좋아요 0|<a href="#" style="color: #7f888f"><i class = "fas fa-exclamation-triangle	"></i>게시물 신고</a></span>
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
<%@ include file="/WEB-INF/views/mentor/temp/tempfooter.jsp" %>	