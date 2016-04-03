<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
			
				<!--  아직 다 비어있다!! -->
				<form id="search_form" action="" method="post">
					<input type="text" id="kwd" name="kwd" value="">
					<input type="submit" value="찾기">
				</form>
				<!--  아직 다 비어있다!! -->
				
				<table class="tbl-ex">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>조회수</th>
						<th>작성일</th>
						<th>&nbsp;</th>
					</tr>				
					<tr>
						<td>3</td>
						
						<!--  아직 비어있다 -->
						<td><a href="">세 번째 글입니다.</a></td>
						<!--  아직 비어있다 -->
						
						<td>서나윤</td>
						<td>3</td>
						<td>2016-03-30 12:04:20</td>
						
						<!--  아직 비어있다 -->
						<td><a href="" class="del">삭제</a></td>
						<!--  아직 비어있다 -->
						
					</tr>
					<tr>
						<td>2</td>
						
						<!--  아직 비어있다 -->
						<td><a href="">두 번째 글입니다.</a></td>
						<!--  아직 비어있다 -->
						
						<td>서나윤</td>
						<td>3</td>
						<td>2016-03-30 12:04:12</td>
						
						<!--  아직 비어있다 -->
						<td><a href="" class="del">삭제</a></td>
						<!--  아직 비어있다 -->
						
					</tr>
					<tr>
						<td>1</td>
						
						<!--  아직 비어있다 -->
						<td><a href="">첫 번째 글입니다.</a></td>
						<!--  아직 비어있다 -->
						
						<td>서나윤</td>
						<td>3</td>
						<td>2015-09-25 07:24:32</td>
						
						<!--  아직 비어있다 -->
						<td><a href="" class="del">삭제</a></td>
						<!--  아직 비어있다 -->
						
					</tr>
				</table>
				
				<!--  아직 비어있다 -->
				<div class="bottom">
					<a href="" id="new-book">글쓰기</a>
				</div>
				<!--  아직 비어있다 -->
				
			</div>
		</div>
		
		<jsp:include page="/WEB-INF/views/include/navigation.jsp"></jsp:include>
		<!--  다른 곳의 navigation 부분도 알아서 해보자.  -->
		
		<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
		
	</div>
</body>
</html>