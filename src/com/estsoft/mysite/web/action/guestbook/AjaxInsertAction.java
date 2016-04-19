package com.estsoft.mysite.web.action.guestbook;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.estsoft.db.MySQLWebDBConnection;
import com.estsoft.mysite.dao.GuestBookDao;
import com.estsoft.mysite.vo.GuestBookVo;
import com.estsoft.web.action.Action;

import net.sf.json.JSONObject;

public class AjaxInsertAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String name = request.getParameter("name");
		 String password = request.getParameter("password");
		 String message = request.getParameter("message");
		GuestBookVo vo =  new GuestBookVo( );
		 vo.setName(name);
		 vo.setPasswd(password);
		 vo.setMessage(message);
		 
		GuestBookDao dao  = new GuestBookDao(new MySQLWebDBConnection( ) );
		Long no = dao.insert(vo);
		vo = dao.get(no);
		System.out.println(vo);
		Map<String, Object> map = new HashMap<String, Object>( );
		map.put("result", "success");
		map.put("data", vo);
		
		//JSON Object로 바꿔준다!
		JSONObject jsonObject = JSONObject.fromObject(map);
		response.setContentType("application/json; charset=UTF-8");
		response.getWriter( ).print(jsonObject);

	}

}
