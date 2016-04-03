package com.estsoft.mysite.web.action.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.estsoft.web.WebUtil;
import com.estsoft.web.action.Action;

public class JoinSuccessAction implements Action {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Join Success Action execute");
		WebUtil.forward(request, response, "/WEB-INF/views/user/joinsuccess.jsp");
	}

}
