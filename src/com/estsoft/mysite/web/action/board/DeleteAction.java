package com.estsoft.mysite.web.action.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.estsoft.db.MySQLWebDBConnection;
import com.estsoft.mysite.dao.BoardDao;
import com.estsoft.mysite.vo.BoardVo;
import com.estsoft.web.action.Action;

public class DeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Delete Action Execute");
		Long no = Long.parseLong(request.getParameter("no"));
		Long userNo = Long.parseLong(request.getParameter("userNo"));

		BoardVo vo = new BoardVo();
		vo.setNo(no);
		vo.setUserNo(userNo);

		BoardDao dao = new BoardDao(new MySQLWebDBConnection());
		dao.delete(vo);

		response.sendRedirect("/mysite/board");

	}

}
