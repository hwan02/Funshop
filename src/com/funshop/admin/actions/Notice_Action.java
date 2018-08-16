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

import com.funshop.admin.dao.NoticeDAO;
import com.funshop.admin.vo.NoticeVO;

public class Notice_Action extends Action{
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String action = request.getParameter("action");
		String write = request.getParameter("write");
		System.out.println("action=" + action);

		NoticeDAO dao = new NoticeDAO();
		Map<String, Object> map = new HashMap<>();
		ActionForward forward = null;
		if (action == null || action.equals("list")) {// 목록요청
			List<NoticeVO> list = dao.selectAll(map);
			request.setAttribute("list", list);

			forward = mapping.findForward("list");
		} else if (action.equals("editForm")) {
			forward = mapping.findForward("noticeList");
		} else if (action.equals("insert")) {// DB입력요청

			// 5개의 파라미터 데이터를 한개의 변수명으로 묶어주기
			NoticeVO notice = new NoticeVO
					(0,
					request.getParameter("write"),
					request.getParameter("contents"),
					null);

			map.put("write", write);

			request.setAttribute("insert", dao.insert(notice));

			forward = mapping.findForward("insert");

		}

		return forward;
	}
}