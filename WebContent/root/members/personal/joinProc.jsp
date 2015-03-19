<%@page import="com.htmtennis.prj.model.Member"%>
<%@page import="com.htmtennis.prj.dao.jdbc.JdbcMemberDao"%>
<%@page import="com.htmtennis.prj.dao.MemberDao"%>
<%@page import="java.util.List"%>

<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%

MemberDao memberDao = new JdbcMemberDao();


String mid = request.getParameter("mid");
String pwd = request.getParameter("pwd");
//String pwd2 = request.getParameter("pwd2");
String name = request.getParameter("name");
String gender = request.getParameter("gender");
String email = request.getParameter("email");
String phone = request.getParameter("phone");
String studentNum = request.getParameter("studentNum");
String authority = request.getParameter("authority");

/* 	if(islunar=="lunar")
	islunar = "true";
else islunar = "false"; */


Member member = new Member();

member.setMid(mid);
member.setPwd(pwd);
member.setName(name);
member.setGender(gender);
member.setEmail(email);
member.setPhone(phone);
member.setStudentNum(studentNum);
member.setAuthority(authority);

if(member.getMid()!=""&&member.getMid()!=null && member.getPwd()!=""&&member.getPwd()!=null
&& member.getName()!=""&&member.getName()!=null
&& member.getEmail()!=""&&member.getEmail()!=null
&& member.getPhone()!=""&&member.getPhone()!=null
&& member.getStudentNum()!=""&&member.getStudentNum()!=null){
	
memberDao.insert(member);
}

	/* && pwd == null && pwd.equals("")
	&& name==null && name.equals("")
	&& gender==null && gender.equals("")
	&& email==null && email.equals("")
	&& phone==null && phone.equals("")
	&& studentNum==null && studentNum.equals("")
	&& authority==null && authority.equals(""))
	 */
	
	
	/* npage=Integer.parseInt(_page); */


//System.out.println(join.getMid());



/* if( join.getPwd()!=""&&join.getPwd()!=null
&& join.getName()!=""&&join.getName()!=null
&& join.getEmail()!=""&&join.getEmail()!=null
&& join.getPhone()!=""&&join.getPhone()!=null
/* && join.getStudentNum()!=""&&join.getStudentNum()!=null ){*/
//joinDao.update(join);
response.sendRedirect("join.jsp");


%>
