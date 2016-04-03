package com.estsoft.mysite.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.estsoft.mysite.web.action.guestbook.GuestActionFactory;
import com.estsoft.web.action.Action;
import com.estsoft.web.action.ActionFactory;

@WebServlet("/guest")
public class GuestBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String actionName = request.getParameter("a");
		ActionFactory actionFactory = new GuestActionFactory();
		Action action = actionFactory.getAction( actionName );
		
		action.execute(request, response);
	}
}
