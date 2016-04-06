<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html>
<head>
<title>mysite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="/mysite/assets/css/main.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="container">
		<jsp:include page="/WEB-INF/views/include/header.jsp"/>
		<div id="wrapper">
			<div id="content">
				<div id="site-introduction">
					<img id="profile" src="hayeonsoo.png" width=500>
					<h2>안녕하세요. <br>서나윤의 홈에 오신 것을 환영합니다!</h2>
					<p>
						이 사이트는  웹 프로그램밍 실습과제 예제 사이트입니다.<br>
						사이트 소개, 방명록, 게시판등의 메뉴를 구현했습니다.<br>
						JAVA + Database + 웹프로그래밍 수업을 통해
						만든 사이트 입니다.<br><br>
						<a href="/mysite/guest">방명록</a>에 글 남기기<br>
					</p>
				</div>
			</div>
		</div>			
		<jsp:include page="/WEB-INF/views/include/navigation.jsp"/>
		<jsp:include page="/WEB-INF/views/include/footer.jsp"/>	
	</div>
</body>
</html>










