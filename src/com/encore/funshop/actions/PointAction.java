package com.encore.funshop.actions;

import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.encore.funshop.dao.MyPageDAO;

public class PointAction extends Action{
	private final int PERIOD = 365; //포인트 유효기간(일 단위)
	
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String memeber_id = (String) request.getSession().getAttribute("member_id");
		MyPageDAO dao = new MyPageDAO();
		Calendar startCal = Calendar.getInstance();
		Calendar endCal = Calendar.getInstance();
		startCal.add(Calendar.YEAR, -1);
		request.setAttribute("validPoint", dao.selectTotalPoint(memeber_id, startCal.getTime(), endCal.getTime()));
		endCal.add(Calendar.YEAR, -1);
		endCal.add(Calendar.MONTH, 1);
		request.setAttribute("warningPoint", dao.selectTotalPoint(memeber_id, startCal.getTime(), endCal.getTime()));
		
		return mapping.findForward("result");
	}
}
