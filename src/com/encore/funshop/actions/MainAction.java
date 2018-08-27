package com.encore.funshop.actions;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.encore.funshop.dao.ProductDAO;
import com.encore.funshop.vo.BuyHis;
import com.encore.funshop.vo.Option;
import com.encore.funshop.vo.Pdetail;
import com.encore.funshop.vo.Product;

public class MainAction extends Action{
		ArrayList<Option> list;
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Calendar nowCal = Calendar.getInstance();
		String forwardName=null;
		ProductDAO dao = new ProductDAO();
		String action = request.getParameter("action");
		System.out.println("action="+action);
		Map<String, String> map = new HashMap<>();
		int mainClickNum=0;
		List<Product> productList=null;
		List<Pdetail> pdtailList=null;
			if(action.contains("mainDetail")) {
			mainClickNum = Integer.parseInt(action.substring(10));
			request.getSession().setAttribute("mainClickNum", mainClickNum);
			Product pro =dao.selectDetail(mainClickNum);
			request.getSession().setAttribute("pro", pro);
			
			pdtailList=dao.selectPdetail(mainClickNum);
			request.getSession().setAttribute("pdtailList", pdtailList);
			//가장 낮은 가격 가져오기
				int lowPrice = dao.selectLow(mainClickNum);
				request.getSession().setAttribute("lowPrice", lowPrice);
		}	
		if(action ==null || action.equals("main")) {
			forwardName="main";
		}else if(action.equals("search")) {
			String mainSearch = request.getParameter("mainSearch");
			request.setAttribute("mainSearch", mainSearch);
			if(mainSearch!=null) {
				forwardName="search";
			}
		}else if(action.equals("image")) {
			productList = dao.selectProductAll(map);
			request.setAttribute("productList", productList);
			//아침 점심 저녁 시간 저장 후 보내기
			for (int i = 0; i < productList.size(); i++) {
				if(productList.get(i).getTime().equals("아침")) {
					Calendar startCal = Calendar.getInstance();
					startCal.set(Calendar.HOUR_OF_DAY, 4);
					startCal.set(Calendar.MINUTE, 0);
					startCal.set(Calendar.SECOND, 0);
					Calendar endCal = Calendar.getInstance();
					endCal.set(Calendar.HOUR_OF_DAY, 11);
					endCal.set(Calendar.MINUTE, 59);
					endCal.set(Calendar.SECOND, 59);
					if(nowCal.after(startCal) && nowCal.before(endCal)) {
						request.setAttribute("time1", 1);
					}else {
						request.setAttribute("time1", 2);
					}
				}else if(productList.get(i).getTime().equals("점심")) {
					Calendar startCal = Calendar.getInstance();
					startCal.set(Calendar.HOUR_OF_DAY, 12);
					startCal.set(Calendar.MINUTE, 0);
					startCal.set(Calendar.SECOND, 0);
					Calendar endCal = Calendar.getInstance();
					endCal.set(Calendar.HOUR_OF_DAY, 20);
					endCal.set(Calendar.MINUTE, 59);
					endCal.set(Calendar.SECOND, 59);
					if(nowCal.after(startCal) && nowCal.before(endCal)) {
						request.setAttribute("time2", 1);
					}else {
						request.setAttribute("time2", 2);
					}
				}else if(productList.get(i).getTime().equals("저녁")) {
					Calendar startCal = Calendar.getInstance();
					startCal.set(Calendar.HOUR_OF_DAY, 21);
					startCal.set(Calendar.MINUTE, 0);
					startCal.set(Calendar.SECOND, 0);
					Calendar endCal = Calendar.getInstance();
					endCal.set(Calendar.HOUR_OF_DAY, 3);
					endCal.set(Calendar.MINUTE, 59);
					endCal.set(Calendar.SECOND, 59);
					if(nowCal.after(startCal) || nowCal.before(endCal)) {
						request.setAttribute("time3", 1);
					}else {
						request.setAttribute("time3", 2);
					}
				}
			}
			forwardName="image";
		}else if(action.equals("mainDetail"+mainClickNum)) {
			if(request.getParameter("special")!=null) {
				request.setAttribute("special", 1);
			}
			forwardName="detail";
		}else if(action.equals("cloth")) {
			map.put("cloth", "의류");
			productList = dao.selectProductAll(map);
			request.setAttribute("productList", productList);
			forwardName="type";
		}else if(action.equals("place")) {
			map.put("place", "장소");
			productList = dao.selectProductAll(map);
			request.setAttribute("productList", productList);
			forwardName="type";
		}else if(action.equals("food")) {
			map.put("food", "음식");
			productList = dao.selectProductAll(map);
			request.setAttribute("productList", productList);
			forwardName="type";
		}else if(action.equals("detailType")) {
			request.setAttribute("detailType", request.getParameter("detailType"));
			List<String> typeList = dao.selectType();
			request.setAttribute("typeList", typeList.toArray());
			forwardName="typeList";
		}else if(action.equals("directBuy")) {
			String productNumber = request.getParameter("productNumber");
			pdtailList=dao.selectPdetail(Integer.parseInt(productNumber));
			String strArr = "";
			int productNum=0;
			Option op = null;
			int opPriceTotal = 0;
			list = new ArrayList<>();
			for (int i = 0; i < pdtailList.size(); i++) {
				String opName = pdtailList.get(i).getName();
				int opPrice = pdtailList.get(i).getPrice();
				String name = request.getParameter(opName);
				opPriceTotal = opPrice * Integer.parseInt(name);
				System.out.println("opPriceTotal="+opPriceTotal);
				 op= new Option(pdtailList.get(i).getNo(), pdtailList.get(i).getName(), name, opPriceTotal);
				if(!name.equals("0")) {
					list.add(op);
					strArr += opName+" - "+name+"<br>";
				}
				productNum += Integer.parseInt(name);
			}
			request.setAttribute("strArr", strArr);
			request.getSession().setAttribute("list", list);
			request.setAttribute("productNum", productNum);
			
			String hidTotal = request.getParameter("hidTotal");
			request.setAttribute("hidTotal", hidTotal);
			forwardName="directBuy";
		}else if(action.equals("payment")) {
			for (int i = 0; i < list.size(); i++) {
				BuyHis buyhis = new BuyHis();
				buyhis.setMember_id(request.getParameter("member_id"));
				buyhis.setPdetail_no(list.get(i).getOpNo());
				buyhis.setBuyHis_num(Integer.parseInt(list.get(i).getOpNum()));
				buyhis.setBuyHis_payment(list.get(i).getOpPrice());
				buyhis.setBuyHis_addr(request.getParameter("buyHis_addr"));
				buyhis.setBuyHis_payType(request.getParameter("buyHis_payType"));
				buyhis.setBuyHis_payInfo(request.getParameter("buyHis_payInfo"));
				if(dao.insertBuy(buyhis)) {
					System.out.println("성공");
				}else {
					System.out.println("실패");
				}
			}
		}else if(action.equals("paymentSupport")) {
			forwardName="paymentSupport";
		}
		return mapping.findForward(forwardName);
	}
}