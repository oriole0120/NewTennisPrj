
<%@page import="com.htmtennis.prj.dao.mybatis.MyBNoticeDao"%>
<%@page import="com.htmtennis.prj.dao.jdbc.JdbcNoticeDao"%>
<%@page import="com.htmtennis.prj.dao.NoticeDao"%>
<%@page import="com.htmtennis.prj.model.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  
<% 
   String code = request.getParameter("c");
   
   //Notice n = new Notice();
   
   //NoticeDao nDao = new JdbcNoticeDao();
   
   NoticeDao noticeDao = new MyBNoticeDao();
   noticeDao.delete(code);
   
   response.sendRedirect("list.jsp");
%>