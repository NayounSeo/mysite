<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="navigation">
			<ul>
<%-- 			<c:choose test="${param.page == 'main' }"> --%>
				<li><a href="/mysite/main">안대혁</a></li>
				<li><a href="/mysite/guest">방명록</a></li>
				<li><a href="/mysite/board">게시판</a></li> 
				<li class="selected"><a href="/mysite/main">안대혁</a></li>
				<li><a href="/mysite/guest">방명록</a></li>
				<li><a href="/mysite/board">게시판</a></li>
			</ul>
		</div>
		
		<!--  오늘의 할 일 -- mysite를 jstl 버전으로 싹 다 바꾸기 -->