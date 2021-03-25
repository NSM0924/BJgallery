<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="/BBS/css/viewer.css">
<title>Insert title here</title>
</head>
<body>
	<div class="main">
        <div class="img-box"><img src=<%= request.getParameter("imgURL") %> alt=""></div>
        <div>
            <p>제목</p>
        </div>
    </div>
</body>
</html>