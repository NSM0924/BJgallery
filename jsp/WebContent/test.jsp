<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import="java.sql.*" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%
    request.setCharacterEncoding("UTF-8"); 
String userID = null;
if(session.getAttribute("userID") != null) {
	userID = (String) session.getAttribute("userID");
}
%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
	* {
		padding: 0;
		margin: 0;
	}
</style>
<title>Insert title here</title>
<script type="text/javascript" src="/BBS/js/jquery-1.12.3.js"></script>
<script type="text/javascript">
    $(function(){
        $("#sendButton").click(function() {
            var params = "&userID=" + $("#userID").val() +
            "&title=" + $("#title").val(); //쿼리임 데이터만 넘길 것!
            $.ajax({
                type:"POST",                //전송방식
                url:"test2_ok.jsp",    //주소
                data:params,
                dataType : "text",
                error : function(){
                    alert('실패');
                },
                success : function(data){
                    $("#likey").html(data) ;
                }
            });
        });
    });
 
    function showRequest(){ 
        var flag = true; //무조건 일단 true
        if(!$("#title").val()) { //jQuery에서 가져오는 값이 없으면,
 
            alert("제목을 입력하세요!");
            $("#title").focus();
            return false;
        }
        if(!$("#userID").val()) { 
 
            alert("내용을 입력하세요!");
            $("#userID").focus();
            return false;
 
        }
        // subject, content 둘 다 값이 넣어져 있으면
        return flag;
    }
 
</script>
 
 
 
</head>
<body>
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
      String[] imgURL = new String[100];
      String[] imgTitle = new String[100];
      String[] likey = new String[100];
      while(rs.next()) { 
      	imgURL[n] = rs.getString("imgURL");
      	imgTitle[n] = rs.getString("title");
      	likey[n] = rs.getString("likey");
      n++;
      }
      
%>
 
아이디:<input type="text" id="userID" value=<%=userID%>><br/>
제목:<input type="text" id="title" value=<%=imgTitle[0]%>>
<input type="button" id="sendButton" value="보내기"><br>
<div id="likey">좋아요:<%=likey[0] %></div>
<br/>
<br/>
<!-- 출력할 위치 지정 --><%
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