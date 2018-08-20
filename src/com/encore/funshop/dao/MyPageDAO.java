package com.encore.funshop.dao;

import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import com.encore.funshop.vo.Asking;
import com.encore.funshop.vo.Basket;
import com.encore.funshop.vo.BuyHis;
import com.encore.funshop.vo.Product;
import com.ibatis.sqlmap.client.SqlMapClient;

import iba.MySqlMapClient;

public class MyPageDAO {
	SqlMapClient smc;
	
	public MyPageDAO() {
		smc = MySqlMapClient.getSqlMapInstance();
	}
	
	public List<BuyHis> selectBuyHistory(String member_id, Date startDate, Date endDate) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("member_id", member_id);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		try {
			return smc.queryForList("myPage.selectBuyHistory", map);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public List<Basket> selectBasket(String member_id) {
		try {
			return smc.queryForList("myPage.selectBasket", member_id);
		} catch (Exception e) {
			//e.printStackTrace();
			return null;
		}
	}
	
	public boolean deleteBasket(int basket_no) {
		try {
			if(smc.delete("myPage.deleteBasket", basket_no) > 0 ) return true;
			else return false;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public Product selectProduct(int product_no) {
		try {
			return (Product) smc.queryForObject("myPage.selectProduct", product_no);
		} catch (Exception e) {
			//e.printStackTrace();
			return null;
		}
	}
 	
	public List<Basket> selectRegBuy(String member_id) {
		try {
			return smc.queryForList("myPage.selectRegBuy", member_id);
		} catch (Exception e) {
			//e.printStackTrace();
			return null;
		}
	}
	
	public int selectTotalPoint(String member_id, Date startDate, Date endDate) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("member_id", member_id);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		try {
			return (int) smc.queryForObject("myPage.selectTotalPoint", map);
		} catch (Exception e) {
			//e.printStackTrace();
			return 0;
		}
	}
	
	public boolean insertPoint(String member_id, int point_point) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("member_id", member_id);
		map.put("point_point", point_point);
		try {
			smc.insert("myPage.insertPoint", map);
			return true;
		} catch (Exception e) {
			//e.printStackTrace();
			return false;
		}
	}
	
	public boolean insertAsking(String member_id_from, String member_id_to, String asking_content) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("member_id_from", member_id_from);
		map.put("member_id_to", member_id_to);
		map.put("asking_content", asking_content);
		try {
			smc.insert("myPage.insertAsking", map);
			return true;
		} catch (Exception e) {
			//e.printStackTrace();
			return false;
		}
	}
	
	public List<Asking> selectAsking(String member_id_from, String member_id_to) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("member_id_from", member_id_from);
		map.put("member_id_to", member_id_to);
		map.put("asking_check", "읽음");
		try {
			smc.update("myPage.checkAsking", map);
			return smc.queryForList("myPage.selectAsking", map);		
		} catch (Exception e) {
			//e.printStackTrace();
			return null;
		}
	}
	
	public boolean deleteAsking(int asking_no) {
		try {
			if(smc.delete("myPage.deleteAsking", asking_no) > 0) return true;
			else return false;
		} catch (Exception e) {
			//e.printStackTrace();
			return false;
		}
	}
	
	public boolean updateAsking(int asking_no, String asking_content) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("asking_no", asking_no);
		map.put("asking_content", asking_content);
		map.put("asking_check", "읽지 않음");
		try {
			if(smc.update("myPage.updateAsking", map) > 0) return true;
			else return false;
		} catch (Exception e) {
			//e.printStackTrace();
			return false;
		}
	}
	
	public List<Asking> selectAskingTo(String member_id_to) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("member_id_to", member_id_to);
		map.put("asking_check", "읽지 않음");
		try {
			return smc.queryForList("myPage.selectAskingTo", map);
		} catch (Exception e) {
			//e.printStackTrace();
			return null;
		}
	}
}
