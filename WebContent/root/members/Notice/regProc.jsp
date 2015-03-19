
<%@page import="com.htmtennis.prj.dao.mybatis.MyBNoticeDao"%>
<%@page import="com.htmtennis.prj.dao.jdbc.jdbcNoticeFileDao"%>
<%@page import="com.htmtennis.prj.dao.NoticeFileDao"%>
<%@page import="com.htmtennis.prj.model.NoticeFile"%>
<%@page import="com.htmtennis.prj.dao.NoticeDao"%>
<%@page import="com.htmtennis.prj.dao.jdbc.JdbcNoticeDao"%>
<%@page import="com.htmtennis.prj.model.Notice"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<%-- <%@page import="com.htmtennis.prj.dao.mybatis.MyBatisMain"%> --%>
<%@page import="org.apache.ibatis.session.SqlSession"%>

<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	
	Notice n = new Notice();
	
	n.setTitle(title);
	n.setWriter("admin");
	n.setContents(content);
	
	
		
	NoticeDao noticeDao = new MyBNoticeDao();
	//NoticeDao noticeDao = new JdbcNoticeDao();
	noticeDao.insert(n);

	
	
	
	

	//목록페이지로 이동
	response.sendRedirect("list.jsp");
%>	
	