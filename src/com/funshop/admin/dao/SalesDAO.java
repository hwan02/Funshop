package com.funshop.admin.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.funshop.admin.vo.SalesVO;
import com.ibatis.sqlmap.client.SqlMapClient;

import iba.MySqlMapClient;

public class SalesDAO {
	SqlMapClient sqlMap;

	public SalesDAO() {
		sqlMap = MySqlMapClient.getSqlMapInstance();
	}
	
	public List<SalesVO> selectAll(Map<String, Object> map) throws SQLException {
		return sqlMap.queryForList("sales.selectAll", map);
	}// selectAll
}
