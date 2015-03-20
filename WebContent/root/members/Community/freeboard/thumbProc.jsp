<%@page import="com.htmtennis.prj.dao.mybatis.MyBFreeDao"%>
<%@page import="com.htmtennis.prj.dao.mybatis.MyBatisMain"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.htmtennis.prj.dao.jdbc.JdbcFreeDao"%>
<%@page import="com.htmtennis.prj.dao.FreeDao"%>
<%@page import="com.htmtennis.prj.model.Free"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
   	String code = request.getParameter("c");

	FreeDao freeDao = new MyBFreeDao();
   	freeDao.recommend(code);
   
   	String url = String.format("view.jsp?c=%s", code);
   	response.sendRedirect(url);

%>