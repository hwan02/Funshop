package com.encore.funshop.actions;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.encore.funshop.dao.MyPageDAO;
import com.encore.funshop.vo.Asking;

public class AskingAction extends Action{
	private final String admin_id = "admin";
	
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		MyPageDAO dao = new MyPageDAO();
		String action = request.getParameter("action");
		String member_id = request.getParameter("member_id");
		if(action == null ) action = "list";
		
		if(action.equals("insert")) {
			String asking_content = request.getParameter("asking_content");
			dao.insertAsking(member_id, asking_content); //입력실패의 경우에도 다른 동작하지 않음
			return null;
		} else { //if(action.equals("list")) {
			//채팅리스트출력
			List<Asking> list = dao.selectAsking(member_id, admin_id);
			request.setAttribute("list", list);
			return mapping.findForward("list");
		}
	}
}
