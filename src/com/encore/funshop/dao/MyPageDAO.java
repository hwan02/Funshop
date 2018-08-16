package com.encore.funshop.dao;

import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import com.encore.funshop.vo.Asking;
import com.encore.funshop.vo.Basket;
import com.encore.funshop.vo.BuyHis;
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
			//e.printStackTrace();
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
	
	public boolean insertAsking(String member_id, String asking_content) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("member_id", member_id);
		map.put("asking_content", asking_content);
		try {
			smc.insert("myPage.insertAsking", map);
			return true;
		} catch (SQLException e) {
			//e.printStackTrace();
			return false;
		}
	}
	
	public List<Asking> selectAsking(String member_id, String admin_id) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("member_id", member_id);
		map.put("admin_id", admin_id);
		try {
			return smc.queryForList("myPage.selectAsking", map);		
		} catch (SQLException e) {
			//e.printStackTrace();
			return null;
		}
	}
}
