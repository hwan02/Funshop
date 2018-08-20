package com.funshop.admin.actions;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.funshop.admin.dao.MemberDAO;
import com.funshop.admin.dao.NoticeDAO;
import com.funshop.admin.vo.MemberVO;
import com.funshop.admin.vo.NoticeVO;

public class Member_UpdateAction extends Action {
	// DB수정처리 전용 컨트롤러
	// 주된일: DB수정(to DB) <==== (from JSP)수정할 정보 얻기

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		MemberVO member = new MemberVO();		
		member.setId(request.getParameter("id"));
		member.setPw(request.getParameter("pw"));
		member.setName(request.getParameter("name"));
		member.setEmail(request.getParameter("email"));
		member.setPhone(request.getParameter("phone"));
		member.setAddr(request.getParameter("addr"));
		member.setQuestion(request.getParameter("question"));
		member.setAnswer(request.getParameter("answer"));
		member.setRank(request.getParameter("rank"));

		System.out.println("DB 전달확인" + member);

		MemberDAO dao = new MemberDAO();

		dao.update(member);

		return mapping.findForward("memberList");// 수정결과 반영 ---> notice_listForm.jsp
	}
}
