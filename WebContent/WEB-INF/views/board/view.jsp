<%@page import="com.estsoft.db.MySQLWebDBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.estsoft.mysite.vo.BoardVo" %>
<%@ page import="com.estsoft.mysite.vo.UserVo" %>
<%@ page import="com.estsoft.mysite.dao.BoardDao" %>
<%
	BoardVo vo = (BoardVo)request.getAttribute("boardVo");
	UserVo authUser = (UserVo)session.getAttribute("authUser");
	BoardDao dao = new BoardDao( new MySQLWebDBConnection( ));
	dao.plusView(vo.getNo( ));
%>
<!DOCTYPE html>
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
			<div id="board" class="board-form">
			<input type="hidden" name="no" value="<%=vo.getNo()%>">
				<table class="tbl-ex">
					<tr>
						<th colspan="2">[<%=vo.getNo() %>]</th>
					</tr>
					<tr>
						<td class="label">제목</td>
						<td><%=vo.getTitle() %></td>
					</tr>
					<tr>
						<td class="label">내용</td>
						<td>
							<div class="view-content">
								<%=vo.getContent().replaceAll("\r\n", "<br>")  %>
							</div>
						</td>
					</tr>
				</table>
				
				<div class="bottom">
					<a href="/mysite/board">글목록</a>
					<%
						if ( authUser != null && authUser.getNo() == vo.getUserNo()) {
					%>
							<a href="/mysite/board?a=modifyform&no=<%=vo.getNo()%>">글수정</a>
					<%
						}
						if (authUser != null) {
					%>
					<a href="/mysite/board?a=replyform&no=<%=vo.getNo()%>">답글</a>
					<%
						}
					%>
				</div>
				
			</div>
		</div>		
		<jsp:include page="/WEB-INF/views/include/navigation.jsp"/>
		<jsp:include page="/WEB-INF/views/include/footer.jsp"/>	
	</div>
</body>
</html>