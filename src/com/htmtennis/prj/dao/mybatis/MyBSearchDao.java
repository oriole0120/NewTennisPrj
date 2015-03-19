package com.htmtennis.prj.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.htmtennis.prj.dao.SearchDao;
import com.htmtennis.prj.model.Search;


public class MyBSearchDao implements SearchDao{

	private SqlSessionFactory factory;
	private SqlSession sqlSession;
	private SearchDao searchDao;
	
	private void settingSession() {
		factory = MyBatisMain.getSqlSessionFactory();
		sqlSession = factory.openSession(true);
		searchDao = sqlSession.getMapper(SearchDao.class);
	}
	
	@Override
	public Search getSearch(String code) {
		settingSession();
		return searchDao.getSearch(code);
	}

	@Override
	public Search prevSearch(String curCode) {
		settingSession();
		return searchDao.prevSearch(curCode);
	}

	@Override
	public Search nextSearch(String curCode) {
		settingSession();
		return searchDao.nextSearch(curCode);
	}

	@Override
	public List<Search> getSearchs(int page, String query, String field) {
		settingSession();
		return searchDao.getSearchs(page, query, field);
	}

	@Override
	public int getSize(String query, String field) {
		settingSession();
		return searchDao.getSize(query, field);
	}

	
}
