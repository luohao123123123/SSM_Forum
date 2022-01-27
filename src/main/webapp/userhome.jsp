<%@ page import="com.YuezhIforum.service.UserServer" %>
<%@ page import="com.YuezhIforum.bean.Posts" %>
<%@ page import="java.util.List" %>
<%@ page import="com.YuezhIforum.bean.User" %>
<%
    String name= (String) request.getSession().getAttribute("name");
    if(name==null){
%>
<h3 style="text-align: center">请先登录</h3>
<%}
else {%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户中心</title>
    <style>
        a{
            text-decoration: none;
            color: #4682B4;
        }
    </style>
</head>
<body>
<div>
            <h2 style="text-align: center;color: #4682B4;margin-top: 10px;"><a href="userShow.jsp" target="home">修改信息</a> &emsp;&emsp;&emsp;<a href="userPosts.jsp" target="home">我的帖子</a></h2></p>
            <iframe name="home" width="100%" height="800px" frameborder="0" src="userInformation.jsp?postsauthor=<%=name%>"></iframe>
</div>
</body>
</html>
<%
    }
%>