package com.estsoft.mysite.web.action.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.estsoft.db.MySQLWebDBConnection;
import com.estsoft.mysite.dao.BoardDao;
import com.estsoft.mysite.vo.BoardVo;
import com.estsoft.mysite.vo.UserVo;
import com.estsoft.web.WebUtil;
import com.estsoft.web.action.Action;

public class ReplyFormAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		if (session == null ) {
			WebUtil.redirect(request, response, "/mysite/main");
			return;
		}		
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		if (authUser == null) {
			WebUtil.redirect(request, response, "/mysite/main");
		}
		Long no = Long.parseLong(request.getParameter("no"));
		BoardDao dao = new BoardDao( new MySQLWebDBConnection( ));
		BoardVo boardVo = dao.getBoard(no);
		//답글이 달릴 vo
		request.setAttribute("boardVo", boardVo);
		WebUtil.forward(request, response, "WEB-INF/views/board/reply.jsp");
	}
}
