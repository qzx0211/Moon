package com.baizhi.util;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;

public class MybatisUtil {

	
	private static SqlSessionFactory sqlSessionFactory;
	
	private static final ThreadLocal<SqlSession> t = new ThreadLocal<SqlSession>();
	
	static{
		try {
			InputStream is = Resources.getResourceAsStream("mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(is);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 返回sqlSession
	 */
	
	public static SqlSession getSqlSession(){
		SqlSession sqlSession = t.get();
		if(sqlSession==null){
			sqlSession = sqlSessionFactory.openSession();
			t.set(sqlSession);
		}
		return sqlSession;
	}
	/**
	 * 关闭sqlSession
	 */
	public static void close(){
		SqlSession sqlSession = t.get();
		if(sqlSession!=null){
			sqlSession.close();
			t.remove();
		}
	}
	/**
	 * 提交事务
	 */
	public static void commit(){
		getSqlSession().commit();
		close();
	}
	/**
	 * 回滚事务
	 */
	public static void rollback(){
		getSqlSession().rollback();
		close();
	}
}
