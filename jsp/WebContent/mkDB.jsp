<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>유저 DB 생성</title>
  </head>
  <body>
    <%
    request.setCharacterEncoding("utf-8");
    Connection conn = null;
    PreparedStatement pstmt = null;
    
    Class.forName("com.mysql.jdbc.Driver");
    
    String userID = (String) session.getAttribute("userID");

    try{
  		String jdbcDriver = "jdbc:mysql://localhost:3306/BBS?characterEncoding=UTF-8&serverTimezone=UTC"; // localhost:3306 포트는 컴퓨터설치된 mysql주소
  		String dbUser = "root";
  		String dbPass = "namin0924*";
  		
  		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
  		
  		pstmt = conn.prepareStatement(
  				"create table " + userID + "IMG"
				+ "("
				+ "number int unsigned not null primary key auto_increment,"
				+ "title varchar(150) not null,"
				+ "imgURL varchar(200) not null,"
				+ "likey int not null default '0',"
				+ "userID varchar(20) not null"
				+ ");");
  		System.out.println(pstmt + "<-- pstmt 1");
  		System.out.println(pstmt.getClass() + "<-- pstmt.getClass() 1");
  		System.out.println(pstmt + "<-- pstmt 2");
  		pstmt.executeUpdate();
      
      %>
      <script>
      	location.href = 'main.jsp'
      </script>
    <%
    }finally{
		if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		if (conn != null) try { conn.close(); } catch(SQLException ex) {}		
	}

    %>
</body>
</html>