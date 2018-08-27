package com.encore.funshop.dao;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.encore.funshop.vo.BuyHis;
import com.encore.funshop.vo.Pdetail;
import com.encore.funshop.vo.Product;
import com.ibatis.sqlmap.client.SqlMapClient;
import iba.MySqlMapClient;

public class ProductDAO {
	SqlMapClient smc;
	public ProductDAO() {
	smc = MySqlMapClient.getSqlMapInstance();
	}
	public List<Product> selectProductAll(Map<String, String> map) throws SQLException {
		return smc.queryForList("funshop.selectProductAll", map);
	}
	public Product selectDetail(int no) throws SQLException {
		return (Product) smc.queryForObject("funshop.selectDetail", no);
	}
	public List<String> selectType() throws SQLException {
		return smc.queryForList("funshop.selectType");
	}
	public List<Pdetail> selectPdetail(int no) throws SQLException{
		return smc.queryForList("funshop.selectPdetail", no);
	}
	public int selectLow(int no) throws SQLException{
		return (int) smc.queryForObject("funshop.selectLow", no);
	}
	public boolean insertBuy(BuyHis buyhis)  {
		 try {
			smc.insert("funshop.insertBuy",buyhis);
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
}