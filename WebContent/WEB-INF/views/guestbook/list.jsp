<%@page import="com.estsoft.mysite.vo.GuestBookVo"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
		List<GuestBookVo> list = (List<GuestBookVo>)request.getAttribute("list");
		int count = list.size();
		pageContext.setAttribute("newline", "\r\n");
%>
<!doctype html>
<html>
<head>
<title>mysite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="/mysite/assets/css/guestbook.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="container">	
		<c:import url="/WEB-INF/views/include/header.jsp"/>
		<div id="content">
			<div id="guestbook">
				<form action="/mysite/guest" method="post">
					<input type="hidden" name="a" value="insert">
					<table>
						<tr>
							<td>이름</td><td><input type="text" name="name"></td>
							<td>비밀번호</td><td><input type="password" name="password"></td>
						</tr>
						<tr>
							<td colspan=4><textarea name="message" id="content"></textarea></td>
						</tr>
						<tr>
							<td colspan=4 align=right><input type="submit" VALUE=" 확인 "></td>
						</tr>
					</table>
				</form>
				<ul>
					<li>
					<c:forEach items="${list }" var="vo" varStatus="status">
					<c:set var="count" value="${fn:length(list) }"/>
						<table>
							<tr>
								<td>[${count - status.index}]</td>
								<td>${vo.name }</td>
								<td>${vo.regDate }</td>
								<td><a href="/mysite/guest?a=deleteform&no=${vo.no }">삭제</a></td>
							</tr>
							<tr>
								<td colspan=4>
								${fn:replace(vo.message, newline, "<br>") }		
								</td>
							</tr>
						</table>
						</c:forEach>
						<br>
					</li>
				</ul>
			</div>
		</div>
		<c:import url="/WEB-INF/views/include/navigation.jsp"/>
		<c:import url="/WEB-INF/views/include/footer.jsp"/>
	</div>
</body>
</html>