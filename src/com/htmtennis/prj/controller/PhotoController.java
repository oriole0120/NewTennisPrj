package com.htmtennis.prj.controller;

import com.htmtennis.prj.dao.mybatis.MyBPhotoDao;
import com.htmtennis.prj.dao.mybatis.MyBatisMain;

import org.apache.ibatis.session.SqlSession;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.htmtennis.prj.dao.PhotoDao;
import com.htmtennis.prj.model.Photo;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class PhotoController implements Controller {

		@Override
		public ModelAndView handleRequest(HttpServletRequest request,
				HttpServletResponse response) throws Exception {
			
			//String ctx = request.getContextPath();
						
			int npage = 1;
			String nquery="";
			String nfield="TITLE";
			
			String _page = request.getParameter("pg");
			String _query = request.getParameter("qy");
			String _field = request.getParameter("fd");
			
			if(_page != null && !_page.equals(""))
				npage = Integer.parseInt(_page);
			if(_query!= null && !_query.equals(""))
				nquery = _query;
			if(_field!= null && !_field.equals(""))
				nfield = _field;
			
			
			SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
			PhotoDao photoDao = sqlSession.getMapper(PhotoDao.class); 
		
	//		PhotoDao photoDao = new MyBPhotoDao();
			List<Photo> list = photoDao.getPhotos(npage, nquery, nfield);
			
			ModelAndView mv = new ModelAndView("list.jsp");
			
			mv.addObject("list", list);
			mv.addObject("total", photoDao.getSize("", "TITLE"));
			
			return mv;
		}
}
