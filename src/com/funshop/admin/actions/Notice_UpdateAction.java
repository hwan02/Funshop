package com.funshop.admin.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.funshop.admin.dao.NoticeDAO;
import com.funshop.admin.vo.NoticeVO;

public class Notice_UpdateAction extends Action {
	// DB수정처리 전용 컨트롤러
	// 주된일: DB수정(to DB) <==== (from JSP)수정할 정보 얻기

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		NoticeVO notice = new NoticeVO();
		notice.setWrite(request.getParameter("write"));
		notice.setContents(request.getParameter("contents"));
		notice.setNo(Integer.parseInt(request.getParameter("no")));

		System.out.println("DB 전달확인" + notice);

		NoticeDAO dao = new NoticeDAO();

		dao.update(notice);

		return mapping.findForward("noticeList");// 수정결과 반영 ---> notice_editForm.jsp
	}
}
