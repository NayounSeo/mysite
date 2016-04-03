<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>mysite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="/mysite/assets/css/board.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="container">		
		<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
		<div id="content">
			<div id="board">
			
				<!--  아직 비어있다 -->
				<form class="board-form" method="post" action="">
				<!--  아직 비어있다 -->
				
					<table class="tbl-ex">
						<tr>
							<th colspan="2">글수정</th>
						</tr>
						<tr>
							<td class="label">제목</td>
							
							<!--  아직 비어있다 -->
							<td><input type="text" name="title" value=""></td>
							<!--  아직 비어있다 -->
							
						</tr>
						<tr>
							<td class="label">내용</td>
							<td>
								<textarea id="content" name="content">수정해야 할 글은 고대로 
이렇게 textarea에 뿌려야 합니다.
개행문자 변경도 하지마세요.
하하하하하
즐건 코딩 되세요~~~~</textarea>
							</td>
						</tr>
					</table>
					<div class="bottom">
					
						<!--  아직 비어있다 -->
						<a href="">취소</a>
						<!--  아직 비어있다 -->
						
						<input type="submit" value="수정">
					</div>
				</form>				
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/include/navigation.jsp"></jsp:include>
		<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	</div>
</body>
</html>