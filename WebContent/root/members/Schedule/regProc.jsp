
<%-- <%@page import="com.htmtennis.prj.dao.mybatis.MyBatisMain"%> --%>

<%@page import="java.util.Date"%>
<%@page import="com.htmtennis.prj.dao.jdbc.JdbcScheduleDao"%>
<%@page import="com.htmtennis.prj.dao.ScheduleDao"%>
<%@page import="com.htmtennis.prj.model.Schedule"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>

<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	ServletContext ctx = request.getServletContext();
	String path = ctx.getRealPath("/root/members/Schedule/upload");
	out.print(path + "<br />");

	/* MultipartRequest req = new MultipartRequest(request
							, path
							, 1024 * 1024 * 10
							, "UTF-8"
							, new DefaultFileRenamePolicy()); */

	String title = request.getParameter("title");
	//String schedulename = request.getFilesystemName("file");
	String content = request.getParameter("content");
	//String eventdate = toString(request.getParameter("eventdate"));
	String eventdate = request.getParameter("eventdate");
	
	out.print(eventdate);
	out.print(title);
	
	
	/* out.print(path + "<br />");
	out.print(path + "<br />");
	out.print(path + "<br />"); */

	Schedule s = new Schedule();
	
	s.setTitle(title);
	s.setWriter("admin");
	s.setContents(content);
	s.setEventdate(eventdate);
	
	/* if(filename)
		free.setFileName();  */

	/* SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true); */
		
	
	ScheduleDao scheduleDao = new JdbcScheduleDao();
	scheduleDao.insert(s);

	  /* if (req.getFile("file") != null) {

		 String Schedulecode = scheduleDao.lastCode();
		 
		 ScheduleFile scheduleFile = new ScheduleFile();
		 
		 scheduleFile.setSchedulename(schedulename);
		 scheduleFile.setSchedulecode(Schedulecode);
		 //scheduleFile.setSchedulevent(schedulevent);
			
		 ScheduleFileDao fileDao = new JdbcScheduleFileDao();
			fileDao.insert(scheduleFile); 
		 
	} */
	 
	
	

	//목록페이지로 이동
	response.sendRedirect("list.jsp");
%>	
	