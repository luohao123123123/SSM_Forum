<%@ page import="com.YuezhIforum.service.UserServer" %>
<%@ page import="com.YuezhIforum.bean.Posts" %>
<%@ page import="java.util.List" %><%
    UserServer server= (UserServer) request.getSession().getAttribute("server");
    Posts posts=server.selectone();
    List<Posts> postsList=server.selectnum();
    List<Posts> AllpostsList=server.findallPosts();
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>homeshow</title>
    <style>
        #in,#in1{
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
        }
        #in2{
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 1;
            -webkit-box-orient: vertical;
        }
    </style>
</head>
<body>
<div style="width: 100%;height: 100%;">
    <div style="text-align: center;"><h2><a href="PostDetails_home.jsp?id=<%=posts.getId()%>" style="color: #4682B4;text-decoration: none" title="查看帖子"><%=posts.getPostsname()%></a></h2></div>
    <div id="in">&emsp;&emsp;<a href="PostDetails_home.jsp?id=<%=posts.getId()%>" style="color:grey;text-decoration: none" title="查看帖子"><%=posts.getPostsbody()%></a></div>
    <div style="color:grey;font-size: 13px;text-align: right">文&ensp;/&ensp;<a href="userInformation.jsp?postsauthor=<%=posts.getPostsauthor()%>" title="查看此用户" style="text-decoration: none;color: grey"><%=posts.getPostsauthor()%></a>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</div>
    <div><hr style="color:grey;"></div><br>
    <div>
            <%
                for(int i = 0; i < postsList.size(); i++) {
            %>
        <p style="width: 50%;float: left;" id="in2"><a href="PostDetails_home.jsp?id=<%=postsList.get(i).getId()%>" style="text-decoration: none;color: #4682B4;" target="mainFrame" title="查看帖子"><%=postsList.get(i).getPostsname()%></a></p>
            <%
                }
            %>
    </div>
    <hr style="border: #4682B4 solid 1px">

    <%
        for (int i = 0; i < AllpostsList.size(); i++) {
            if(AllpostsList.get(i).getPostsimg().equals("无图片")){
    %>
    <div>
        <p style="color: #4682B4;font-size: 20px"><a href="PostDetails_home.jsp?id=<%=AllpostsList.get(i).getId()%>" style="text-decoration: none;color: #4682B4;" title="查看帖子"><%=AllpostsList.get(i).getPostsname()%></a></p>
        <div id="in3"><a href="PostDetails_home.jsp?id=<%=AllpostsList.get(i).getId()%>" style="text-decoration: none;color: grey;" title="查看帖子"><%=AllpostsList.get(i).getPostsbody()%></a></div>
        <div style="padding-left: 650px;color: grey;font-size: 13px">
            <a href="userInformation.jsp?postsauthor=<%=AllpostsList.get(i).getPostsauthor()%>" title="查看此用户" style="text-decoration: none;color: grey"><%=AllpostsList.get(i).getPostsauthor()%></a>&ensp;/&ensp;
            <a href="PostsTypeShowAll.jsp?type=<%=AllpostsList.get(i).getPoststype()%>&startid=0" style="text-decoration: none;color: grey" target="mainFrame" title="查看所有<%=AllpostsList.get(i).getPoststype()%>帖子"><%=AllpostsList.get(i).getPoststype()%></a>
        </div>
        <hr style="border-color: white">
    </div>
    <%
        }
            else{%>
    <div>
        <p style="font-size: 20px"><a href="PostDetails_home.jsp?id=<%=AllpostsList.get(i).getId()%>" style="text-decoration: none;color: #4682B4;" title="查看帖子"><%=AllpostsList.get(i).getPostsname()%></a></p>
        <div style=""><a href="PostDetails_home.jsp?id=<%=AllpostsList.get(i).getId()%>" style="text-decoration: none;color: #4682B4;" title="查看帖子"><img src="/imgs/<%=AllpostsList.get(i).getPostsimg()%>" style="width: 150px;height: 100px;"></a></div>
        <div  style="width: 600px;position: relative;top: -80px;left: 200px"><a id="in1" href="PostDetails_home.jsp?id=<%=AllpostsList.get(i).getId()%>" style="text-decoration: none;color: grey;" title="查看帖子"><%=AllpostsList.get(i).getPostsbody()%></a>
            <p style="position: absolute;left: 450px;color: grey;font-size: 13px">
                <a href="userInformation.jsp?postsauthor=<%=AllpostsList.get(i).getPostsauthor()%>" title="查看此用户" style="text-decoration: none;color: grey"><%=AllpostsList.get(i).getPostsauthor()%></a>&ensp;/&ensp;
                <a href="PostsTypeShowAll.jsp?type=<%=AllpostsList.get(i).getPoststype()%>&startid=0" style="text-decoration: none;color: grey" target="mainFrame" title="查看所有<%=AllpostsList.get(i).getPoststype()%>帖子"><%=AllpostsList.get(i).getPoststype()%></a>
            </p>
        </div>
        <hr style="border-color: white">
    </div>
        <%}
        }
    %>

</div>

</body>
</html>
