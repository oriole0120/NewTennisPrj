﻿<%@page import="com.htmtennis.prj.dao.mybatis.MyBPhotoDao"%>
<%@page import="com.htmtennis.prj.dao.mybatis.MyBatisMain"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.htmtennis.prj.dao.PhotoDao"%>
<%@page import="com.htmtennis.prj.model.Photo"%>

<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<% 
	String code = request.getParameter("c");
   
   	PhotoDao photoDao = new MyBPhotoDao();
	photoDao.recommend(code);
   
	String url = String.format("view.jsp?c=%s", code);
	response.sendRedirect(url); 
	
%>