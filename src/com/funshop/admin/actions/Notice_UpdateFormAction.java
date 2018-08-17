package com.funshop.admin.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.funshop.admin.dao.NoticeDAO;
import com.funshop.admin.vo.NoticeVO;

public class Notice_UpdateFormAction extends Action {

	// 수정폼 전용 컨트롤러
	// 할일: 수정폼보이기 <=== DB의 기존데이터를 조회하고 그 값을 출력한!!

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		int no = Integer.parseInt(request.getParameter("no"));
		System.out.println(no);
		NoticeDAO dao = new NoticeDAO();
		NoticeVO notice = dao.select(no);
		request.setAttribute("notice", notice);// DB검색결과를 뷰(JSP)에 반영!!
		return mapping.findForward("editForm"); // JSP포워딩!!
	}
}
