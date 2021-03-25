<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import="java.sql.*" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<style>
	p {
		padding: 0;
		margin-top: 30px;
	}
</style>
<title>좋아요 DB</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    Class.forName("com.mysql.jdbc.Driver");
    
		String meuserID = request.getParameter("meuserID");
		String userID = request.getParameter("userID");
		String title = request.getParameter("title");
	
	String dbURL = "jdbc:mysql://localhost:3306/BBS?characterEncoding=UTF-8&serverTimezone=UTC"; // localhost:3306 포트는 컴퓨터설치된 mysql주소
	String dbID = "root";
	String dbPassword = "namin0924*";
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
	try{
		pstmt = conn.prepareStatement(
				"INSERT INTO likey VALUES (?,?);");
		pstmt.setString(1, meuserID+title);
  		pstmt.setString(2, title);
		pstmt.executeUpdate();
		
		pstmt = conn.prepareStatement(
				"update "+userID+"img set likey = likey + 1 where title = '"+title+"';");
		pstmt.executeUpdate();
		pstmt = conn.prepareStatement(
				"update img set likey = likey + 1 where title = '"+title+"';");
		pstmt.executeUpdate();
		
		pstmt = conn.prepareStatement(
				"select * from "+userID+"img where title = '"+title+"';");
		rs = pstmt.executeQuery();
		int n = 0;
        String[] likey = new String[100];
        while(rs.next()) { 
        	likey[n] = rs.getString("likey");
        n++;}%>
        <p><%=likey[0] %></p>
        <%
		
		
	   } catch(Exception e) {
					pstmt = conn.prepareStatement("delete from likey where idTitle='"+meuserID+title+"';");
					pstmt.executeUpdate();
					pstmt = conn.prepareStatement("update "+userID+"img set likey = likey - 1 where title = '"+title+"';");
					pstmt.executeUpdate();
					pstmt = conn.prepareStatement("update img set likey = likey - 1 where title = '"+title+"';");
					pstmt.executeUpdate();
					
					pstmt = conn.prepareStatement(
							"select * from "+userID+"img where title = '"+title+"';");
					rs = pstmt.executeQuery();
					int n = 0;
			        String[] likey = new String[100];
			        while(rs.next()) { 
			        	likey[n] = rs.getString("likey");
			        n++;}
			        %> <p><%=likey[0] %></p> <%
	}
	%>
        
	
</body>
</html>