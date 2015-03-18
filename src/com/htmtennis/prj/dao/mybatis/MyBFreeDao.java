package com.htmtennis.prj.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.htmtennis.prj.dao.FreeDao;
import com.htmtennis.prj.model.Free;

public class MyBFreeDao implements FreeDao{

	private SqlSessionFactory factory;
	private SqlSession sqlSession;
	private FreeDao freeDao;
	
	private void settingSession() {
		factory = MyBatisMain.getSqlSessionFactory();
		sqlSession = factory.openSession(true);
		freeDao = sqlSession.getMapper(FreeDao.class);
	}
	
	@Override
	public Free getFree(String code) {
		settingSession();
		return freeDao.getFree(code);
		
	}

	@Override
	public Free prevFree(String curCode) {
		return null;
		
	}

	@Override
	public Free nextFree(String curCode) {
		return null;
		
	}

	@Override
	public List<Free> getFrees(int page, String query, String field) {
		
		settingSession();		
		return freeDao.getFrees(page, query, field);
		
	}

/*	@Override
	public List<Free> getFrees(int page, String query) {
		return null;
		
	}

	@Override
	public List<Free> getFrees(int page) {
		return null;
		
	}*/

	@Override
	public int insert(Free free) {
		return 0;
		
	}

	@Override
	public int update(Free free) {
		return 0;
		
	}

	@Override
	public int delete(String code) {
		settingSession();
		freeDao.delete(code);
		return 0;
	}

	@Override
	public int getSize(String query, String field) {
		return 0;
		
	}

/*	@Override
	public int getSize(String query) {
		return 0;
		
	}*/

	@Override
	public String lastCode() {
		return null;
		
	}
	
}
