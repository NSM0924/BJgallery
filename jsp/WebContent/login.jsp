<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/login.css?after">
    <title>범진 갤러리 : 로그인</title>
</head>
<body - ondragstart='return false'>
	<form class="box" action="loginAction.jsp" method="post">
		<div class="box2">
        	<img src="<%=request.getContextPath()%>/img/logo.png" alt="logo">
        	<h1>범진 갤러리</h1>
        	<h2>Login</h2>
        	<input type="text" name="userID" placeholder="아이디">
        	<input type="password" name="userPassword" placeholder="비밀번호">
        	<input type="submit" value="로그인">
        	<a id="signup" href="<%=request.getContextPath()%>/join.jsp">회원가입하기</a>
    	</div>
    </form>
</body>
</html>