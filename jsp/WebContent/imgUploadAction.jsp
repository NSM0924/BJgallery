<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>이미지 업로드</title>
  </head>
  <body>
    <%
    int fileSize = 1024*1024*3; //3mb로 파일 크기를 제한 
    ServletContext context = getServletContext();
    String uploadPath = context.getRealPath("/imgSave");
    request.setCharacterEncoding("utf-8");
    Connection conn = null;
    PreparedStatement pstmt = null;
    
    Class.forName("com.mysql.jdbc.Driver");
    
    String userID = (String) session.getAttribute("userID");
    
    MultipartRequest multi = null;

    try{
      multi = new MultipartRequest(request, uploadPath, fileSize, "UTF-8",new DefaultFileRenamePolicy());
      String originalFile = multi.getOriginalFileName("uploadfile");
      String uploadFile = multi.getFilesystemName("uploadfile");
      String title = multi.getParameter("title");
      String imgURL= "'/BBS/imgSave/" + uploadFile +"'";
  		String jdbcDriver = "jdbc:mysql://localhost:3306/BBS?characterEncoding=UTF-8&serverTimezone=UTC"; // localhost:3306 포트는 컴퓨터설치된 mysql주소
  		String dbUser = "root";
  		String dbPass = "namin0924*";
  		
  		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
  		
  		pstmt = conn.prepareStatement(
  				"INSERT INTO "+userID+"IMG VALUES (null, ?, ?, 0, ?)");
  		System.out.println(pstmt + "<-- pstmt 1");
  		System.out.println(pstmt.getClass() + "<-- pstmt.getClass() 1");
  		pstmt.setString(1, title);
  		pstmt.setString(2, imgURL);
  		pstmt.setString(3, userID);
  		System.out.println(pstmt + "<-- pstmt 2");
  		pstmt.executeUpdate();
  		
  		pstmt = conn.prepareStatement(
  				"INSERT INTO IMG VALUES (?, ?, 0, ?)");
  		System.out.println(pstmt + "<-- pstmt 1");
  		System.out.println(pstmt.getClass() + "<-- pstmt.getClass() 1");
  		pstmt.setString(1, title);
  		pstmt.setString(2, imgURL);
  		pstmt.setString(3, userID);
  		System.out.println(pstmt + "<-- pstmt 2");
  		pstmt.executeUpdate();
      
      %>
      <script>
      	location.href = "myGallery.jsp"
      </script>
    <%
    }catch(Exception e){
      out.write("업로드 용량 오류 또는 그 이외..." + e.getMessage());
    }finally{
		if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		if (conn != null) try { conn.close(); } catch(SQLException ex) {}		
	}

    %>

</body>
</html>