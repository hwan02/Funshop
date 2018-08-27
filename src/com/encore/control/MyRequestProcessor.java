package com.encore.control;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.RequestProcessor;
import org.apache.struts.tiles.TilesRequestProcessor;

//모든 Action, ActionForm보다 먼저 호출됨
public class MyRequestProcessor extends TilesRequestProcessor { //extends RequestProcessor {
	@Override
	protected boolean processPreprocess(HttpServletRequest request, HttpServletResponse response) {
		//System.out.println("MyRequestProcessor processPreprocess()");
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return super.processPreprocess(request, response);
	};
}
