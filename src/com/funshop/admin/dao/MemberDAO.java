package com.funshop.admin.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.funshop.admin.vo.MemberVO;
import com.funshop.admin.vo.NoticeVO;
import com.ibatis.sqlmap.client.SqlMapClient;

import iba.MySqlMapClient;

public class MemberDAO {
	SqlMapClient sqlMap; // SqlMap: XML내의 기술된 sql문 호출,실행

	public MemberDAO() {
		sqlMap = MySqlMapClient.getSqlMapInstance();
	}// 생성자

	// 회원정보 전체 보기
	public List<MemberVO> selectAll(Map<String, Object> map) throws SQLException {
		return sqlMap.queryForList("member.selectAll", map);
	}// selectAll

	// 회원정보 수정
	public boolean update(MemberVO member) {
		try {
			int numUp = sqlMap.update("member.update", member);
			if (numUp == 1) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return false;
	}// update

	// 회원정보 필요한 부분만
	public MemberVO select(int no) {
		MemberVO member = null;

		try {
			member = (MemberVO) sqlMap.queryForObject("member.select", no);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return member;
	}// select

	//회원정보 삭제
	public boolean delete(int no) {
		try {
			int numDel = sqlMap.delete("member.delete", no);
			if (numDel == 1) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}// delete

}// main
