package com.htmtennis.prj.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.htmtennis.prj.dao.SearchDao;
import com.htmtennis.prj.model.Search;


public class MyBSearchDao implements SearchDao{

	@Override
	public Search getSearch(String code) {
		SqlSessionFactory factory = MyBatisMain.getSqlSessionFactory();
		SqlSession sqlSession = factory.openSession(true);
		SearchDao searchDao = sqlSession.getMapper(SearchDao.class);
		
		return searchDao.getSearch(code);
	}

	@Override
	public Search prevSearch(String curCode) {
		SqlSessionFactory factory = MyBatisMain.getSqlSessionFactory();
		SqlSession sqlSession = factory.openSession(true);
		SearchDao searchDao = sqlSession.getMapper(SearchDao.class);
		
		return searchDao.prevSearch(curCode);
	}

	@Override
	public Search nextSearch(String curCode) {
		SqlSessionFactory factory = MyBatisMain.getSqlSessionFactory();
		SqlSession sqlSession = factory.openSession(true);
		SearchDao searchDao = sqlSession.getMapper(SearchDao.class);
		
		return searchDao.nextSearch(curCode);
	}

	@Override
	public List<Search> getSearchs(int page, String query, String field) {
		return null;
	}

	@Override
	public int getSize(String query, String field) {
		return 0;
	}

	
}
