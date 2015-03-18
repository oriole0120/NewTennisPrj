<%@page import="com.htmtennis.prj.dao.mybatis.MyBVideoDao"%>
<%@page import="com.htmtennis.prj.dao.VideoDao"%>
<%@page import="com.htmtennis.prj.model.Video"%>

<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	/* MultipartRequest req = new MultipartRequest(request
									, path
									, 1024 * 1024 * 10
									, "UTF-8"
									, new DefaultFileRenamePolicy()); */

	String code = request.getParameter("code");
	String title = request.getParameter("title");								
	String contents = request.getParameter("content");
	
	Video video = new Video();
	video.setCode(code);
	video.setTitle(title);
	video.setContents(contents);
	
	VideoDao videoDao = new MyBVideoDao();
	videoDao.update(video);

	//목록페이지로 이동
	String url = String.format("view.jsp?c=%s", code);
	response.sendRedirect(url); 
%>	
	