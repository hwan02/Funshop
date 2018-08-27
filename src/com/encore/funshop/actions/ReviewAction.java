package com.encore.funshop.actions;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.encore.funshop.dao.MainPageDAO;
import com.encore.funshop.vo.Review;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ReviewAction extends Action{
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		MainPageDAO dao = new MainPageDAO();
		String action = request.getParameter("action");
		
		if(action == null || action.equals("list")) {
			List<Review> list = dao.selectReviewList();
			request.setAttribute("list", list);
			
			return mapping.findForward("showList");
		} else if(action.equals("insert")) {
			String saveDirectory = request.getSession().getServletContext().getRealPath("/img");
			//==> "~/Funshop/img"
			int maxSize = 5 * 1024 * 1024; // 5mb;
			MultipartRequest mreq = new MultipartRequest(request, saveDirectory, 
														 maxSize, "UTF-8", new DefaultFileRenamePolicy());
			
			dao.insertReview(new Review(0, mreq.getParameter("review_name"), 
										   mreq.getParameter("review_content"),
										   mreq.getFilesystemName("review_img"), null,
										   mreq.getParameter("member_id")));
			return mapping.findForward("reqList");
		} else if(action.equals("read")) {
			int review_no = Integer.parseInt(request.getParameter("review_no"));
			request.setAttribute("review", dao.selectReview(review_no));
			return mapping.findForward("showReview");
		} else if(action.equals("delete")) {
			int review_no = Integer.parseInt(request.getParameter("review_no"));
			dao.deleteReview(review_no);
			return mapping.findForward("reqList");
		} else {
			return mapping.findForward("reqList");
		}
	}
}