<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/header.jsp" %>
<%@ include file="/WEB-INF/views/board/temp/board_common.jsp" %>
<%@ include file="/WEB-INF/views/board/temp/headstyle.jsp" %>

<script>
$(document).ready(function() {
	//글쓰기 이동 버튼
	$(".moveWriteBtn").click(function() {
			
			$("#boardCategory").val("${boardCategory}");
			$("#pg").val("1");
			$("#key").val("${key}");
			$("#word").val("${word}");
			$("#boardNo").val("${boardNo}}");
			$("#commonForm").attr("method", "GET").attr("action", "${root}/board/write").submit();
		
	});
	
	//각 게시물 보기 버튼
	$(".viewBtn").click(function() {
		$("#boardCategory").val("${boardCategory}");
		$("#pg").val("1");
		$("#key").val("${key}");
		$("#word").val("${word}");
		$("#boardNo").val($(this).attr("data-seq"));
		$("#commonForm").attr("method", "GET").attr("action", "${root}/board/view").submit();
	});
	
	//최신목록
	$(".firstListBtn").click(function() {
		$("#boardCategory").val("${boardCategory}");
		$("#pg").val("1");
		$("#key").val("");
		$("#word").val("");
		$("#commonForm").attr("method", "GET").attr("action", "${root}/board/list").submit();
	});
	
	//페이지, 끝 목록
	$(".moveListBtn").click(function() {
		$("#boardCategory").val("${boardCategory}");
		$("#pg").val($(this).attr("data-pg"));
		$("#key").val("${key}");
		$("#word").val("${word}");
		$("#commonForm").attr("method", "GET").attr("action", "${root}/board/list").submit();
	});
	
	//검색 기능
	$("#searchBtn").click(function() {
		$("#boardCategory").val("${boardCategory}");
		$("#pg").val("1");
		$("#key").val($("#skey").val());
		$("#word").val($("#sword").val());
		$("#commonForm").attr("method", "GET").attr("action", "${root}/board/list").submit();
	});

});
</script>	




							<!-- Content -->
							
							<!-- 게시판 제목 -->
								<section>
									<header class="main">
									<c:if test="${parameter.boardCategory == 1}">
										<label><font size="10px">홍보게시판</font></label>
									</c:if>
									<c:if test="${parameter.boardCategory == 2}">
										<label><font size="10px">고등학교 게시판</font></label>
									</c:if>
									<c:if test="${parameter.boardCategory == 3}">
										<label><font size="10px">대학교 게시판</font></label>
									</c:if>
									<c:if test="${parameter.boardCategory == 4}">
										<label><font color="red" size="10px">Hot</font><font size="10px">게시판</font></label> 
									</c:if>
									</header>
									
									
									
							<!--========= table========== -->
									<div class = "table-wrapper">
											<table>
												<thead>
													<tr>
														<th>NO</th>
														<th>제목</th>
														<th>작성자</th>
														<th>작성일</th>
														<th>조회</th>
														<th>좋아요</th>
													</tr>
												</thead>
												<tbody>
												<c:if test="${parameter.boardCategory != 4}">
												<c:forEach var = "article" items = "${articleList}">
													<tr class = "viewBtn" data-seq="${article.boardNo}">
														<td>${article.boardNo}</td>
														<td>[${article.region}/${article.bSchoolName}]${article.boardSubject.replace('<','&lt;')}</td>
														<td>${article.bUserId}</td>
														<td>${article.bPostdate}</td>
														<td>${article.bViewCount}</td>
														<td>${article.likeCount}</td>
													</tr>
												</c:forEach>
												</c:if>
												<c:if test="${parameter.boardCategory == 4}">
													<c:forEach var = "hotArticle" items = "${hotArticleList}">
														<tr class = "viewBtn" data-seq="${hotArticle.boardNo}">
															<td>${hotArticle.boardNo}</td>
															<td>[${hotArticle.region}/${hotArticle.bSchoolName}]${hotArticle.boardSubject.replace('<','&lt;')}</td>
															<td>${hotArticle.bUserId}</td>
															<td>${hotArticle.bPostdate}</td>
															<td>${hotArticle.bViewCount}</td>
															<td>${hotArticle.likeCount}</td>
														</tr>
													</c:forEach>
												</c:if>
												</tbody>
											</table>
									</div>
										<c:if test="${userInfo.userId != null}">
											<c:if test="${parameter.boardCategory != 4}">
											<div class = "col-2" style = "float: right;">
												<button class = "button moveWriteBtn" id = "moveWriteBtn">글쓰기</button>
												</div>
											<br>
											</c:if>
										</c:if>
									<hr class="major" />
									<br>
									
									
									
									<!-- ===============page 처리============ -->
										<div class = "row" align="center" style="margin: auto 0;">
										<div class = "col-2"></div>
										<div class = "col-8 page">
											<ul class="pagination">
												${navigator.navigator}
											</ul>
										</div>
										<div class = "col-2"></div>
								
								
								<!-- =============== 조건 검색 창 ===========-->
									<c:if test="${parameter.boardCategory != 4}">
										<div class = "col-1"></div>
										<div class = "col-3" style="margin-right: 0; padding:0;">
										<select name = "key" id="skey">
											<option value="board_subject">글제목</option>
											<option value="b_user_id">작성자</option>
											<!-- <option value="b_school_name">학교이름</option> -->
										</select>
										</div>
										<div class = "col-6" style="margin-left: 0;margin-right: 0;padding:0;">
										<input type="text" placeholder="검색내용을 입력해주세요" name = "word" id = "sword">					
										</div>
										<div class = "col-1" style="margin-left: 0; margin-right: 0;padding:0;">
										<button class="button icon solid fa-search" id = "searchBtn">검색</button>
										</div>
									</c:if>
									</div>
									
								</section>

						</div>
					</div>

<%@ include file="/WEB-INF/views/board/temp/tempfooter.jsp" %>