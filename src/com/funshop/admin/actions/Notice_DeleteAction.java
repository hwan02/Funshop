package com.funshop.admin.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.funshop.admin.dao.NoticeDAO;

public class Notice_DeleteAction extends Action {
	// DB전용 삭제 컨트롤러
	// 공지사항 글 삭제 하기

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		int no = Integer.parseInt(request.getParameter("no"));
		NoticeDAO dao = new NoticeDAO();
		dao.delete(no);

		return mapping.findForward("check");
	}
}
