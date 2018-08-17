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
import org.apache.struts.action.ActionMessages;

import com.funshop.admin.dao.MemberDAO;
import com.funshop.admin.vo.MemberVO;
import com.funshop.admin.vo.NoticeVO;

public class Member_Action extends Action {
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String action = request.getParameter("action");

		// 액션이 잘 왔는지 확인
		System.out.println(action);

		MemberDAO dao = new MemberDAO();

		Map<String, Object> map = new HashMap<>();
		ActionForward forward = null;

		// 목록요청, null 값 오면 무조건 list!!!
		if (action == null || action.equals("list")) {
			List<MemberVO> list = dao.selectAll(map);

			request.setAttribute("list", list);

			forward = mapping.findForward("list");

		}
		return forward;
	}
}
