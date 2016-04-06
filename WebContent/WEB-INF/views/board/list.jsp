<%@page import="com.estsoft.mysite.vo.UserVo"%>
<%@page import="com.estsoft.mysite.vo.BoardVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		List<BoardVo> list = (List<BoardVo>)request.getAttribute("boardList");
		int length = list.size();
		int index = 0;
%>
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
				
				<form id="search_form" action="/mysite/board" method="post">
					<input type="text" id="kwd" name="kwd" value="">
					<input type="submit" value="찾기">
				</form>	
				
				<table class="tbl-ex">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>조회수</th>
						<th>작성일</th>
						<th>&nbsp;</th>
					</tr>				
					<%
						for (BoardVo vo : list) {
					%>
							<tr>
							<td>[<%=length - index%>]</td>
							<td style="text-align:left; padding-left:${vo.depth*20}px"><a href="/mysite/board?a=view&no=<%=vo.getNo()%>">
							<%
								if ( vo.getDepth() > 0 ) {
									for (int i=0; i<vo.getDepth(); i++) { 
							%>
										<img src="/mysite/assets/images/replyVector.png">
							<%
								 	}
								} 
							%>
							  
							<%=vo.getTitle() %></a></td>
							<!--  이름은 JOIN으로 넣어줘야 하나?! ㅜㅠㅜㅠ 그러고보니까 여기는 어떻게 하지-->
							<td><%=vo.getUserNo()%></td>
							<td><%=vo.getViews()%></td>
							<td><%=vo.getRegDate() %></td>
							<%
								if ( authUser != null && authUser.getNo() == vo.getUserNo()) {
							%>
								<td><a href="/mysite/board?a=delete&no=<%=vo.getNo() %>&userNo=<%=vo.getUserNo()%>" class="del">삭제</a></td>
							<%
								} else {
							%>
								<td><img src="/mysite/assets/images/recycle_non.png"></td>
							<%
								}
								index++;
							}
					%>
						</tr>
				</table>
				<%
					if ( authUser != null ) { 
				%>
				<div class="bottom">
<!-- 				와 개바보였네 ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ	
					</a href="/WEB-INF/views/board?a=insert" id="new-book">글쓰기<//a> -->
					<a href="/mysite/board?a=insert" id="new-book">글쓰기</a>
				</div>
				<%
					}
				%>				
			</div>
		</div>		
		<jsp:include page="/WEB-INF/views/include/navigation.jsp"></jsp:include>
		<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>		
	</div>
</body>
</html>