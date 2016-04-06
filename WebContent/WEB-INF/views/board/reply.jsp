<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.estsoft.mysite.vo.UserVo" %>
<%@ page import="com.estsoft.mysite.vo.BoardVo" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	UserVo authUser = (UserVo)session.getAttribute("authUser");
	BoardVo vo = (BoardVo)request.getAttribute("boardVo");
	System.out.println("reply.jsp에서의 받아온 vo 정보 "+vo);
%>
<html>
<head>
<title>mysite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="/mysite/assets/css/board.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="container">
		<jsp:include page="/WEB-INF/views/include/header.jsp"/>
		<div id="content">
			<div id="board">
				<form class="board-form" method="post" action="/mysite/board">
				<input type = "hidden" name = "a" value="reply">
				<input type='hidden' name="userNo" value="<%=authUser.getNo()%>">
				<input type='hidden' name="groupNo" value="<%=vo.getGroupNo()%>">		
				<input type='hidden' name="orderNo" value="<%=vo.getOrderNo()%>">		
				<input type='hidden' name="depth" value="<%=vo.getDepth()%>">					
					<table class="tbl-ex">
						<tr>
							<th colspan="2">답글 쓰기</th>
						</tr>
						<tr>
							<td class="label">제목</td>
							<td><input type="text" name="title" value=""></td>							
						</tr>
						<tr>
							<td class="label">내용</td>
							<td>
								<textarea id="content" name="content"></textarea>
							</td>
						</tr>
					</table>
					<div class="bottom">
						<a href="/mysite/board">취소</a>
						<input type="submit" value="등록">
					</div>
				</form>				
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/include/navigation.jsp"></jsp:include>
		<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	</div>
</body>
</html>