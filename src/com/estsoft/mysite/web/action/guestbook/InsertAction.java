package com.estsoft.mysite.web.action.guestbook;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.estsoft.db.MySQLWebDBConnection;
import com.estsoft.mysite.dao.GuestBookDao;
import com.estsoft.mysite.vo.GuestBookVo;
import com.estsoft.web.action.Action;

public class InsertAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			 String name = request.getParameter("name");
			 String password = request.getParameter("password");
			 String message = request.getParameter("message");
			 
			 GuestBookVo vo = new GuestBookVo();
			 vo.setName(name);
			 vo.setPasswd(password);
			 vo.setMessage(message);
			 
			 GuestBookDao dao = new GuestBookDao( new MySQLWebDBConnection( ) );
			 dao.insert(vo);
			 response.sendRedirect("/mysite/guest"); 
	}

}
