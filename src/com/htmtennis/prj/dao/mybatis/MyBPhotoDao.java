package com.htmtennis.prj.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.htmtennis.prj.dao.PhotoDao;
import com.htmtennis.prj.model.Photo;

public class MyBPhotoDao implements PhotoDao {

	private SqlSessionFactory factory;
	private SqlSession sqlSession;
	private PhotoDao photoDao;
	
	private void settingSession() {
		factory = MyBatisMain.getSqlSessionFactory();
		sqlSession = factory.openSession(true);
		photoDao = sqlSession.getMapper(PhotoDao.class);
	}
	
	@Override
	public Photo getPhoto(String code) {
		settingSession();
		return photoDao.getPhoto(code);
	}

	@Override
	public Photo prevPhoto(String curCode) {
		settingSession();
		return prevPhoto(curCode);
	}

	@Override
	public Photo nextPhoto(String curCode) {
		settingSession();
		return nextPhoto(curCode);
	}

	@Override
	public List<Photo> getPhotos(int page, String query, String field) {
		settingSession();		
		return photoDao.getPhotos(page, query, field);
	}

	/*@Override
	public List<Photo> getPhotos(int page, String query) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Photo> getPhotos(int page) {
		// TODO Auto-generated method stub
		return null;
	}*/

	@Override
	public int insert(Photo photo) {
		settingSession();
		photoDao.insert(photo);
		
		return 0;
	}

	@Override
	public int update(Photo photo) {
		settingSession();
		photoDao.update(photo);
		
		return 0;
	}

	@Override
	public int delete(String code) {
		settingSession();
		photoDao.delete(code);
		
		return 0;
	}

	@Override
	public int getSize(String query, String field) {
		// TODO Auto-generated method stub
		return 0;
	}

	/*@Override
	public int getSize(String query) {
		// TODO Auto-generated method stub
		return 0;
	}*/

	@Override
	public String lastCode() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int inquiry(String code) {
		settingSession();
		photoDao.inquiry(code);			
		return 0;
	}
	
	@Override
	public int recommend(String code) {
		settingSession();
		photoDao.recommend(code);
		return 0;
	}
	
	

}
