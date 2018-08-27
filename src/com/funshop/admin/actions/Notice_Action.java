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
		
		//액션이 잘 들어 왔는지 확인
		System.out.println("action=" + action);

		NoticeDAO dao = new NoticeDAO();
		Map<String, Object> map = new HashMap<>();
		ActionForward forward = null;
		if (action == null || action.equals("list")) {// 목록요청
			List<NoticeVO> list = dao.selectAll(map);
			request.setAttribute("list", list);

			
			
			
			
			
		/*	// 총페이지 갯수 구하기
			// int totalRecordCount//(전체 레코드수) : 32
			int pageCount = 10;// (한 화면에 보여질 레코드수) : 10
			int totalPage = dao.selectRecordCount(pageCount);

			// 페이지 정보
			String page = request.getParameter("page");// "1" "2" "3"


			if (page == null) {// page정보가 없다면
				response.sendRedirect("/Funshop/admin_notice/noticeList.do?action=list&page=1");
				// 1페이지 정보를 가지고 Action를 재호출!!
				return forward;
			}

			int pageNo = Integer.parseInt(page);

			// 시작글번호 ~ 끝글번호
			int end = pageNo * pageCount;// 10;
			int start = end - (pageCount - 1);// 9;

			Map<String, Integer> map2 = new HashMap<>();
			map2.put("start", start);
			map2.put("end", end);
			System.out.println(start);
			System.out.println(end);
			
			// 전체 게시물 정보 조회
			request.setAttribute("list", dao.selectPage(map2));
			request.setAttribute("totalPage", totalPage);*/
			
			
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