package com.estsoft.mysite.web.action.board;

import java.io.IOException;
import java.util.List;

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

public class DefaultAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Default Action execute");
		
		HttpSession session = request.getSession(true);
		if (session == null ) {
			WebUtil.redirect(request, response, "/mysite/main");
			return;
		}		
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		if (authUser == null) {
			WebUtil.redirect(request, response, "/mysite/main");
		}
		String wannaSearch = (String) request.getParameter("kwd");
		BoardDao dao = new BoardDao( new MySQLWebDBConnection( ));
		
		// 
		
		
		
		
		
		
		
		List<BoardVo> list = null;
		if ( wannaSearch == null ) {
			wannaSearch = "";
		}
		list = dao.getSearchedList(wannaSearch);		
		request.setAttribute("boardList", list);
		WebUtil.forward(request, response, "/WEB-INF/views/board/list.jsp");

	}

}
