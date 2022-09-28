<%@page import="java.util.Base64.Decoder"%>
<%@page import="org.python.icu.impl.number.Parse"%>
<%@page
	import="org.eclipse.jdt.internal.compiler.parser.ParserBasicInformation"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="org.springframework.boot.web.servlet.server.Encoding"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>

<html>
<head>
<title>Sound of Mind</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<link rel="stylesheet" href="/resources/assets/css/loading.css" />

</head>
<body class="is-preload">
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Main -->
		<div id="main">
			<div class="inner">
				<!-- Header -->
				<header id="header">
					<a href="index.do" class="logo"><strong>Sound</strong> of
						Mind </a>
					<ul class="icons">
						<c:if test="${user==null}">
							<li><a href="login.do"><span class="label">Login</span></a></li>
							<li><a href="join.do"><span class="label">Sign Up</span></a></li>
						</c:if>
						<c:if test="${user!=null }"> 
						${user.name}님 
						<li><a href="logout.do"><span class="label">Logout</span></a></li>
							<%-- <li><a href="delete.do?id=${user.id}" ><span class="label">회원탈퇴</span></a></li> --%>
						</c:if>
					</ul>

				</header>
				<!-- Banner -->
				<section id="banner">
					<div class="content" style="height: 554.3px;">
						<!-- loading animation -->
						<div class='music'
							style="padding-top: 200px; padding-bottom: 200px;">
							<div class='bar'></div>
							<div class='bar'></div>
							<div class='bar'></div>
							<div class='bar'></div>
							<div class='bar'></div>
							<div class='bar'></div>
							<div class='bar'></div>
							<div class='bar'></div>
							<div class='bar'></div>
							<div class='bar'></div>
						</div>
						<br>
						<button onclick="speaker()">Mic</button>
					</div>

					<div class="content" style="height: 554.3px;">

						<input type="text" name="inputSTT" style="height: 200px; margin-bottom: 20px;"> 
						<input type="text" style="height: 200px; margin-bottom: 20px;">

						<button>
							<a href="#">Revise</a>
						</button>
						<button>
							<a href="#">Sentiment Analysis</a>
						</button>
					</div>
				</section>

			</div>
		</div>
		<!-- Sidebar. -->
		<div id="sidebar">
			<div class="inner">
				<!-- Menu -->
				<nav id="menu">
					<header class="major">
						<h2>MENU</h2>
					</header>
					<ul>
						<li><span class="opener">COMMUNITY</span>
							<ul>
								<li><a href="community.do">BOARD</a></li>
								<li><a href="#">NEWS</a></li>
								<li><a href="#">INFORMATION</a></li>
								<li><a href="#">CAHTTING</a></li>
							</ul></li>
						<li><a href="mypage.do">MY PAGE</a></li>
						<li><a href="#">SETTING</a></li>
						<li><a href="elements.html">SEND FEEDBACK</a></li>
					</ul>
				</nav>

				<!-- Footer. -->
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
	<script src="/resources/assets/js/jquery.min.js"></script>
	<script src="/resources/assets/js/browser.min.js"></script>
	<script src="/resources/assets/js/breakpoints.min.js"></script>
	<script src="/resources/assets/js/util.js"></script>
	<script src="/resources/assets/js/main.js"></script>
	<script type="text/javascript">
		function speaker() {
			$.ajax({
				url : "http://127.0.0.1:5000/stt",
				data : {
					num : 1
				},
				success : function(text) {
					console.log(text)
					$('input[name=inputSTT]').attr('value', text)
				},
				error : function(e) {
					console.log(e)
				}
			})
		}
	</script>

</body>
</html>