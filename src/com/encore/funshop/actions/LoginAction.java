package com.encore.funshop.actions;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

import com.encore.funshop.dao.UserInfoDAO;
import com.encore.funshop.vo.UserInfo;

public class LoginAction extends Action{
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String action = request.getParameter("action");
		//System.out.println("action>>"+ action);
		
		ActionForward forward = null;
		UserInfoDAO dao = new UserInfoDAO();
		
		if(action==null || action.equals("loginForm")) {//로그인폼
			forward = mapping.findForward("loginForm");
		}else if(action.equals("login")) {//로그인
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			
			Map<String,String> map = new HashMap<>();
			map.put("id", id);
			map.put("pw", pw);
			
			//System.out.println("id>>"+id);
			//System.out.println("pw>>"+pw);
			//System.out.println("dao.selectLogin(map)>>"+dao.selectLogin(map));
			
			if(dao.selectLogin(map)) {
				//request.getSession().setAttribute("user", map);
				request.getSession().setAttribute("id", id);
				forward = mapping.findForward("loginSuccess"); //로그인 후 이동할 페이지로 바꿀 것
			}else { //로그인실패시 로그인폼으로
				forward = mapping.findForward("loginForm");
				request.setAttribute("login", "fail");
			}
		}else if(action.equals("logout")) { //로그아웃 
			//request.getSession().removeAttribute("id");
			request.getSession().invalidate();
			forward = mapping.findForward("loginSuccess"); //로그아웃시 로그인폼으로 이동하는 것으로 되어있음
			//forward = mapping.findForward("logout");
		}else if(action.equals("selectForm")) { //ID,PW찾기 폼
			forward = mapping.findForward("selectForm");
		}else if(action.equals("selectIdPw")) { //ID,PW찾기
			String select = request.getParameter("select");
			//System.out.println("select>>"+select);
			if(select.equals("id")) { //id찾기 선택시
				String name = request.getParameter("name");
				String phone = request.getParameter("phone");
				
				Map<String,String> map = new HashMap<>();
				map.put("name", name);
				map.put("phone", phone);
				
				//System.out.println("dao.selectId(map)>>"+dao.selectId(map));
				
				if(dao.selectId(map)!=null) {
					request.setAttribute("id", dao.selectId(map));
					forward = mapping.findForward("selectForm");
				}
			}else if(select.equals("pw")) { //pw찾기 선택시
				String name = request.getParameter("name");
				String id = request.getParameter("id");
				String question = request.getParameter("question");
				String answer = request.getParameter("answer");
				
				Map<String,String> map = new HashMap<>();
				map.put("name", name);
				map.put("id", id);
				map.put("question", question);
				map.put("answer", answer);
				
				//System.out.println("dao.selectPw(map)>>"+dao.selectPw(map));
				
				if(dao.selectPw(map)!=null) {
					request.setAttribute("pw", dao.selectPw(map));
					forward = mapping.findForward("selectForm");
				}
			}
			forward = mapping.findForward("selectIdPw");
		}
		return forward;
	}//execute
}