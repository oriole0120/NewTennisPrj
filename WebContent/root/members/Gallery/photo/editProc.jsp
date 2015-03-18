<%@page import="com.htmtennis.prj.dao.mybatis.MyBPhotoDao"%>
<%@page import="com.htmtennis.prj.dao.PhotoDao"%>
<%@page import="com.htmtennis.prj.model.Photo"%>

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
	
	Photo photo = new Photo();
	photo.setCode(code);
	photo.setTitle(title);
	photo.setContents(contents);
	
	PhotoDao photoDao = new MyBPhotoDao();
	photoDao.update(photo);

	String url = String.format("view.jsp?c=%s", code);
	response.sendRedirect(url); 
%>	
	