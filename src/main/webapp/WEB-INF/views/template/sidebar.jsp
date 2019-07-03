<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 바로 위에는 section 끝 -->	
	</div>
</div>

<!-- Sidebar -->
<div id="sidebar">
	<div class="inner">
		<section id="search" class="alt">
			<form method="post" action="#">
				<input type="text" name="query" id="query" placeholder="Search" />
			</form>
		</section>
		
		<nav id="menu">
			<header class="major"><h2>Menu</h2></header>
			<ul>
				<li><a href="member.jsp">show member</a></li>
				<li><a href="school.jsp">show school</a></li>
				<li><a href="recruit.jsp">recruit Info</a></li>
				<li><a href="chart.jsp">statistics</a></li>
				<li>
					<span class="opener">Submenu</span>
					<ul>
						<li><a href="#">Lorem Dolor</a></li>
						<li><a href="#">Ipsum Adipiscing</a></li>
						<li><a href="#">Tempus Magna</a></li>
						<li><a href="#">Feugiat Veroeros</a></li>
					</ul>
				</li>
				<li>
					<span class="opener">Another Submenu</span>
					<ul>
						<li><a href="#">Lorem Dolor</a></li>
						<li><a href="#">Ipsum Adipiscing</a></li>
						<li><a href="#">Tempus Magna</a></li>
						<li><a href="#">Feugiat Veroeros</a></li>
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
<script src="${root}/js/jquery.min.js"></script>
<script src="${root}/js/browser.min.js"></script>
<script src="${root}/js/breakpoints.min.js"></script>
<script src="${root}/js/util.js"></script>
<script src="${root}/js/main.js"></script>

</body>
</html>