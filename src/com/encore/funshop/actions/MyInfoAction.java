package com.encore.funshop.actions;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.encore.funshop.dao.MyPageDAO;
import com.encore.funshop.vo.UserInfo;

public class MyInfoAction extends Action{
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		MyPageDAO dao = new MyPageDAO();
		String action = request.getParameter("action");
		if(action == null) {
			UserInfo userInfo = dao.selectMyInfo((String)request.getSession().getAttribute(("member_id")));
			request.setAttribute("userInfo", userInfo);
			return mapping.findForward("result");
		} else if(action.equals("update")) {
			dao.updateMyInfo(new UserInfo((String)request.getSession().getAttribute("member_id"),
										  		  request.getParameter("pw"),
										  		  null,
										  		  request.getParameter("phone1")+"-"
										  		 +request.getParameter("phone2")+"-"
										  		 +request.getParameter("phone3"),
										  		  request.getParameter("email1")+"@"
										  	     +request.getParameter("email2"),
										  	      request.getParameter("addr"),
										  	   	  null,
										  	      request.getParameter("question"),
										  	      request.getParameter("answer"),
										  	      null));
			//UserInfo(String id, String pw, String name, String phone, String email, String addr, Date wdate,
			//		 String question, String answer, String rank)
			
			//업데이트 실패시에도 다른 동작하지 않음
			return mapping.findForward("afterUpdate");
		} else if(action.equals("delete")){
			dao.deleteMyInfo((String)request.getSession().getAttribute("member_id"));
			
			//삭제 실패시에도 다른 동작하지 않음
			request.getSession().invalidate();
			return mapping.findForward("afterDelete");
		} else {
			return null;
		}
	}
}
