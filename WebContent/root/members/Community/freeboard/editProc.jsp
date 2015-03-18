<%@page import="com.htmtennis.prj.dao.mybatis.MyBFreeDao"%>
<%@page import="com.htmtennis.prj.dao.jdbc.JdbcFreeDao"%>
<%@page import="com.htmtennis.prj.dao.jdbc.JdbcFreeFileDao"%>
<%@page import="com.htmtennis.prj.dao.FreeFileDao"%>
<%@page import="com.htmtennis.prj.model.FreeFile"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.htmtennis.prj.dao.FreeDao"%>
<%-- <%@page import="com.htmtennis.prj.dao.mybatis.MyBatisMain"%> --%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.htmtennis.prj.model.Free"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
/* 	ServletContext ctx = request.getServletContext();
	String path = ctx.getRealPath("/root/members/Community/freeboard/upload");
	out.print(path + "<br />");

	String title = request.getParameter("title");
	String content = request.getParameter("content");

	Free fr = new Free();
	
	fr.setTitle(title);
	fr.setWriter("admin");
	fr.setContents(content);
	
	FreeDao freeDao = new MyBFreeDao();
	
	freeDao.insert(fr);

	response.sendRedirect("list.jsp"); */
	
	
	
	String code = request.getParameter("code");								
	String title = request.getParameter("title");								
	String contents = request.getParameter("content");
	
	Free fr = new Free();
	fr.setCode(code);
	fr.setTitle(title);
	fr.setContents(contents);
	
	FreeDao freeDao = new MyBFreeDao();
	freeDao.update(fr);

	String url = String.format("view.jsp?c=%s", code);
	response.sendRedirect(url); 
%>	
	
