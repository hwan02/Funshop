package com.encore.funshop.actions;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.encore.funshop.dao.MyPageDAO;
import com.encore.funshop.vo.Basket;
import com.encore.funshop.vo.Product;

public class BasketAction extends Action{
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		MyPageDAO dao = new MyPageDAO();
		String action = request.getParameter("action");
		
		if(action == null) {
			List<Basket> list = dao.selectBasket((String)request.getSession().getAttribute("member_id"));
			request.setAttribute("list", list);
			
			HashMap<Integer, Product> map = new HashMap<>();
			for(int i=0; i<list.size(); i++) {
				int product_no = list.get(i).getProduct_no();
				map.put(product_no, dao.selectProduct(product_no));
			}
			request.setAttribute("map", map);
	
			return mapping.findForward("result");
		} else if(action.equals("delete")) {
			int basket_no = Integer.parseInt(request.getParameter("basket_no"));
			request.getSession().setAttribute("result", dao.deleteBasket(basket_no)); //장바구니 삭제 실패해도 특별히 다른 동작 하지 않음
			return null;
		} else {
			return null;
		}
	}
}
