
<%@page import="com.htmtennis.prj.dao.mybatis.MyBNoticeDao"%>
<%@page import="com.htmtennis.prj.dao.NoticeDao"%>
<%@page import="com.htmtennis.prj.model.Notice"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<%-- <%@page import="com.htmtennis.prj.dao.mybatis.MyBatisMain"%> --%>
<%@page import="org.apache.ibatis.session.SqlSession"%>

<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%

	String code = request.getParameter("code");								
	String title = request.getParameter("title");								
	String contents = request.getParameter("content");
	
	Notice n = new Notice();
	n.setCode(code);
	n.setTitle(title);
	n.setContents(contents);
	
	NoticeDao noticeDao = new MyBNoticeDao();
	noticeDao.update(n);

	String url = String.format("view.jsp?c=%s", code);
	response.sendRedirect(url); 
%>	
	
