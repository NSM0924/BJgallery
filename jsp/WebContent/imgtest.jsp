<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

 

<html>
<head><title>ȸ�� ���</title></head>
<body>
      MEMBER ���̺��� ����
      <table width = "100%" border = "1">
      <tr>
            <td>��ȣ</td>
            <td>����</td>
            <td>��ũ</td>
            <td>���ƿ�</td>
            <td>�ۼ���</td>
      </tr>
 
<%
      // 1. JDBC ����̹� �ε�
      Class.forName("com.mysql.jdbc.Driver");
  
      Connection conn = null; // DBMS�� Java���ᰴü
      Statement stmt = null; // SQL������ ����
      ResultSet rs = null; // SQL������ �������� ����
  
      try
      {
            String jdbcDriver = "jdbc:mysql://localhost:3306/BBS?characterEncoding=UTF-8&serverTimezone=UTC";
            String dbUser = "root";
            String dbPass = "namin0924*";
   
            String query = "select * from smimg";
   
            // 2. �����ͺ��̽� Ŀ�ؼ� ����
            conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
   
            // 3. Statement ����
            stmt = conn.createStatement();
   
            // 4. ���� ����
            rs = stmt.executeQuery(query);
   
            // 5. ���� ���� ��� ���
            int n = 1;
            while(rs.next())
            {
%>
      <tr>
            <td id='<%= n %>'><%= rs.getString("number") %></td>
            <td id='<%= n %>'><%= rs.getString("title") %></td>
            <td id='<%= n %>'><%= rs.getString("imgURL") %></td>
            <td id='<%= n %>'><%= rs.getString("likey") %></td>
            <td id='<%= n %>'><%= rs.getString("userID") %></td>
      </tr>
<% n++;
            }
      }catch(SQLException ex){
            out.println(ex.getMessage());
            ex.printStackTrace();
      }finally{
            // 6. ����� Statement ����
            if(rs != null) try { rs.close(); } catch(SQLException ex) {}
            if(stmt != null) try { stmt.close(); } catch(SQLException ex) {}
   
            // 7. Ŀ�ؼ� ����
            if(conn != null) try { conn.close(); } catch(SQLException ex) {}
      }
%>
      </table>
</body>
</html>