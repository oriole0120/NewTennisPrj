package com.htmtennis.prj.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.htmtennis.prj.dao.FreeDao;
import com.htmtennis.prj.dao.InformationDao;
import com.htmtennis.prj.model.Information;

public class MyBInformationDao implements InformationDao {

	/*private SqlSessionFactory factory;
	private SqlSession sqlSession;
	private InformationDao informationDao;
	
	private void settingSession() {
		SqlSessionFactory factory = MyBatisMain.getSqlSessionFactory();
		SqlSession sqlSession = factory.openSession(true);
		InformationDao informationDao = sqlSession.getMapper(InformationDao.class);
	}*/
	
	@Override
	public Information getInformation(String code) {
		SqlSessionFactory factory = MyBatisMain.getSqlSessionFactory();
		SqlSession sqlSession = factory.openSession(true);
		InformationDao informationDao = sqlSession.getMapper(InformationDao.class);
		
		return informationDao.getInformation(code);
		
	}

	@Override
	public Information prevInformation(String curCode) {
		SqlSessionFactory factory = MyBatisMain.getSqlSessionFactory();
		SqlSession sqlSession = factory.openSession(true);
		InformationDao informationDao = sqlSession.getMapper(InformationDao.class);
		
		return informationDao.prevInformation(curCode);
		
	}

	@Override
	public Information nextInformation(String curCode) {
		SqlSessionFactory factory = MyBatisMain.getSqlSessionFactory();
		SqlSession sqlSession = factory.openSession(true);
		InformationDao informationDao = sqlSession.getMapper(InformationDao.class);
		
		return informationDao.nextInformation(curCode);
		
	}

	@Override
	public List<Information> getInformations(int page, String query,
			String field) {
		
		return null;
		
	}

	/*@Override
	public List<Information> getInformations(int page, String query) {
		return null;
		
	}

	@Override
	public List<Information> getInformations(int page) {
		return null;
		
	}*/

	@Override
	public int insert(Information information) {
		SqlSessionFactory factory = MyBatisMain.getSqlSessionFactory();
		SqlSession sqlSession = factory.openSession(true);
		InformationDao informationDao = sqlSession.getMapper(InformationDao.class);
		
		informationDao.insert(information);
		
		return 0;
		
	}

	@Override
	public int update(Information information) {
		SqlSessionFactory factory = MyBatisMain.getSqlSessionFactory();
		SqlSession sqlSession = factory.openSession(true);
		InformationDao informationDao = sqlSession.getMapper(InformationDao.class);
		informationDao.update(information);
		
		return 0;
		
	}

	@Override
	public int delete(String code) {
		SqlSessionFactory factory = MyBatisMain.getSqlSessionFactory();
		SqlSession sqlSession = factory.openSession(true);
		InformationDao informationDao = sqlSession.getMapper(InformationDao.class);
		
		informationDao.delete(code);
		
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

	@Override
	public int inquiry(String code) {
		SqlSessionFactory factory = MyBatisMain.getSqlSessionFactory();
		SqlSession sqlSession = factory.openSession(true);
		InformationDao informationDao = sqlSession.getMapper(InformationDao.class);
		
		informationDao.inquiry(code);
		
		return 0;
	}

	@Override
	public int recommend(String code) {
		SqlSessionFactory factory = MyBatisMain.getSqlSessionFactory();
		SqlSession sqlSession = factory.openSession(true);
		InformationDao informationDao = sqlSession.getMapper(InformationDao.class);
		
		informationDao.recommend(code);
		
		return 0;
	}

}
