<%@ page import="com.YuezhIforum.bean.User" %>
<%@ page import="com.YuezhIforum.service.UserServer" %><%
    UserServer server= (UserServer) request.getSession().getAttribute("server");
    String name= (String) request.getSession().getAttribute("name");
        String postsauthor = request.getParameter("postsauthor");
        User user = null;
        int count = 0;
        if (name.equals(postsauthor)) {
            user = server.login(name);
            int uid = server.findUseId(name);
            count = server.userpostsCount(uid);
        } else {
            user = server.login(postsauthor);
            int uid = server.findUseId(postsauthor);
            count = server.userpostsCount(uid);
        }

%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title><%=user.getName()%>的用户信息</title>
</head>
<body>

<div>
    <div style="width: 50%;height: 650px;background-color:lavender;margin-left: 200px">
        <div><img style="margin:55px 125px;height: 150px;width: 150px;" src="/imgs/<%=user.getImg()%>"></div>
        <div style="text-align: center">
            <span style="color: #4682B4;font-size: 25px"><%=user.getName()%></span>&emsp;
            <%
                if(user.getSex().equals("男")) {%>
                    <span><img style="height: 25px;width: 25px;" src="/imgs/man.png"></span>
                <%}
                else {%>
            <span><img style="height: 25px;width: 25px;margin-top: 3px" src="/imgs/woman.png"></span>
                <%}
            %>
        </div>
        <div style="height: 15px"></div>
        <div style="text-align: center;margin-top: 5px;background: lavender">
            <button style="height: 80px;background-color:lavender;width: 150px;border: aliceblue 1px solid">
                <p style="font-size: 18px"><%=count%></p>
                <p style="font-size: 10px">帖子数量</p>
            </button>
        </div>
        <div style="text-align: center">
            <p>学校&ensp;:&ensp; <%=user.getSchool()%></p>
        </div>
        <div style="">
            <p style="padding-left: 150px">年龄&ensp;:&ensp; <%=user.getAge()%></p>
        </div>
        <%
            if(postsauthor.equals(name)){
        %>
        <div style="text-align: center">
            <button style="background-color:lavender;border: aliceblue 1px solid"><a href="userComment.jsp?username=<%=name%>" style="text-decoration: none;color: #4682B4" title="查看我评论的帖子">我的评论</a></button>
        </div>
        <%
            }
        %>
    </div>
</div>

</body>
</html>
