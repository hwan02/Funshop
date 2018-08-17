package com.funshop.admin.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.funshop.admin.vo.NoticeVO;
import com.ibatis.sqlmap.client.SqlMapClient;

import iba.MySqlMapClient;

public class NoticeDAO {
	SqlMapClient sqlMap; // SqlMap: XML내의 기술된 sql문 호출,실행

	public NoticeDAO() {
		sqlMap = MySqlMapClient.getSqlMapInstance();
	}

	public boolean insert(NoticeVO notice) {// 공지사항 입력
		try {
			System.out.println(notice);
			sqlMap.insert("notice.insert", notice);
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}// insert

	public NoticeVO select(int no) {
		NoticeVO notice = null;

		try {
			notice = (NoticeVO) sqlMap.queryForObject("notice.select", no);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return notice;
	}// select

	public List<NoticeVO> selectAll(Map<String, Object> map) throws SQLException {
		return sqlMap.queryForList("notice.selectAll", map);
	}// selectAll

	public boolean update(NoticeVO notice) {
		try {
			int numUp = sqlMap.update("notice.update", notice);
			if (numUp == 1) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return false;
	}// update

	public boolean delete(int no) {
		try {
			int numDel = sqlMap.delete("notice.delete", no);
			if (numDel == 1) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}// delete

	public int selectRecordCount(int pageCount) throws SQLException {
		// pageCount : 한 페이지에 보여질 행의수
		return (Integer) sqlMap.queryForObject("notice.selectRecordCount", pageCount);
	}

	public List<NoticeVO> selectPage(Map<String, Integer> map) {
		List<NoticeVO> list = null;
		try {
			long start = System.currentTimeMillis();
			list = sqlMap.queryForList("notice.selectPage", map);
			long end = System.currentTimeMillis();
			System.out.println("조회시간: " + (end - start));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}// selectPage
}