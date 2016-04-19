<%@page import="com.estsoft.mysite.vo.GuestBookVo"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<title>mysite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="/mysite/assets/css/guestbook.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/mysite/assets/js/jquery/jquery-1.9.0.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script>
var page=1;
var dialogDelete = null;

var fetchList = function( ) {
	$.ajax({
		url:"/mysite/guest?a=ajax-list&p="+page,
		type:"GET",
		dataType:"json",
		data:"", //데이터는 url로 보냄
		success: function( response ) {
			if( response.result != "success" ) {
				return;
			}
			if ( response.data.length == 0) {
				console.log("end----");
				//$("#btn-next").hide( );
				$("#btn-next").attr("disabled", true);
				return;
			}
			//HTML 생선한 후 UL에 append시켜줘야 한다~
			$.each( response.data, function( index, vo ) {
				//console.log(index + " : " + vo);
				$("#gb-list").append(renderHtml( vo ));
			});
			page++;
		},
		error: function( xhr, status, error ) {
			console.error( status+" : "+error);
		}
	});	
}
var renderHtml = function( vo ) {
	//원래는 대신에 JS TEMPLETE	 Library를 사용한다고 한다. EJS, underscore.js 등 ㅜㅠㅜ
		var html = "<li><table><tr>" +
				"<td>"+vo.name+"</td> "+
				"<td>"+vo.regDate+"</td>"+
				"<td><a href='#' class='a-del' data-no='"+vo.no+"'>삭제</a></td>"+
				"</tr><tr>"+
				"<td colspan='3'>"+vo.message.replace(/\r\n/g, "<br>")+	
				"</td></tr></table>"+
				"<br></li>";				
		//$("#gb-list").append(html)
		return html;
}

$( function( ) {
	$("#form-insert").submit( function(event) {
		event.preventDefault( );
		
		// input & textarea 값 가져오기
		var name = $("#name").val( );
		var password = $("#password").val( );
		var message = $("#message").val( );
		
		console.log(name+" : "+password+" : "+message);
		
		//폼 리셋하기
		//reset( )은 FORMHTMLElement에 있는 함수!
		this.reset( );
		
		//AJAX 통신
		$.ajax({
			url:"/mysite/guest",
			type:"POST",
			dataType:"json",
			data:"a=ajax-insert&name="+name+"&password="+password+"&message="+message, 
			success: function( response ) {
				console.log(response.data);
					$("#gb-list").prepend( renderHtml( response.data ) );
			},
		});
	});

	$(window).scroll( function( ) {
		var documentHeight = $(document).height( );
		var windowHeight = $(window).height( );
		var scrollTop = $(window).scrollTop();
		console.log( documentHeight +" : "+windowHeight+" : "+scrollTop );
		if( documentHeight - ( windowHeight + scrollTop ) < 50) {
			fetchList( );
		}
	})
	
	// 다음 가져오기 버튼 클릭 이벤트 매핑 
	$("#btn-next").on("click", function( ) {
		fetchList( );
	});
	
	//삭제버튼 클릭 이벤트 매핑 (LIVE EVENT)  (미리 이벤트를 매핑하는 것이라고 한다. 기존과 무슨 차이?) 반드시 on을 사용해야
	$(document).on("click", ".a-del", function() {
		event.preventDefault( );
		var no = $(this).attr("data-no");
		$("del-no").val( );

		dialogDelete.dialog("open");
	});

	//dialogDelete 객체 생성
	dialogDelete = $("#dialog-form").dialog({
		autoOpen : false,
		height : 200,
		width : 350,
		//뒤를 못 누르게 하는 modal
		modal : true,
		buttons : {
			"삭제" : function( ){
				var no = $("#del-no").val( );
				var password = $("#del-passwd").val( );
				console.log("clicked "+ no+" : "+ password);
			},
			"취소" : function() {
				dialogDelete.dialog("close");
			}
		},
		close : function() {
		}
	});

	//최초 데이터 가져오기
	fetchList();
});
</script>
</head>
<body>
	<div id="container">	
		<c:import url="/WEB-INF/views/include/header.jsp"/>
		<!--  id=content 겹치니까 이따 message쪽을 바꿔두기 -->
		<div id="content">
			<div id="guestbook">
				<!--  기존  -->
				<!--  <form action="/mysite/guest" method="post"> -->
				<!--  AJAX로 쓰면!! -->
				<form id="form-insert">
					<input type="hidden" name="a" value="insert">
					<table>
						<tr>
							<td>이름</td><td><input type="text" name="name" id="name"></td>
							<td>비밀번호</td><td><input type="password" name="password" id="password"></td>
						</tr>
						<tr>
							<td colspan=4><textarea name="content" id="message"  rows='12' cols='73'></textarea></td>
						</tr>
						<tr>
							<td colspan=4 align=right><input type="submit" VALUE=" 확인 "></td>
						</tr>
					</table>
				</form>
				<ul id="gb-list"></ul>
				<div style='margin-top:20px; text-align:center'>
					<button id='btn-next'>다음 가져오기</button>
				</div>
			</div>
		</div>
		<c:import url="/WEB-INF/views/include/navigation.jsp"/>
		<c:import url="/WEB-INF/views/include/footer.jsp"/>
	</div>
	
	
	<div id="deletedialog" title="삭제 팝업 예제">
  		<p style='line-height:10px;'>다이얼로그예요!</p>
	</div>
	
	<div id="dialog-form" title="게시물 비밀번호 입력">
  		<p class="validateTips" style='line-height:50px; display:none'>방명록 비밀번호를 입력하세요.</p>
  		<form style='margin-top:30px'>
		      <label for="password">password</label>
		      <input type='hidden' id='del-no' value=''>
		      <input type="password" name="password" id="del-passwd" value="" class="text ui-widget-content ui-corner-all">
		      <input type="submit" tabindex="-1" style="position:absolute; top:-1000px">
  		</form>
	</div>
</body>
</html>