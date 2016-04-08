package com.estsoft.mysite.web.action.board;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	private static final int row_Size = 5;
	private static final int page_Size=3;

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Default Action execute");
		String wannaSearch = (String) request.getParameter("kwd");
		BoardDao dao = new BoardDao( new MySQLWebDBConnection( ));

		String page = request.getParameter("page");
		List<BoardVo> list = null;
		if ( wannaSearch == null ) {
			wannaSearch = "";
		}
		
		int totalBoards = dao.getSearchedCount(wannaSearch);
		int currentPage = 1;
		if( page != null && WebUtil.isNumeric( page ) ) {
			currentPage = Integer.parseInt(page);
		}
		int totalPage = (int)Math.ceil( (double) totalBoards / row_Size);
		if( currentPage < 1 || currentPage > totalPage ) {
			currentPage = 1;
		}
		int firstPage = (int)(Math.ceil( (double) currentPage/ page_Size) -1) * page_Size + 1;
		if (firstPage < 0) {
			firstPage = 1;
		}
		int lastPage = firstPage + page_Size - 1;
		if ( totalPage < lastPage ) {
			lastPage = totalPage;
		}
		int prevPage = 0;
		if ( firstPage > page_Size ) {
			prevPage = firstPage-1;
		}
		int nextPage = 0;
		if ( lastPage < totalPage ) {
			nextPage = lastPage + 1;
		}
		list = dao.getSearchedPagingList(wannaSearch, currentPage, row_Size);

		Map<String, Object> map = new HashMap<String, Object>( );
		map.put("rowSize", row_Size);
		map.put("pageSize", page_Size);
		map.put("wannaSearch", wannaSearch);
		map.put("totalBoards", totalBoards);
		map.put("currentPage", currentPage);
		map.put("firstPage", firstPage);
		map.put("lastPage", lastPage);
		map.put("prevPage", prevPage);
		map.put("nextPage", nextPage);
		map.put("list", list);
		
		request.setAttribute("map", map);
		WebUtil.forward(request, response, "/WEB-INF/views/board/list.jsp");

	}

}
