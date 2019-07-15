<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/header.jsp" %>
<%@ include file="/WEB-INF/views/board/temp/board_common.jsp" %>
<%@ include file="/WEB-INF/views/board/temp/headstyle.jsp" %>
</head>
								<section style="padding: 0;margin: 0;">
									<header class="main">
										<label><font size = "10px">Godinator를 방문해주셔서 감사합니다</font></label>
									</header>
									
									
									
							<!--========= table========== -->
									<div class = "table-wrapper">
											<div class = "row">
											<div class = "col-12" style="height:400px;background-color: green;">TOP 부분입니다.</div>
											<div class = "col-12">
											<a href = "#" >게시판 가기</a>
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
												<c:if test="${parameter.boardCategory == 4}">
													<c:forEach var = "hotArticle" items = "${mainArticleList}">
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
											</table>
											</div>
											<div class = "col-12" style="height:400px;background-color: lightgray;">BOTTOM 부분입니다.</div>
											</div>
									</div>
									
								</section>

						</div>
					</div>

<%@ include file="/WEB-INF/views/board/temp/tempfooter.jsp" %>