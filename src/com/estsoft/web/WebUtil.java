package com.estsoft.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WebUtil {
	public static void redirect( HttpServletRequest request,  HttpServletResponse response, String path ) throws ServletException, IOException {
		response.sendRedirect( path  );
	}
	
	public static void forward( HttpServletRequest request, HttpServletResponse response, String url) throws ServletException, IOException{
		RequestDispatcher rd = request.getRequestDispatcher(  url  );
		rd.forward( request, response );		
	}
	
	public static boolean isNumeric( String value ) {
		return value != null && value.matches( "[-+]?\\d*\\.?\\d+" );  
	}
}
