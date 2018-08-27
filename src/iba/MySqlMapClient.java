package iba;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

public class MySqlMapClient {
	/*
	 	sqlMapConfig.xml문서를 객체화 시켜주는 클래스
	 	★ SqlMapClient클래스의 역할 : XML내에 작성된 SQL문을 호출
	 */
	private static final SqlMapClient sqlMap;
	
	//static영역 : 클래스의 어떤 요소보다 먼저 실행됨
	static {
		try {
			String resource = "./iba/sqlMapConfig.xml";
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMap = SqlMapClientBuilder.buildSqlMapClient(reader);
		} catch (IOException e) {
			e.printStackTrace();
			throw new RuntimeException("MySqlMapConfig 초기화 중 에러 : "+ e);
		}
	}//static
	
	public static SqlMapClient getSqlMapInstance() {
		return sqlMap;
	}
}
