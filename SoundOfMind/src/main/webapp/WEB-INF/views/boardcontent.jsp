<%@page import="java.util.Base64.Decoder"%>
<%@page import="org.python.icu.impl.number.Parse"%>
<%@page
	import="org.eclipse.jdt.internal.compiler.parser.ParserBasicInformation"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="org.springframework.boot.web.servlet.server.Encoding"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
pageContext.setAttribute("replaceChar", "\n");
%>
<!DOCTYPE HTML>

<html>
<head>
<!-- 폰트 -->
<link href="https://webfontworld.github.io/NanumSquare/NanumSquare.css"
	rel="stylesheet">

<title>마음의 소리</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/community.css" />
<!-- bootstrap -->

<style type="text/css">
#header {
	display: -moz-flex;
	display: -webkit-flex;
	display: -ms-flex;
	display: flex;
	border-bottom: #6495ED;
	padding: 6em 0 1em 0;
	position: relative;
}

.bg-dark {
	background-color: #6495ED !important;
}

.nav-link {
	display: initial;
	padding: 0.5rem 1rem;
	border-bottom: black;
	color: white !important;
}

.box {
	margin: 0 auto;
}

.actions.small {
	float: right;
}
</style>

</head>
<body class="is-preload">
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Main -->
		<div id="main">
			<div class="inner">
				<!-- Header -->
				<header id="header">
					<a href="index.do" class="logo"><strong>마음의</strong> 소리 </a>
					<ul class="icons">
						<c:choose>
							<c:when test="${user==null && Kakao == null && Naver == null}">
								<li><a href="login.do"><span class="label">로그인</span></a></li>
								<li><a href="join.do"><span class="label">회원가입</span></a></li>
							</c:when>
							<c:when test="${user!=null && Social == null && Kakao == null}">
							${user.id}님 
								<li><a href="logout.do"><span class="label">로그아웃</span></a></li>
							</c:when>
							<c:when test="${user==null && Naver != null && Kakao == null}">
							${Naveremail}님 
								<li><a href="logout.do"><span class="label">로그아웃</span></a></li>
							</c:when>
							<c:when test="${user==null && Naver == null && Kakao != null}">
							${id}님 
								<li><a href="logout.do"><span class="label">로그아웃</span></a></li>
							</c:when>
						</c:choose>
					</ul>

				</header>


				<!-- 상단 메뉴  & 검색 -->




				<!-- 제목, 아이디, 등록일시, 조회수 -->


				<hr class="major"
					style="margin-top: 30px; margin-bottom: 5px; border-bottom: solid 2px;" />

				<!-- Content -->
				<section style="padding-top: 0px;">
					<header class="main" id="content">
						<h3>${storege.title}</h3>
						<p style="margin-bottom: 5px;color: black;font-size: 17px;">
							<span style="margin-right: 15px;"> ${storege.id} </span> <span>
								${storege.date} </span> <span style="float: right;">
								${storege.click} </span>
						</p>
					</header>
					<hr class="major" style="margin-top: 5px; margin-bottom: 30px;" />

					<!-- Blockquote 내용 칸 -->
					<p style="margin-bottom: 50px;color: black;">${storege.content}
					</p>


					<!-- 전체 댓글 -->
					<header class="main" id="content">
						<h5 style="margin-bottom: 10px;">전체 댓글</h5>
					</header>
					<hr class="major"
						style="margin-top: 5px; margin-bottom: 30px; border-bottom: solid 2px;" />


					<!-- Break 댓글 조회 -->

					<c:forEach var="boardComent" items="${boardComent}"
						varStatus="status">
						<div class="row">
							<ul class="4u 12u$(medium)">
								<li style="list-style: none;width: 1160px;color: black;" id="comentids"><p
										style="width: 150px; text-align: left; display: inline-block;"
										class="USERID${status.index}">${boardComent.id}</p>
									<p class="${status.index}"
										style="width: 760px; text-align: left; display: inline-block;">${boardComent.coments}</p>
									<p
										style="width: 150px; text-align: right; display: inline-block; font-size: 13px;">${boardComent.date}</p>
									<p
										style="width: 30px; text-align: right; display: inline-block; font-size: 13px;"
										id="${status.index}"></p></li>
							</ul>
							<%-- <span class="4u 12u$(medium)"> ${boardComent.id} </span> <span
								class="4u 12u$(medium) ${status.index}">${boardComent.coments}</span>
							<span class="4u$ 12u$(medium)"> ${boardComent.date} </span> --%>

							<!-- 드롭다운-->
							<!-- <img src="/resources/assets/img/down-arrow1.png"
										style="width: 25px;"> -->
							<span class="dropdown">
								<button class="dropbtn">
									<img src="/resources/assets/img/down-arrow1.png"
										style="width: 25px;">
								</button>
								<div class="dropdown-content">
									<c:choose>
										<c:when test="${user==null && Kakao == null && Naver == null}">
											<span onclick="comentEmotion(`${status.index}`)">분석하기</span>
										</c:when>
										<c:otherwise>
											<span onclick="comentEmotion(`${status.index}`)">분석하기</span>
											<br>
											<span class="deleteComent${status.index}"
												onclick="ComentDelete(`${boardComent.c_index}`)"></span>
										</c:otherwise>
									</c:choose>
									<!-- <a href="#">신고하기</a> -->
								</div>
							</span>
						</div>
						<hr class="major" style="margin-top: 15px; margin-bottom: 15px;" />
					</c:forEach>





					<hr class="major"
						style="margin-top: 35px; margin-bottom: 20px; border-bottom: solid 2px;" />

					<!-- 댓글작성하기 -->
					<!-- Box -->
					<h5>댓글 쓰기</h5>
					<div class="row uniform">
						<div class="box"
							style="width: 100%; padding-top: 20px; padding-right: 20px; padding-left: 20px; padding-bottom: 15px;">
							<textarea name="demo-name" id="demo-name" placeholder="내용을 입력하세요"
								style="width: 100%; height: 122px; margin-bottom: 20px; resize: none;"></textarea>
							<!-- 업로드버튼 -->
							<ul class="actions small">
								<li><button class="button small"
										onclick="coment(${storege.s_index})">댓글 달기</button></li>
							</ul>
						</div>
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
						<h2>메뉴</h2>
					</header>
					<ul>
						<li><span class="opener">커뮤니티</span>
							<ul>
								<li><a href="community.do">게시판</a></li>
								<li><a href="news.do">뉴스</a></li>
								<li><a href="chatting.do">채팅</a></li>
								<li><a href="map.do">가까운 복지관 찾기</a></li>
							</ul></li>
						<li><a href="mypage.do">프로필</a></li>
						<li><a href="sendFeedback.do">의견 보내기</a></li>
						<li><a href="socket">그룹 채팅</a></li>
					</ul>
				</nav>

			</div>
		</div>
	</div>
	<!-- Scripts -->
	<script src="/resources/assets/js/jquery.min.js"></script>
	<script src="/resources/assets/js/browser.min.js"></script>
	<script src="/resources/assets/js/breakpoints.min.js"></script>
	<script src="/resources/assets/js/jquery.dropotron.min.js"></script>
	<script src="/resources/assets/js/util.js"></script>
	<script src="/resources/assets/js/main.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>




	<script type="text/javascript">
		function board(s_index) {
			location.href = "board.do?s_index=" + s_index
		}
	</script>
	<script type="text/javascript">
		function coment(s_index) {
			console.log(s_index)
			var coments = $('#demo-name').val()
			console.log(coments)
			var id = `${user.id}`
			console.log(id)
			if(id==''){
				swal({
					icon: 'warning',                  
					 title: '로그인이 필요합니다.',    
					 text: '', 
					 button: '확인'
				})
			}else{
				if(coments==''){
					swal({
						  icon: 'warning',                  
						  title: '내용을 입력해주세요'
						})
				}else{
			$.ajax({
				url : "coment.do",
				type : "POST",
				data : {
					storege_id : s_index,
					coments : coments,
					id : id
				},
				success : function(res) {
					swal({
						icon: 'success',                  
						 title: '댓글 작성이 완료되었습니다.',    
						 text: '', 
						 button: '확인'
					}).then(result=>{
					console.log(res)
					window.location.reload();
					})

				},
				error : function(e) {
					console.log(e)
				}
			})
				}
			}
		}
	</script>
	<script type="text/javascript">
	function comentEmotion(index){
		console.log(index)
		var coment = $('.'+index).text()
		console.log(coment)
		$.ajax({
			url:"http://f267-35-223-192-20.ngrok.io/coment",
			data:{
				'coment':coment
			},
			headers:{
				"ngrok-skip-browser-warning":"12345",
			},
			dataType:'text',
			type:"GET",
			success:function(res){
				console.log(res)
				$('#'+index).append(res)
				
			},
			error:function(e){
				console.log(e)
			}
		})
	}
	</script>
	<script type="text/javascript">
	<!--페이지가 로드되면 해당 함수를 실행한다-->
	window.onload = function comentId(){
	<!-- 콘텐츠 페이지의 전체 댓글 개수-->
	var size = `${size}`
	<!-- 로그인한 유저의 정보-->
	var userid = `${user.id}`
	<!-- 댓글에 있는 유저 아이디를 저장하기 위한 배열 선언-->
	var comentArr = new Array()
	<!-- 반목문 실행-->
	for(var i=0; i<size;i++){
	<!-- Status.index로 댓글에 있는 유저아이디 클래스 구분한 아이디 값 추출-->
	var comentId = $('p.USERID'+i).text()
	<!-- 배열 마지막열에 해당 값 추가-->
	comentArr.push(comentId)	
	}
	<!-- 반복문종료 -->
	
	<!-- 반복문실행 -->
	for(var i=0; i<comentArr.length;i++){
	<!-- 유저 아이디와 배열에 있는 아이디 같다면 조건물 실행-->
		if(comentArr[i]==userid){
	<!-- 해당 아이디의 태그값에 삭제하기 삽입-->
			$('.deleteComent'+i).html('삭제하기')
			
		}
	  }
	}  
	
	<!-- 댓글 지우기 -->
	function ComentDelete(index){
		console.log(index)
		$.ajax({
			url:"ComentDelete.do",
			data:{
				c_index:index
			},
			type:"GET",
			success:function(res){
				if(res>0){
					swal({
						  icon: 'success',                  
						  title: '댓글이 삭제되었습니다.'
						}).then(result=>{
							location.reload()
						})
				
				}else{
					swal('관리자에게 문의하세요.','','warning')
				}
			},
			error:function(e){
				swal('관리자에게 문의하세요.','','warning')
				console.log(e)
			}
		})
	}
	
	</script>


</body>
</html>