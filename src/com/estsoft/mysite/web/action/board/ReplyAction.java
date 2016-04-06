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

public class ReplyAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if( session == null ) {
			WebUtil.redirect(request, response, request.getContextPath() + "/board");
			return;
		}
		UserVo authUser = (UserVo)session.getAttribute( "authUser" );
		if( authUser == null ) {
			WebUtil.redirect(request, response, request.getContextPath() + "/board");
			return;
		}
		
		Long userNo = Long.parseLong(request.getParameter("userNo"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int groupNo = Integer.parseInt(request.getParameter("groupNo") );
		int orderNo = Integer.parseInt(request.getParameter("orderNo"));
		int depth = Integer.parseInt(request.getParameter("depth") );
		
		BoardVo vo = new BoardVo();
		vo.setUserNo(userNo);
		vo.setTitle(title);
		vo.setContent(content);
		vo.setGroupNo(groupNo);
		vo.setOrderNo(orderNo+1);
		vo.setDepth(depth+1);

		BoardDao dao = new BoardDao(new MySQLWebDBConnection());
		dao.setNewOrder(vo);
		dao.insert1(vo);
		WebUtil.redirect(request, response, "/mysite/board");
	}

}
