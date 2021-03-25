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
    <meta http-equiv="Content-Type" content="text/html;" charset="UTF-8">
    <script src="/BBS/js/jquery-1.12.3.js"></script>
    <script src="/BBS/js/menu.js"></script>
    <script src="/BBS/js/gallery.js"></script>
    <script src="/BBS/js/Flikey.js"></script>
    <link rel="stylesheet" href="/BBS/css/menu.css">
    <link rel="stylesheet" href="/BBS/css/gallery.css">
    <link rel="stylesheet" href="/BBS/css/gallery_img.css">
    <style>
        #idtext{
            display: none;
        }
        canvas { border: solid 0px black; display: block; 
                width: 100%;      
        }
        nav {
        	box-shadow:  rgba(0, 0, 0, 0.376) 0px 0px 20px 4px;
        }
    </style>
    <script type="text/javascript">
    var clsImage;
	var iCropLeft, iCropTop, iCropWidth, iCropHeight;

	// 로컬 이미지 파일을 Canvas 에 로드한다.
	function LoadImage()
	{
		if( typeof window.FileReader !== 'function' )
		{
			alert("FileReader is not supported");
			return;
		}

		var inputFile = document.getElementById('image_file');
		var clsFileReader = new FileReader();
		clsFileReader.onload = function(){
			clsImage = new Image();
			clsImage.onload = function(){
				var canvas = document.getElementById("canvas");
				canvas.width = clsImage.width;
				canvas.height = clsImage.height;

				iCropLeft = 100;
				iCropTop = 100;
				iCropWidth = clsImage.width - 200;
				iCropHeight = clsImage.height - 200;
				iImageWidth = clsImage.width;
				iImageHeight = clsImage.height;

				DrawCropRect();
				AddCropMoveEvent();
			};

			clsImage.src = clsFileReader.result;
		};

		clsFileReader.readAsDataURL(inputFile.files[0]);
	}

	// 로컬 이미지 파일을 위한 사각형 박스를 그려준다.
	function DrawCropRect()
	{
		var canvas = document.getElementById("canvas");
		var ctx = canvas.getContext("2d");
		ctx.drawImage( clsImage, 0, 0 );
	}
	
	function changeBg(bimg){
        var body = document.getElementsByTagName("body");
        body[0].style.backgroundImage="url(" + bimg + ")";
    }
    </script>
    <title>범진 갤러리 : My갤러리</title>
