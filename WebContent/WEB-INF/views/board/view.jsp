<%@page import="com.estsoft.db.MySQLWebDBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.estsoft.mysite.vo.BoardVo" %>
<%@ page import="com.estsoft.mysite.vo.UserVo" %>
<%@ page import="com.estsoft.mysite.dao.BoardDao" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	BoardVo vo = (BoardVo)request.getAttribute("boardVo");
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
		<c:import url="/WEB-INF/views/include/header.jsp"/>
		<div id="content">
			<div id="board" class="board-form">
			<input type="hidden" name="no" value="${boardVo.no }">
				<table class="tbl-ex">
					<tr>
						<th colspan="2">[${boardVo.no }]</th>
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
					<c:choose>
						<c:when test="${ not empty authUser && authUser.no == vo.userNo}">
							<a href="/mysite/board?a=modifyform&no=${boardVo.no }">글수정</a>
						</c:when>
						<c:when test="${ not empty authUser }">
							<a href="/mysite/board?a=replyform&no=<%=vo.getNo()%>">답글</a>
						</c:when>
					</c:choose>
				</div>				
			</div>
		</div>		
		<c:import url="/WEB-INF/views/include/navigation.jsp"/>
		<c:import url="/WEB-INF/views/include/footer.jsp"/>	
	</div>
</body>
</html>