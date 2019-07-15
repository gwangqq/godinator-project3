<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Sidebar -->

 
					<!-- Sidebar -->
<div id="sidebar">
   <div class="inner">
      <section id="mainPage" class="alt">
         <span>GODINATOR[MAIN]</span>
      </section>
      
      <nav id="menu">
         <header class="major"><h2>Menu</h2></header>
         <ul>
            <c:if test="${not empty userInfo}">
               <li>
               <span class="opener">마이페이지</span>
               <ul>
                  <li><a href="${root}/">진로검사</a></li>
                  <li><a href="${root}/">모교 평가</a></li>
               </ul>
               </li>
            </c:if>
            <li>
               <span class="opener">학교 정보</span>
               <ul>
                  <li><a href="${root}/searchschool/viewsearch">학교 검색</a></li>
                  <li><a href="${root}/schoolnews/viewnews">학교 뉴스 검색</a></li>
               </ul>
            </li>
            <li>
               <span class="opener" id = "community">커뮤니티</span>
               <ul id ="communityMenu">
                  <li><a href="${root}/board/list?boardCategory=1&pg=1&key=&word=">홍보게시판</a></li>
                  <li><a href="${root}/board/list?boardCategory=2&pg=1&key=&word=">고등학교 게시판</a></li>
                  <li><a href="${root}/board/list?boardCategory=3&pg=1&key=&word=">대학교 게시판</a></li>
                  <li><a href="${root}/board/list?boardCategory=4&pg=1&key=&word=">핫 게시물</a></li>
               </ul>
            </li>
            <li>
               <span class="opener">멘토링</span>
               <ul>
                  <li><a href="${root}/mentor/findmentor">멘토 찾기</a></li>
                  <li><a href="${root}/msg/msgbox">쪽지함</a></li>
                  <li><a href="${root}/resume/resumelist">자소서목록</a></li>
                  <li><a href="${root}/resume/editlist">첨삭목록</a></li>
               </ul>
            </li>
         </ul>
      </nav>

      <!-- Section -->
      <section>
         <header class="major">
            <h2>Get in touch</h2>
         </header>
         <ul class="contact">
            <li class="icon solid fa-envelope"><a href="#">claire97j@naver.com</a></li>
            <li class="icon solid fa-phone">(000) 000-0000</li>
            <li class="icon solid fa-home">서울시 구로구 디지털로 34길 43 <br>코오롱사이언스벨리 1차 4층
            </li>
         </ul>
      </section>

      <!-- Footer -->
      <footer id="footer">
         <p class="copyright">
            &copy; Untitled. All rights reserved. Demo Images: <a
               href="https://unsplash.com">Unsplash</a>. Design: <a
               href="https://html5up.net">HTML5 UP</a>.
         </p>
      </footer>

   </div>
</div>
</div>

<!-- Scripts -->
<script src="${root}/js/browser.min.js"></script>
<script src="${root}/js/breakpoints.min.js"></script>
<script src="${root}/js/util.js"></script>
<script src="${root}/js/main.js"></script>
<script>
   $(document).ready(function() {
      $("section#mainPage").click(function() {
         $(location).attr("href", "${root}/board/main");
      });
   });
</script>
</body>
</html>