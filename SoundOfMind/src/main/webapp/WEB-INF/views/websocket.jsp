<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마음의 소리</title>
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<link rel="stylesheet" href="/resources/assets/css/websocket.css" />

<style type="text/css">
#header {
	border-bottom: solid 0px !important;
}
</style>
</head>
<body>

	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Main -->
		<div id="main">
			<div class="inner">
				<!-- Header -->
				<header id="header">
					<a href="index.do" class="logo"><strong>Sound</strong> of Mind
					</a>
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
				<div class="page-content page-container" id="page-content">
					<div class="card-header"
						style="background-color: #6495ED; padding-top: 5px; padding-left: 5px; padding-bottom: 5px; padding-right: 15px;">
						<img src="/resources/assets/img/hundred1.png"
							style="width: 150px;"> <br>
						<!-- disconnection 버튼 -->
						<input class="btn btn-xs btn-secondary" data-abc="true"
							style="background-color: white; border-radius: 3px; padding-left: 12px; padding-right: 12px;"
							onclick="disconnectButton_onclick()" id="disconnectButton"
							value="연결종료" type="button">
					</div>
					<textarea name="demo-name" id="chatBoxArea" readonly="readonly"
						style="width: 100%; height: 450px; margin-bottom: 5px; resize: none;"></textarea>

					<div class="publisher bt-1 border-light"
						style="background-color: #6495ED; border-radius: 3px;">
						<!-- 메세지 입력하는 곳 -->
						<input class="publisher-input" type="text" id="inputMsgBox"
							style="color: black;" placeholder="메세지를 입력하세요."
							onkeypress="inputMsgBox_onkeypress()">

						<!-- 전송버튼 -->
						<a class="publisher-btn text-info" data-abc="true"> <img
							src="/resources/assets/img/send7.png"
							style="width: 100%; height: 40px;" onclick="sendButton_onclick()"
							id="sendButton">
						</a>
						<!-- 전송버튼 end -->

					</div>
				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript">
 		var wsURL = null;
 		window.onload = function(){
 			wsURL = new WebSocket("ws://127.0.0.1:8085/websocket")
 		
		<!-- 접속-->
		 wsURL.onopen = function(message){
			addLineToChatBox("Sever is connected")
		} 
		<!--메세지 수신 하는경우 -->
		wsURL.onmessage = function(message){
			addLineToChatBox(message.data)
		}
		<!-- 접속 해제-->
		wsURL.onclose = function(message){
			addLineToChatBox("Sever is disconnected")
		}
		<!-- 에러 발생 -->
		wsURL.onerror = function(message){
			addLineToChatBox("Error")
		 }
 		}
		<!--채팅 영역 내용 한줄 추가 -->
		function addLineToChatBox(_line){
			if(_line == null){
				_line ='';
			}
			var chatBoxArea = document.getElementById('chatBoxArea');
		    chatBoxArea.value += _line + "\n";
		    chatBoxArea.scrollTop = chatBoxArea.scrollHeight;    
		}
		function sendButton_onclick() {
		    var inputMsgBox = document.getElementById('inputMsgBox');
		    if (inputMsgBox == null || inputMsgBox.value == null || inputMsgBox.value.length == 0) {
		        return false;
		    }
		    
		    var chatBoxArea = document.getElementById('chatBoxArea');
		    
		    if (wsURL == null || wsURL.readyState == 3) {
		        chatBoxArea.value += 'Server is disconnected.\n';
		        return false;
		    }
		    <!-- 서버로 메시지 전송-->
		   
		    wsURL.send(inputMsgBox.value);
		    inputMsgBox.value = '';
		    inputMsgBox.focus();
		    
		    return true;
		}

		<!-- 서버로 메시지 전송 -->
		function disconnectButton_onclick() {
		    if (wsURL != null) {
		    	wsURL.close();    
		    }
		}

		<!-- 입력하는경우 호출 -->
		function inputMsgBox_onkeypress() {
		    if (event == null) {
		        return false;
		    }
		    
		    <!-- 엔터키 누를시 호출 -->
		    var keyCode = event.keyCode || event.which;
		    if (keyCode == 13) {
		        sendButton_onclick();
		    }
		}
	</script>
</body>
</html>