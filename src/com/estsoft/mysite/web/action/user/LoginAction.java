package com.estsoft.mysite.web.action.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.estsoft.db.MySQLWebDBConnection;
import com.estsoft.mysite.dao.UserDao;
import com.estsoft.mysite.vo.UserVo;
import com.estsoft.web.WebUtil;
import com.estsoft.web.action.Action;
import com.mysql.jdbc.authentication.MysqlClearPasswordPlugin;

public class LoginAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Login Success Action execute");
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		UserVo vo = new UserVo();
		vo.setEmail(email);
		vo.setPassword(password);
		
		UserDao dao = new UserDao( new MySQLWebDBConnection() );
		UserVo authUser = dao.get(vo);
		
		//잘못된 로그인을 확인하기 위해 시범삼아 콘솔에 찍어보자.
//		System.out.println(authUser != null);
		if ( authUser == null) {
			//비밀번호나 이메일이 틀렸을때 --> 다시 로그인 하러 가야지!
			//실패했을 때를 알려주기 위해 result parameter 추가!!
			WebUtil.redirect(request, response, "/mysite/user?a=loginform&result=fail");
			//로그인 실패 페이지를 따로 만들어주었을 경우
//			WebUtil.forward(request, response, "/mysite/user?a=loginfail");
			return;
		}
		
		// 인증 성공 (로그인)
		HttpSession session = request.getSession( true );
		session.setAttribute("authUser", authUser);
		WebUtil.redirect(request, response, "/mysite/main");
		
		
//		WebUtil.forward(request, response, "/WEB-INF/views/user/joinsuccess.jsp");

	}

}
