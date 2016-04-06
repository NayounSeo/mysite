<%@page import="com.estsoft.mysite.vo.GuestBookVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
		List<GuestBookVo> list = (List<GuestBookVo>)request.getAttribute("list");
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
		<jsp:include page="/WEB-INF/views/include/header.jsp"/>	
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
					<%
							int count=list.size();
							for( GuestBookVo vo : list) {
					%>
						<table>
							<tr>
								<td>[<%=count%>]</td>
								<td><%=vo.getName()%></td>
								<td><%=vo.getRegDate() %></td>
								<td><a href="/mysite/guest?a=deleteform&no=<%=vo.getNo()%>">삭제</a></td>
							</tr>
							<tr>
								<td colspan=4>
								<%=vo.getMessage().replaceAll("\r\n", "<br>") %>				
								</td>
							</tr>
						</table>
						<%
							count--;
							}
						%>
						<br>
					</li>
				</ul>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/include/navigation.jsp"/>
		<jsp:include page="/WEB-INF/views/include/footer.jsp"/>	
	</div>
</body>
</html>