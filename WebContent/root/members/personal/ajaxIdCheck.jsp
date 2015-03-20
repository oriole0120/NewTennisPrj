<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<%
	String id = request.getParameter("id");

	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

	Connection con = null;
	String sql = null;
	PreparedStatement  pstmt = null;
	ResultSet rs = null;

	int result = 0; 
	
	String url = "jdbc:sqlserver://win.newlecture.com:1433;datebaseName=tennisdb";
	
	try {
		con = DriverManager.getConnection(url,"tennis","tennis89");
		sql = "select count(*) from members where mid = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
	
		rs = pstmt.executeQuery();
		rs.next();
		result = rs.getInt(1);

	} catch (SQLException e) {
		System.out.println("Error Source:ajaxIdCheck.jsp : SQLException");
		System.out.println("SQLState : " + e.getSQLState());
		System.out.println("Message : " + e.getMessage());
		System.out.println("Oracle Error Code : " + e.getErrorCode());
		System.out.println("Query : " + sql);
	} finally {
		rs.close();
		pstmt.close();
		con.close();
	}
	
	out.println ( result + "|" + id);
%>