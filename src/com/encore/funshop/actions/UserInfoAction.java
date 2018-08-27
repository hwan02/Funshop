package com.encore.funshop.actions;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.encore.funshop.dao.UserInfoDAO;
import com.encore.funshop.vo.UserInfo;

public class UserInfoAction extends Action{
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String action = request.getParameter("action");
		//System.out.println("action>>"+action);
		
		UserInfoDAO dao = new UserInfoDAO();
		ActionForward forward=null;
		
		if(action.equals("input")) {//회원가입폼
			forward = mapping.findForward("input");
		}else if(action.equals("insert")) {//회원가입 (등록)
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			String name = request.getParameter("name");
			String phone = request.getParameter("phone1") +"-"
						+ request.getParameter("phone2") +"-"
						+ request.getParameter("phone3");
			String email = request.getParameter("email1") +"@"
						+ request.getParameter("email2");
			String question = request.getParameter("question");
			String answer = request.getParameter("answer");
			
			UserInfo user = new UserInfo();
			user.setId(id);
			user.setPw(pw);
			user.setName(name);
			user.setPhone(phone);
			user.setEmail(email);
			user.setQuestion(question);
			user.setAnswer(answer);
			
			//System.out.println(user.toString());
			if(dao.insert(user)) {
				request.setAttribute("id", id);
				forward = mapping.findForward("success");
			}else {
				forward = mapping.findForward("fail");
			}
		}else if(action.equals("idCheck")) {//id 중복확인 폼
			forward = mapping.findForward("idCheck");
		}else if(action.equals("check")) {//id 중복체크
			String id = request.getParameter("id");
			
			//System.out.println("id>>"+id);
			//System.out.println("dao.idCheck(id)>>"+dao.idCheck(id));
			
			if(!dao.idCheck(id)) {
				request.setAttribute("id", id);
				forward = mapping.findForward("idResult");
			}else {
				forward = mapping.findForward("idResult");
			}
		}
		
		return forward;
	}//execute
}
