package com.encore.funshop.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.encore.funshop.dao.AdminPageDAO;
import com.encore.funshop.vo.Pdetail;
import com.encore.funshop.vo.Product;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class RegProductAction extends Action{
	@SuppressWarnings("finally")
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		boolean reg_product_success_flag = false;
		AdminPageDAO dao = new AdminPageDAO();
		
		try {
			String saveDirectory = request.getSession().getServletContext().getRealPath("/upload/image");
			//==> "~/Funshop/upload/image"
			int maxSize = 5 * 1024 * 1024; // 5mb;
			MultipartRequest mreq = new MultipartRequest(request, saveDirectory, 
														 maxSize, "UTF-8", new DefaultFileRenamePolicy());
			/* 상품 등록 */
			String name = mreq.getParameter("proName");
			String summary = mreq.getParameter("proSumm");
			String description = mreq.getParameter("proDesc");
			String mainImg =  mreq.getFilesystemName("proImg");
			String type = mreq.getParameter("proCat");
			String time = mreq.getParameter("proTime");
			String season = mreq.getParameter("proSeas");
			Product product = new Product(0, name, summary, description, mainImg, "판매중", type, time, season);
			reg_product_success_flag = dao.insertProduct(product);
			
			/* 옵션 등록 */
			int pdCnt = Integer.parseInt(mreq.getParameter("pdCnt")); //옵션 개수(1개 이상)
			for(int i=1; i<=pdCnt; i++) {
				name = mreq.getParameter("pdName"+i);
				summary = mreq.getParameter("pdSumm"+i);
				description = mreq.getParameter("pdDesc"+i);
				String pdImg =  mreq.getFilesystemName("pdImg"+i);
				int price = Integer.parseInt(mreq.getParameter("pdPrice"+i));
				int num = Integer.parseInt(mreq.getParameter("pdNum"+i));
				Pdetail pdetail = new Pdetail(0, name, summary, description, pdImg, price, num, 0);
				reg_product_success_flag = dao.insertPdetail(pdetail);
			}
		
		} catch(Exception e) {
			//e.printStackTrace();
			reg_product_success_flag = false;
		} finally {
			request.getSession().setAttribute("reg_product_success_flag", reg_product_success_flag);
			return mapping.findForward("result");
		}
	}
}
