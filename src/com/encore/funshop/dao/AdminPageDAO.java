package com.encore.funshop.dao;

import java.sql.SQLException;

import org.apache.struts.action.Action;

import com.encore.funshop.vo.Pdetail;
import com.encore.funshop.vo.Product;
import com.ibatis.sqlmap.client.SqlMapClient;

import iba.MySqlMapClient;

public class AdminPageDAO extends Action {
	SqlMapClient smc;

	public AdminPageDAO() {
		smc = MySqlMapClient.getSqlMapInstance();
	}
	
	public void insertProduct(Product product) throws SQLException {
		smc.insert("adminPage.insertProduct", product);
	}
	
	public void insertPdetail(Pdetail pdetail) throws SQLException {
		smc.insert("adminPage.insertPdetail", pdetail);
	}	
}
