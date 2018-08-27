package com.encore.funshop.dao;

import java.sql.SQLException;
import java.util.List;

import com.encore.funshop.vo.Product;
import com.encore.funshop.vo.Review;
import com.ibatis.sqlmap.client.SqlMapClient;

import iba.MySqlMapClient;

public class MainPageDAO {
	SqlMapClient smc;
	
	public MainPageDAO() {
		smc = MySqlMapClient.getSqlMapInstance();
	}
	
	public List<Review> selectReviewList() {
		try {
			return smc.queryForList("mainPage.selectReviewList");
		} catch (SQLException e) {
			//e.printStackTrace();
			return null;
		}
	}
	
	public Review selectReview(int review_no) {
		try {
			return (Review) smc.queryForObject("mainPage.selectReview", review_no);
		} catch (SQLException e) {
			//e.printStackTrace();
			return null;
		}
	}
	
	public boolean insertReview(Review review) {
		try {
			smc.insert("mainPage.insertReview", review);
			return true;
		} catch (SQLException e) {
			//e.printStackTrace();
			return false;
		}
	}
	
	public boolean deleteReview(int review_no) {
		try {
			if(smc.delete("mainPage.deleteReview", review_no) > 0) return true;
			else return false;
		} catch (SQLException e) {
			//e.printStackTrace();
			return false;
		}
	}
	
	public List<Product> searchProduct(String keyword) {
		try {
			return smc.queryForList("mainPage.searchProduct", "%"+keyword+"%");
		} catch (SQLException e) {
			//e.printStackTrace();
			return null;
		}
	}
}
