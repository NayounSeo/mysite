<%@page import="com.estsoft.mysite.vo.UserVo"%>
<%@page import="com.estsoft.mysite.vo.BoardVo"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.lang.Object"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

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
				<c:choose>
					<c:when test='${map.wannaSearch == ""}'>
						<input type="text" id="kwd" name="kwd" value="">
					</c:when>
					<c:otherwise>
						<input type="text" id="kwd" name="kwd" value="">
						</c:otherwise>
					</c:choose>
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
					<!--  first Index는 어디 쓰는 걸까... -->
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
							  
							${vo.title }</a></td>
							<!--  이름은 JOIN으로 넣어줘야 하나?! ㅜㅠㅜㅠ 그러고보니까 여기는 어떻게 하지-->
							<td><%=vo.getUserName()%></td>
							<td><%=vo.getViews()%></td>
							<td><%=vo.getRegDate() %></td>
							<%
								if ( authUser != null && authUser.getNo() == vo.getUserNo()) {
							%>
								<td><a href="/mysite/board?a=delete&no=<%=vo.getNo()%>&userNo=<%=vo.getUserNo()%>" class="del">삭제</a></td>
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
				
				<div class="pager">
					<ul>
					<c:if test="${map.prevPage > 0 }">
						<li><a href="/mysite/board?page=${map.prevPage }&kwd=${map.wannaSearch }&">◀</a></li>
					</c:if>
					<c:forEach begin="${map.firstPage }" end="${map.lastPage }" var="page" step="1">
							<c:choose>
								<c:when test="${page == map.currentPage }">
									<li class="selected">${page }</li>
								</c:when>
								<c:otherwise>
								<li><a href="/mysite/board?page=${page }&kwd=${map.wannaSearch }">${page }</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					<c:if test="${map.nextPage > 0 }">
						<li><a href="/mysite/board?page=${map.nextPage }&kwd=${map.wannaSearch }">▶</a></li>		
					</c:if>
					</ul>
				</div>
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