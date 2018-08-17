package com.funshop.admin.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.funshop.admin.dao.MemberDAO;
import com.funshop.admin.vo.MemberVO;

public class Member_UpdateFormAction extends Action{
	// 수정폼 전용 컨트롤러
	// 할일: 수정폼보이기 <=== DB의 기존데이터를 조회하고 그 값을 출력!!
	
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		
		//번호확인
		System.out.println(id);
		
		MemberDAO dao = new MemberDAO();
		MemberVO member = dao.select(id);
		request.setAttribute("member", member);
		return mapping.findForward("editForm");
		
	}
}