</head>
<body>
	<%
		//로그인 여부 확인
		request.setCharacterEncoding("UTF-8");
		String userID = request.getParameter("userID");
		
		String meuserID = null;
		if(session.getAttribute("userID") != null) {
			meuserID = (String) session.getAttribute("userID");
		}
	%>
    <nav>
        <div class="nav__btm">
            <img src="/BBS/img/logo.png" alt="" class="openmenu" onclick='openNav()'>
            <%
            	if(userID == null) {
            %>
            	<a href="/BBS/login.jsp"><div class="login__btm"><p>로그인</p></div></a>
            <%
            	} else {
            %>
            	<a href="/BBS/logoutAction.jsp"><div class="login__btm"><p>로그아웃</p></div></a>
            <%
            	}
            %>
        </div>
        
        <!-- 메뉴 -->
        <div id="mysidenav" class="sidenav">
            <img  onclick="closeNav()" src="/BBS/img/logo.png" class="closebtn">
            <a href="/BBS/main.jsp">랭킹</a>
            <a href="/BBS/myGallery.jsp">My 갤러리</a>
            <a href="/BBS/friend.jsp">친구 갤러리 보기</a>
        </div>
    </nav>
    <button class="bg_btn" onclick="changeBg('/BBS/img/gallery/bg1.png')">배경1</button>
    <button class="bg_btn" onclick="changeBg('/BBS/img/gallery/bg2.png')">배경2</button>
    <button class="bg_btn" onclick="changeBg('/BBS/img/gallery/bg3.png')">배경3</button>
    <button class="bg_btn" onclick="changeBg('/BBS/img/gallery/bg4.png')">배경4</button>
    <button class="bg_btn" onclick="changeBg('/BBS/img/gallery/bg5.png')">배경5</button>
    <button class="bg_btn" onclick="changeBg('/BBS/img/gallery/bg6.png')">배경6</button>
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
   
            String query = "select * from "+userID+"img";
   
            // 2. 데이터베이스 커넥션 생성
            conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
   
            // 3. Statement 생성
            stmt = conn.createStatement();
   
            // 4. 쿼리 실행
            rs = stmt.executeQuery(query);
   
            // 5. 쿼리 실행 결과 출력
            
            int n = 0;
            int[] opacity = new int[100];
            String[] imgURL = new String[100];
            String[] imgTitle = new String[100];
            String[] likey = new String[100];
            while(rs.next()) { 
            	imgURL[n] = rs.getString("imgURL");
            	imgTitle[n] = rs.getString("title");
            	likey[n] = rs.getString("likey");
            n++;}
            for(int i = 0; i < n; i++){
            	opacity[i] = 100;
            }
            %>  <section id="sec1" class="main_sec">
            		<div>        	
                    	<div class="main_imgbox img1" style="opacity: <%=opacity[0]%>;">
                        	<img src=<%= imgURL[0] %> alt="">
                    	</div>
                    	<div class="main_imgbox img2" style="opacity: <%=opacity[1]%>;">
                        	<img src=<%= imgURL[1] %> alt="">
                    	</div>
                    	<div class="main_imgbox img3" style="opacity: <%=opacity[2]%>;">
                        	<img src=<%= imgURL[2] %> alt="">
                    	</div>
                    </div>
                    	<div>
                    		<button class="mvbtn" onclick=hideParent();>></button>
                		</div>
            	</section>
            	
                <section id="sec2" class="main_sec" style="display: none;">
                	<div>
                    	<div class="main_imgbox img4" style="opacity: <%=opacity[3]%>;">
                        	<img src=<%= imgURL[3] %> alt="">
                    	</div>
                    	<div class="main_imgbox img5" style="opacity: <%=opacity[4]%>;">
                        	<img src=<%= imgURL[4] %> alt="">
                    	</div>
                    	<div class="main_imgbox img6" style="opacity: <%=opacity[5]%>;">
                        	<img src=<%= imgURL[5] %> alt="">
                    	</div>
                	</div>
                	<div>
                    	<button class="mvbtn" onclick=showParent();><</button>
                    	<button class="mvbtn" onclick=hideParent2();>></button>
                	</div>
            	</section>
            	<section id="sec3" class="main_sec" style="display: none;">
                	<div>
                    	<div class="main_imgbox img7" style="opacity: <%=opacity[6]%>;">
                        	<img src=<%= imgURL[6] %> alt="">
                    	</div>
                    	<div class="main_imgbox img8" style="opacity: <%=opacity[7]%>;">
                        	<img src=<%= imgURL[7] %> alt="">
                    	</div>
                    	<div class="main_imgbox img9" style="opacity: <%=opacity[8]%>;">
                        	<img src=<%= imgURL[8] %> alt="">
                    	</div>
                	</div>
                	<div>
                    	<button class="mvbtn" onclick=showParent2();><</button>
                    	<button class="mvbtn" onclick=hideParent3();>></button>
                	</div>
            	</section>
            	<section id="sec4" class="main_sec" style="display: none;">
            		<div>
            			<img class="update" src="/BBS/img/gallery/update.png">
            		</div>
            		<div>
						<h2>업데이트 중..</h2>            		
            		</div>
            		<div>
            			<button class="mvbtn" onclick=showParent3();><</button>
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
                    <h2><%=imgTitle[0] %></h2>
					<input type="text" id="meuserID1" value=<%=meuserID%> class="inf_btn"><br/>
					<input type="text" id="userID1" value=<%=userID%> class="inf_btn"><br/>
					<input type="text" id="title1" value="<%=imgTitle[0]%>" class="inf_btn">
					<div id="likey1"><p><%=likey[0] %></p></div>
					<input type="button" id="sendButton1" value="좋아요">
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
                    <h2><%=imgTitle[1] %></h2>
                    <input type="text" id="meuserID2" value=<%=meuserID%> class="inf_btn"><br/>
					<input type="text" id="userID2" value=<%=userID%> class="inf_btn"><br/>
					<input type="text" id="title2" value="<%=imgTitle[1]%>" class="inf_btn">
					<div id="likey2"><p><%=likey[1] %></p></div>
					<input type="button" id="sendButton2" value="좋아요">
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
                    <h2><%=imgTitle[2] %></h2>
                    <input type="text" id="meuserID3" value=<%=meuserID%> class="inf_btn"><br/>
					<input type="text" id="userID3" value=<%=userID%> class="inf_btn"><br/>
					<input type="text" id="title3" value="<%=imgTitle[2]%>" class="inf_btn">
					<div id="likey3"><p><%=likey[2] %></p></div>
					<input type="button" id="sendButton3" value="좋아요">
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
                    <h2><%=imgTitle[3] %></h2>
                    <input type="text" id="meuserID4" value=<%=meuserID%> class="inf_btn"><br/>
					<input type="text" id="userID4" value=<%=userID%> class="inf_btn"><br/>
					<input type="text" id="title4" value="<%=imgTitle[3]%>" class="inf_btn">
					<div id="likey4"><p><%=likey[3] %></p></div>
					<input type="button" id="sendButton4" value="좋아요">
                </div>
            </div>
        </div>
    </section>
    <section class="imgview" id="viewer5">
        <div>
            <div class="view__btm">
                <a href="" class="view__close close5"><span>X</span></a>
            </div>
            <div class="main">
                <div class="img-box"><img src=<%= imgURL[4] %> alt=""></div>
                <div class="img_inf">
                    <p>제목</p>
                    <h2><%=imgTitle[4] %></h2>
                    <input type="text" id="meuserID5" value=<%=meuserID%> class="inf_btn"><br/>
					<input type="text" id="userID5" value=<%=userID%> class="inf_btn"><br/>
					<input type="text" id="title5" value="<%=imgTitle[4]%>" class="inf_btn">
					<div id="likey5"><p><%=likey[4] %></p></div>
					<input type="button" id="sendButton5" value="좋아요">
                </div>
            </div>
        </div>
    </section>
    <section class="imgview" id="viewer6">
        <div>
            <div class="view__btm">
                <a href="" class="view__close close6"><span>X</span></a>
            </div>
            <div class="main">
                <div class="img-box"><img src=<%= imgURL[5] %> alt=""></div>
                <div class="img_inf">
                    <p>제목</p>
                    <h2><%=imgTitle[5] %></h2>
                    <input type="text" id="meuserID6" value=<%=meuserID%> class="inf_btn"><br/>
					<input type="text" id="userID6" value=<%=userID%> class="inf_btn"><br/>
					<input type="text" id="title6" value="<%=imgTitle[5]%>" class="inf_btn">
					<div id="likey6"><p><%=likey[5] %></p></div>
					<input type="button" id="sendButton6" value="좋아요">
                </div>
            </div>
        </div>
    </section>
    <section class="imgview" id="viewer7">
        <div>
            <div class="view__btm">
                <a href="" class="view__close close7"><span>X</span></a>
            </div>
            <div class="main">
                <div class="img-box"><img src=<%= imgURL[6] %> alt=""></div>
                <div class="img_inf">
                    <p>제목</p>
                    <h2><%=imgTitle[6] %></h2>
                    <input type="text" id="meuserID7" value=<%=meuserID%> class="inf_btn"><br/>
					<input type="text" id="userID7" value=<%=userID%> class="inf_btn"><br/>
					<input type="text" id="title7" value="<%=imgTitle[6]%>" class="inf_btn">
					<div id="likey7"><p><%=likey[6] %></p></div>
					<input type="button" id="sendButton7" value="좋아요">
                </div>
            </div>
        </div>
    </section>
    <section class="imgview" id="viewer8">
        <div>
            <div class="view__btm">
                <a href="" class="view__close close8"><span>X</span></a>
            </div>
            <div class="main">
                <div class="img-box"><img src=<%= imgURL[7] %> alt=""></div>
                <div class="img_inf">
                    <p>제목</p>
                    <h2><%=imgTitle[7] %></h2>
                    <input type="text" id="meuserID8" value=<%=meuserID%> class="inf_btn"><br/>
					<input type="text" id="userID8" value=<%=userID%> class="inf_btn"><br/>
					<input type="text" id="title8" value="<%=imgTitle[7]%>" class="inf_btn">
					<div id="likey8"><p><%=likey[8] %></p></div>
					<input type="button" id="sendButton8" value="좋아요">
                </div>
            </div>
        </div>
    </section>
    <section class="imgview" id="viewer9">
        <div>
            <div class="view__btm">
                <a href="" class="view__close close9"><span>X</span></a>
            </div>
            <div class="main">
                <div class="img-box"><img src=<%= imgURL[8] %> alt=""></div>
                <div class="img_inf">
                    <p>제목</p>
                    <h2><%=imgTitle[8] %></h2>
                    <input type="text" id="meuserID9" value=<%=meuserID%> class="inf_btn"><br/>
					<input type="text" id="userID9" value=<%=userID%> class="inf_btn"><br/>
					<input type="text" id="title9" value="<%=imgTitle[8]%>" class="inf_btn">
					<div id="likey9"><p><%=likey[9] %></p></div>
					<input type="button" id="sendButton9" value="좋아요">
                </div>
            </div>
        </div>
    </section><%
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
  </body>
</html>