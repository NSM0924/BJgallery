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
    <link rel="stylesheet" href="/BBS/css/menu.css">
    <link rel="stylesheet" href="/BBS/css/main.css">
    <script src="<%=request.getContextPath()%>/js/jquery-1.12.3.js"></script>
    <script src="<%=request.getContextPath()%>/js/menu.js"></script>
    <script src="<%=request.getContextPath()%>/js/main.js"></script>
    <script src="/BBS/js/likey2.js"></script>
    <script src="/BBS/js/viewer.js"></script>
    <title>범진 갤러리</title>
</head>
<body>
	<%	
		//로그인 여부 확인
		String meuserID = null;
		if(session.getAttribute("userID") != null) {
			meuserID = (String) session.getAttribute("userID");
		}
		request.setCharacterEncoding("utf-8");
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    
	    Class.forName("com.mysql.jdbc.Driver");
		
		String dbURL = "jdbc:mysql://localhost:3306/BBS?characterEncoding=UTF-8&serverTimezone=UTC"; // localhost:3306 포트는 컴퓨터설치된 mysql주소
		String dbID = "root";
		String dbPassword = "namin0924*";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		
		try{			
			pstmt = conn.prepareStatement(
					"select *, rank() over(order by likey desc) As ranking from img;");
			rs = pstmt.executeQuery();
			int n = 0;
	        String[] imguserID = new String[100];
	        String[] title = new String[100];
	        String[] imgURL = new String[100];
	        String[] likey = new String[100];
	        while(rs.next()) { 
	        	imguserID[n] = rs.getString("userID");
	        	title[n] = rs.getString("title");
	      		imgURL[n] = rs.getString("imgURL");
	        	likey[n] = rs.getString("likey");
	        n++;}
	        
	%>
    <header>
        <nav>
            <div class="nav__btm">
                <img src="/BBS/img/logo.png" alt="" class="openmenu" onclick='openNav()'>
                <%
                	if(meuserID == null) {
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
		    	<a href="">랭킹</a>
                <%
                	if(meuserID == null) {
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
                	if(meuserID == null) {
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
    <section class="rank">
                <div class="rank_1">
            <div class="rank_1_img img1">
                <img src="/BBS/img/rank/1r.png" class="rank_num_1">
                <img src=<%=imgURL[0] %> alt="1" class="main_img1">
            </div>
        </div>
        <div class="rank_2">
            <div class="rank_2_img1 img2">
                <img src="/BBS/img/rank/2r.png" class="rank_num_2">
                <img src=<%=imgURL[1] %> alt="2" class="main_img2">
            </div>
            <div class="rank_2_img1 img3">
                <img src="/BBS/img/rank/3r.png" class="rank_num_2">
                <img src=<%=imgURL[2] %> alt="3" class="main_img2">
            </div>
            <div class="rank_2_img1 img4">
                <img src="/BBS/img/rank/4r.png" class="rank_num_2">
                <img src=<%=imgURL[3] %> alt="4" class="main_img2">
            </div>
        </div>
    </section>
    <section class="imgview" id="viewer1">
        <div>
            <div class="view__btm">
                <a href="" class="view__close close1"><span>X</span></a>
            </div>
            <div class="main">
                <div class="img-box"><img src=<%= imgURL[0] %> alt=""></div>
                <div class="img_inf">
                    <p>제목</p>
                    <h2><%=title[0] %></h2>
                    <p></p>
                    <h4><%=imguserID[0] %></h4>
					<input type="text" id="meuserID1" value=<%=meuserID%> class="inf_btn"><br/>
					<input type="text" id="userID1" value=<%=imguserID[0]%> class="inf_btn"><br/>
					<input type="text" id="title1" value="<%=title[0]%>" class="inf_btn">
					<div id="likey1" class="likey_num"><p><%=likey[0] %></p></div>
					<%
                	if(meuserID == null) {
                %>
					<button onclick="loginAlert();">좋아요</button>
				<%
                	} else {
                %>	
                	<input type="button" id="sendButton1" value="좋아요">
                <%
                	}
                %>
                </div>
            </div>
        </div>
    </section>
    <section class="imgview" id="viewer2">
        <div>
            <div class="view__btm">
                <a href="" class="view__close close2"><span>X</span></a>
            </div>
            <div class="main">
                <div class="img-box"><img src=<%= imgURL[1] %> alt=""></div>
                <div class="img_inf">
                    <p>제목</p>
                    <h2><%=title[1] %></h2>
                    <p></p>
                    <h4><%=imguserID[1] %></h4>
                    <input type="text" id="meuserID2" value=<%=meuserID%> class="inf_btn"><br/>
					<input type="text" id="userID2" value=<%=imguserID[1]%> class="inf_btn"><br/>
					<input type="text" id="title2" value="<%=title[1]%>" class="inf_btn">
					<div id="likey2" class="likey_num"><p><%=likey[1] %></p></div>
					<%
                	if(meuserID == null) {
                %>
					<button onclick="loginAlert();">좋아요</button>
				<%
                	} else {
                %>	
                	<input type="button" id="sendButton2" value="좋아요">
                <%
                	}
                %>
                </div>
            </div>
        </div>
    </section>
    <section class="imgview" id="viewer3">
        <div>
            <div class="view__btm">
                <a href="" class="view__close close3"><span>X</span></a>
            </div>
            <div class="main">
                <div class="img-box"><img src=<%= imgURL[2] %> alt=""></div>
                <div class="img_inf">
                    <p>제목</p>
                    <h2><%=title[2] %></h2>
                    <p></p>
                    <h4><%=imguserID[2] %></h4>
                    <input type="text" id="meuserID3" value=<%=meuserID%> class="inf_btn"><br/>
					<input type="text" id="userID3" value=<%=imguserID[2]%> class="inf_btn"><br/>
					<input type="text" id="title3" value="<%=title[2]%>" class="inf_btn">
					<div id="likey3" class="likey_num"><p><%=likey[2] %></p></div>
					<%
                	if(meuserID == null) {
                %>
					<button onclick="loginAlert();">좋아요</button>
				<%
                	} else {
                %>	
                	<input type="button" id="sendButton3" value="좋아요">
                <%
                	}
                %>
                </div>
            </div>
        </div>
    </section>
    <section class="imgview" id="viewer4">
        <div>
            <div class="view__btm">
                <a href="" class="view__close close4"><span>X</span></a>
            </div>
            <div class="main">
                <div class="img-box"><img src=<%= imgURL[3] %> alt=""></div>
                <div class="img_inf">
                    <p>제목</p>
                    <h2><%=title[3] %></h2>
                    <p></p>
                    <h4><%=imguserID[3] %></h4>
                    <input type="text" id="meuserID4" value=<%=meuserID%> class="inf_btn"><br/>
					<input type="text" id="userID4" value=<%=imguserID[3]%> class="inf_btn"><br/>
					<input type="text" id="title4" value="<%=title[3]%>" class="inf_btn">
					<div id="likey4" class="likey_num"><p><%=likey[3] %></p></div>
					<%
                	if(meuserID == null) {
                %>
					<button onclick="loginAlert();">좋아요</button>
				<%
                	} else {
                %>	
                	<input type="button" id="sendButton4" value="좋아요">
                <%
                	}
                %>
                </div>
            </div>
        </div>
    </section>
    <section id="nav_bg"></section><%
		
		
	   } catch(SQLException ex){
           out.println(ex.getMessage());
           ex.printStackTrace();
	}
	%>
</body>
</html>