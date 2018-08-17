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
		if(action == null ) action = "list";
		//System.out.println(action); //for test
		
		if(action.equals("list")) {
			List<Asking> list = dao.selectAsking(request.getParameter("member_id_from"), 
												 request.getParameter("member_id_to"));
			request.setAttribute("list", list);
			return mapping.findForward("list");
		} else if(action.equals("insert")) {
			dao.insertAsking(request.getParameter("member_id_from"),
							 request.getParameter("member_id_to"),
							 request.getParameter("asking_content")); //입력실패의 경우에도 다른 동작하지 않음
			return null;
		} else if(action.equals("update")) {
			try {
				int asking_no = Integer.parseInt(request.getParameter("asking_no"));
				String asking_content = request.getParameter("asking_content");
				dao.updateAsking(asking_no, asking_content); //수정 실패의 경우에도 다른 동작 하지 않음
			} catch(Exception e) {
				return null;
			}
			return null;
		} else if(action.equals("delete")) {
			try {
				dao.deleteAsking(Integer.parseInt(request.getParameter("asking_no"))); //삭제 실패의 경우에도 다른 동작 하지 않음
			} catch(Exception e) {
				return null;
			}
			return null;
		} else if(action.equals("listTo")){
			List<Asking> list = dao.selectAskingTo(request.getParameter("member_id_to"));
			request.setAttribute("list", list);
			return mapping.findForward("list");
		} else {
			return null;
		}
	}
}
