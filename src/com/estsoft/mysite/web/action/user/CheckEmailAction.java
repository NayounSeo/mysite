package com.estsoft.mysite.web.action.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.estsoft.db.MySQLWebDBConnection;
import com.estsoft.mysite.dao.UserDao;
import com.estsoft.mysite.vo.UserVo;
import com.estsoft.web.action.Action;

import net.sf.json.JSONObject;

public class CheckEmailAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=UTF-8");
		//protocol
		/*
		 *  { result : "success" or "fail",
		 *    message: 실패한 경우에만 어떤 fail이 났는지 기록.
		 *    data: 통신 데이터
		 *   }
		 *   
		 *   통신이 성공한 경우
		 *   { result: "success", data:true } -> 이메일을 사용할 수 있는 경우
		 *   { reuslt: "success", data:false} -> 이메일을 사용할 수 없는 경우
		 */
		String email = request.getParameter("email");
		UserDao dao  = new UserDao( new MySQLWebDBConnection( ));
		UserVo vo = dao.get( email );
		System.out.println("check email action에서의 vo : " + vo );
		Map<String, Object> map = new HashMap<String, Object>( );
		map.put("result", "success");
		map.put("data", vo == null);
		
		//리다이렉트 해주기 전에 먼저 창을 띄워 점검하는 습관!
		PrintWriter out = response.getWriter( );
		JSONObject jsonObject = JSONObject.fromObject(map);
		out.println(jsonObject.toString( ));
/*		String jsonString = ("{ \"name\" : \"서나윤\", \"email\" : \"parpe94@naver.com\" }");
		out.println(jsonString);*/

	}

}
