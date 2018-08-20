package com.funshop.admin.actions;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.funshop.admin.dao.SalesDAO;
import com.funshop.admin.vo.SalesVO;

public class Sales_Action extends Action{
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String action = request.getParameter("action");
		System.out.println("Sales액션>>>"+action);
		
		SalesDAO dao = new SalesDAO();
		Map<String, Object> map = new HashMap<>();
		
		ActionForward forward = null;
		if(action == null || action.equals("list")) {
			List<SalesVO> list = dao.selectAll(map);
			request.setAttribute("list", list);
			forward = mapping.findForward("list");
		}
		return forward;
	}
}
