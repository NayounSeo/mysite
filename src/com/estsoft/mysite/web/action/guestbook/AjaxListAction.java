package com.estsoft.mysite.web.action.guestbook;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.estsoft.db.MySQLWebDBConnection;
import com.estsoft.mysite.dao.GuestBookDao;
import com.estsoft.mysite.vo.GuestBookVo;
import com.estsoft.web.action.Action;

import net.sf.json.JSONObject;

public class AjaxListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//0419 오늘이 request.getParameter 쓰는 마지막 날이라고....ㅋㅋㅋㅋㅋㅋ
		String page = request.getParameter("p");
		
		GuestBookDao dao = new GuestBookDao( new MySQLWebDBConnection( ) );
		List<GuestBookVo> list = dao.getList(Integer.parseInt( page ) );
		
		Map<String, Object> map = new HashMap<String, Object>( );
		map.put("result", "success");
		map.put("data", list);
		//JSON Object로 바꿔준다!
		JSONObject jsonObject = JSONObject.fromObject(map);
		response.setContentType("application/json; charset=UTF-8");
		response.getWriter( ).print(jsonObject);
	}

}
