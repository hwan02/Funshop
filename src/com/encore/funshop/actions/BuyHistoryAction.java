package com.encore.funshop.actions;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.encore.funshop.dao.MyPageDAO;
import com.encore.funshop.vo.BuyHis;

public class BuyHistoryAction extends Action {
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Calendar startCal = Calendar.getInstance();
		startCal.set(Calendar.HOUR_OF_DAY, 0);
		startCal.set(Calendar.MINUTE, 0);
		startCal.set(Calendar.SECOND, 0);
		Calendar endCal = Calendar.getInstance();
		endCal.set(Calendar.HOUR_OF_DAY, 23);
		endCal.set(Calendar.MINUTE, 59);
		endCal.set(Calendar.SECOND, 59);
		
		String option = request.getParameter("option");
		if(option.equals("thisWeek")) { //이번주
			startCal.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
			endCal.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
			endCal.add(Calendar.DATE, 6);
		} else if(option.equals("userTime")) { //사용자 지정 날짜
			try {
				String userTime = request.getParameter("userTime");
				String startTime[] = userTime.split("-")[0].split("/");
				String endTime[] = userTime.split("-")[1].split("/");
				startCal.set(Integer.parseInt(startTime[0]), Integer.parseInt(startTime[1])-1, Integer.parseInt(startTime[2]));
				endCal.set(Integer.parseInt(endTime[0]), Integer.parseInt(endTime[1])-1, Integer.parseInt(endTime[2]));
			} catch(Exception e) {
				response.setContentType("text/html; charset=UTF-8");
				response.getWriter().print("<center><br>입력 형식을 확인하세요<br>예) 2017/07/10-2018/08/10<br><br></center>");
				return null;
			}
		} else { //이번달,이번달-1,이번달-2,이번달-3,이번달-4,이번달-5
			int month = Integer.parseInt(option);
			if(month > startCal.get(Calendar.MONTH)+1) {
				startCal.add(Calendar.YEAR, -1); //작년
				endCal.add(Calendar.YEAR, -1); //작년
			}
			startCal.set(Calendar.MONTH, month-1);
			startCal.set(Calendar.DATE, 1);
			endCal.set(Calendar.MONTH, month-1);
			endCal.set(Calendar.DATE, endCal.getActualMaximum(Calendar.DAY_OF_MONTH));
		}
		
		//for Test
		//System.out.println(startCal.getTime());
		//System.out.println(endCal.getTime());
		
		String id = (String) request.getSession().getAttribute("member_id");
		List<BuyHis> buyHistoryList = new MyPageDAO().selectBuyHistory(id, startCal.getTime(), endCal.getTime());
		if(buyHistoryList == null || buyHistoryList.size() < 1) {
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().print("<center><br>검색 결과가 없습니다<br><br></center>");
			return null;
		}
		request.setAttribute("list", buyHistoryList);
		return mapping.findForward("result");
	}
}
