<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>

<%
	request.setCharacterEncoding("utf-8");
	Member member = (Member)request.getAttribute("members");    
%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
	*{
		margin : 0 auto;
		padding : 0;
	}
	#button{
		margin-top : 20px;
		margin-left : 225px;
	}
	#memberName{
		color:#1f4e5f;
		margin-top : 50px;
		text-align : center;
		font-size:15px;
	}
	#memberPwd {
		text-align : center;
	}
</style>
</head>
	<body>
		<div class="wrap">
		<div id="memberName">[<%=member.getMemberName() %>]님의 비밀번호는</div><br>
		<div id="memberPwd">[<%=member.getMemberPwd() %>] 입니다.</div>
		<button id="button" class="btn btn-outline-info " onclick="location.href = '<%= contextPath %>/loginForm.me';">로그인 하러가기</button>
		</div>
	</body>
	
	
</html>