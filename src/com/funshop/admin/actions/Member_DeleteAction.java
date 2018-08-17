package com.funshop.admin.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.funshop.admin.dao.MemberDAO;

public class Member_DeleteAction extends Action {
	// DB전용 삭제 컨트롤러
	// 회원정보  삭제 하기(회원탈퇴 인원)

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		MemberDAO dao = new MemberDAO();
		dao.delete(id);

		return mapping.findForward("check");
	}
}
