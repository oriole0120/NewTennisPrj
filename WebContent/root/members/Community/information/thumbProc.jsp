<%@page import="com.htmtennis.prj.dao.mybatis.MyBInformationDao"%>
<%@page import="com.htmtennis.prj.dao.mybatis.MyBatisMain"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.htmtennis.prj.dao.jdbc.JdbcInformationDao"%>
<%@page import="com.htmtennis.prj.dao.InformationDao"%>
<%@page import="com.htmtennis.prj.model.Information"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
   String code = request.getParameter("c");

   InformationDao informationDao = new MyBInformationDao();
   informationDao.recommend(code);
   
   String url = String.format("view.jsp?c=%s", code);
   response.sendRedirect(url);
 
%>