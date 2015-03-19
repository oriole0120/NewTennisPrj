<%@page import="java.io.Console"%>
<%@page import="com.htmtennis.prj.dao.mybatis.MyBPhotoDao"%>
<%@page import="com.htmtennis.prj.dao.jdbc.JdbcPhotoFileDao"%>
<%@page import="com.htmtennis.prj.dao.mybatis.MyBatisMain"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.htmtennis.prj.dao.PhotoFileDao"%>
<%@page import="com.htmtennis.prj.model.PhotoFile"%>
<%@page import="com.htmtennis.prj.dao.PhotoDao"%>
<%@page import="com.htmtennis.prj.model.Photo"%>

<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%

	/* out.println("ir1 : "+request.getParameter("ir1"));
	out.println("\ncontent!!!!!"); */

 	ServletContext ctx = request.getServletContext();
	String path = ctx.getRealPath("/root/members/Gallery/photo/upload");
	out.print(path + "<br />");

	/* MultipartRequest req = new MultipartRequest(request
									, path
									, 1024 * 1024 * 10
									, "UTF-8"
									, new DefaultFileRenamePolicy()); */

									
	
	
	String title = request.getParameter("title");							
//	String filename = request.getFilesystemName("file");
	String contents = request.getParameter("content");
	
	Photo photo = new Photo();
	photo.setTitle(title);
	photo.setWriter("admin");
	photo.setContents(contents);
//	photo.setFileName(file);
	
//	PhotoFileDao fileDao = sqlSession.getMapper(PhotoFileDao.class);
	PhotoFileDao fileDao = new JdbcPhotoFileDao();
	
	PhotoDao photoDao = new MyBPhotoDao();
	photoDao.insert(photo);


	/* if (req.getFile("file") != null) {

		String photoCode = photoDao.lastCode();

		PhotoFile photoFile = new PhotoFile();
		//photoFile.setPhotoName(filename);
		photoFile.setPhotoCode(photoCode);

		
		fileDao.insert(photoFile);
	} */
	
	String url = String.format("view.jsp?c=%s", photo.getCode());
	response.sendRedirect(url);
%>	
	