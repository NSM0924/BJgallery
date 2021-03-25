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
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/menu.css?after">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/friend.css?after">
    <script src="<%=request.getContextPath()%>/js/jquery-1.12.3.js"></script>
    <script src="<%=request.getContextPath()%>/js/menu.js"></script>
    <title>범진 갤러리 : 친구 목록</title>
</head>
<body>
	<%	
		//로그인 여부 확인
		String userID = null;
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		
		request.setCharacterEncoding("UTF-8");
	%>
    <header>
        <nav>
            <div class="nav__btm">
                <img src="/BBS/img/logo.png" alt="" class="openmenu" onclick='openNav()'>
                <%
                	if(userID == null) {
                %>
                	<div class="login__btm1" onclick="location.href='/BBS/login.jsp';">
                    	<div class="login__btm2">
                        	<p>로그인</p>
                    	</div>
                	</div>
                <%
                	} else {
                %>
                	<div class="login__btm1" onclick="location.href='/BBS/logoutAction.jsp';">
                    	<div class="login__btm2">
                        	<p>로그아웃</p>
                    	</div>
                <%
                	}
                %>
                
            </div>
        </nav>
        <!-- 메뉴 -->
	        <div id="mysidenav" class="sidenav">
                <img  onclick="closeNav()" src="/BBS/img/logo.png" class="closebtn">
		        <a href="/BBS/main.jsp">랭킹</a>
                <%
                	if(userID == null) {
                %>
                	<a href="" onclick="loginAlert();">My 갤러리</a>
                <%
                	} else {
                %>
                	<a href="/BBS/myGallery.jsp">My 갤러리</a>
                <%
                	}
                %>
                
                <%
                	if(userID == null) {
                %>
                	<a href="" onclick="loginAlert();">친구 갤러리 보기</a>
                <%
                	} else {
                %>
                	<a href="/BBS/friend.jsp">친구 갤러리 보기</a>
                <%
                	}
                %>
	        </div>
    </header>
    <hr>
    <div id="title_box">친구목록</div>
    <%
    Class.forName("com.mysql.jdbc.Driver");
  
      Connection conn = null; // DBMS와 Java연결객체
      Statement stmt = null; // SQL구문을 실행
      ResultSet rs = null; // SQL구문의 실행결과를 저장
  
      try
      {
            String jdbcDriver = "jdbc:mysql://localhost:3306/BBS?characterEncoding=UTF-8&serverTimezone=UTC";
            String dbUser = "root";
            String dbPass = "namin0924*";
   
            String query = "SELECT * FROM user WHERE userID!='"+userID+"';";
   
            // 2. 데이터베이스 커넥션 생성
            conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
   
            // 3. Statement 생성
            stmt = conn.createStatement();
   
            // 4. 쿼리 실행
            rs = stmt.executeQuery(query);
   
            // 5. 쿼리 실행 결과 출력
            
            int n = 0;
            String[] usersID = new String[100];
            String[] userName = new String[100];
            //int[] opacity = new int[100];
            String[] display = new String[]{"display:none;", "display:none;", "display:none;", "display:none;",
            		"display:none;", "display:none;", "display:none;", "display:none;", "display:none;",
            		"display:none;", "display:none;", "display:none;", "display:none;", "display:none;", "display:none;"};
            while(rs.next()) {
            	usersID[n] = rs.getString("userID");
            	userName[n] = rs.getString("userName");
            n++;}
            for(int i = 0; i < n; i++){
            	display[i] = "display:block;";
            }
            %>
    <div class="friend_box">
        <div class="sub_box">
            <div style=<%=display[0]%> onclick="location.href='FGallery.jsp?userID= <%=usersID[0] %>'">
                <div class="profile_img"><div class="profile_box">
					<ul>
                        <li><%=usersID[0] %></li>
                        <li><%=userName[0] %></li>
                    </ul>
                </div></div>
            </div>
            <div style=<%=display[1]%> onclick="location.href='FGallery.jsp?userID= <%=usersID[1] %>'">
                <div class="profile_img"><div class="profile_box">
					<ul>
                        <li><%=usersID[1] %></li>
                        <li><%=userName[1] %></li>
                    </ul>
                </div></div>
            </div>
            <div style=<%=display[2]%> onclick="location.href='FGallery.jsp?userID= <%=usersID[2] %>'">
                <div class="profile_img"><div class="profile_box">
					<ul>
                        <li><%=usersID[2] %></li>
                        <li><%=userName[2] %></li>
                    </ul>
                </div></div>
            </div>
            <div style=<%=display[3]%> onclick="location.href='FGallery.jsp?userID= <%=usersID[3] %>'">
                <div class="profile_img"><div class="profile_box">
                    <ul>
                        <li><%=usersID[3] %></li>
                        <li><%=userName[3] %></li>
                    </ul>
                </div></div>
            </div>
            <div style=<%=display[4]%> onclick="location.href='FGallery.jsp?userID= <%=usersID[4] %>'">
                <div class="profile_img"><div class="profile_box">
					<ul>
                        <li><%=usersID[4] %></li>
                        <li><%=userName[4] %></li>
                    </ul>
                </div></div>
            </div>
        </div>
        <div class="sub_box">
            <div style=<%=display[5]%> onclick="location.href='FGallery.jsp?userID= <%=usersID[5] %>'">
                <div class="profile_img"><div class="profile_box">
                    <ul>
                        <li><%=usersID[5] %></li>
                        <li><%=userName[5] %></li>
                    </ul>
                </div></div>
            </div>
            <div style=<%=display[6]%> onclick="location.href='FGallery.jsp?userID= <%=usersID[6] %>'">
                <div class="profile_img"><div class="profile_box">
                	<ul>
                        <li><%=usersID[6] %></li>
                        <li><%=userName[6] %></li>
                    </ul>
                </div></div>
            </div>
            <div style=<%=display[7]%> onclick="location.href='FGallery.jsp?userID= <%=usersID[7] %>'">
                <div class="profile_img"><div class="profile_box">
                	<ul>
                        <li><%=usersID[7] %></li>
                        <li><%=userName[7] %></li>
                    </ul>
                </div></div>
            </div>
            <div style=<%=display[8]%> onclick="location.href='FGallery.jsp?userID= <%=usersID[8] %>'">
                <div class="profile_img"><div class="profile_box">
                	<ul>
                        <li><%=usersID[8] %></li>
                        <li><%=userName[8] %></li>
                    </ul>
                </div></div>
            </div>
            <div style=<%=display[9]%> onclick="location.href='FGallery.jsp?userID= <%=usersID[9] %>'">
                <div class="profile_img"><div class="profile_box">
                	<ul>
                        <li><%=usersID[9] %></li>
                        <li><%=userName[9] %></li>
                    </ul>
                </div></div>
            </div>
        </div>
        <div class="sub_box">
            <div style=<%=display[10]%> onclick="location.href='FGallery.jsp?userID= <%=usersID[10] %>'">
                <div class="profile_img"><div class="profile_box">
                	<ul>
                        <li><%=usersID[10] %></li>
                        <li><%=userName[10] %></li>
                    </ul>
                </div></div>
            </div>
            <div style=<%=display[11]%> onclick="location.href='FGallery.jsp?userID= <%=usersID[11] %>'">
                <div class="profile_img"><div class="profile_box">
                	<ul>
                        <li><%=usersID[11] %></li>
                        <li><%=userName[11] %></li>
                    </ul>
                </div></div>
            </div>
            <div style=<%=display[12]%> onclick="location.href='FGallery.jsp?userID= <%=usersID[12] %>'">
                <div class="profile_img"><div class="profile_box">
                	<ul>
                        <li><%=usersID[12] %></li>
                        <li><%=userName[12] %></li>
                    </ul>
                </div></div>
            </div>
            <div style=<%=display[13]%> onclick="location.href='FGallery.jsp?userID= <%=usersID[13] %>'">
                <div class="profile_img"><div class="profile_box">
                	<ul>
                        <li><%=usersID[13] %></li>
                        <li><%=userName[13] %></li>
                    </ul>
                </div></div>
            </div>
            <div style=<%=display[14]%> onclick="location.href='FGallery.jsp?userID= <%=usersID[14] %>'">
                <div class="profile_img"><div class="profile_box">
                	<ul>
                        <li><%=usersID[14] %></li>
                        <li><%=userName[14] %></li>
                    </ul>
                </div></div>
            </div>
        </div><%
      }catch(SQLException ex){
            out.println(ex.getMessage());
            ex.printStackTrace();
      }finally{
            // 6. 사용한 Statement 종료
            if(rs != null) try { rs.close(); } catch(SQLException ex) {}
            if(stmt != null) try { stmt.close(); } catch(SQLException ex) {}
   
            // 7. 커넥션 종료
            if(conn != null) try { conn.close(); } catch(SQLException ex) {}
      }
%>
    </div>
    <section id="nav_bg"></section>
</body>
</html>