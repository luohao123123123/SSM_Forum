<%@ page import="com.YuezhIforum.service.UserServer" %>
<%@ page import="com.YuezhIforum.bean.Posts" %>
<%@ page import="java.util.List" %>
<%
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>热帖top6</title>
    <style>
        #in{
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
        }
        button{
            border: #4682B4 1px solid;
            border-radius: 10%;
            color: #4682B4;
        }
        .top{
            width: 15px;
            height: 15px
        }

    </style>
</head>
<body>
<div>
            <%
                UserServer server= (UserServer) request.getSession().getAttribute("server");
                List<Posts> postsList=server.topFindPosts();
                for (int i = 0; i < postsList.size(); i++) {
            %>
            <span><h4><a href="PostDetails_Top.jsp?id=<%=postsList.get(i).getId()%>" style="text-decoration: none;color: navy" title="查看帖子"><%=postsList.get(i).getPostsname()%></a></h4></span>
            <span><a id="in" href="PostDetails_Top.jsp?id=<%=postsList.get(i).getId()%>" style="text-decoration: none;color: grey;font-size: 15px" title="查看帖子"><%=postsList.get(i).getPostsbody()%></a></span><br><br>
            <span style="font-size: 12px;color: grey;">
                 <a href="userInformation.jsp?postsauthor=<%=postsList.get(i).getPostsauthor()%>" title="查看此用户" style="text-decoration: none;color: grey"><%=postsList.get(i).getPostsauthor()%></a>
            </span>&emsp;&emsp;
            <span style="font-size: 12px;color: grey;"><%=postsList.get(i).getPostsdate()%></span>&emsp;&emsp;
        <span style="font-size: 12px;color: grey;"><%=postsList.get(i).getPoststype()%></span>&emsp;&emsp;
    <%

        if(postsList.get(i).getPoststop()<10){
    %>
            <span style="font-size: 12px;color: grey;">热度： <img class="top" src="/imgs/top.png"></span>
    <%
        }
        else if(postsList.get(i).getPoststop()>=10 && postsList.get(i).getPoststop()<20){%>
    <span style="font-size: 12px;color: grey;">热度： <img class="top" src="/imgs/top.png"><img class="top" src="/imgs/top.png"></span>
       <% }
       else if(postsList.get(i).getPoststop()>=20 && postsList.get(i).getPoststop()<30){%>
    <span style="font-size: 12px;color: grey;">热度： <img class="top" src="/imgs/top.png"><img class="top" src="/imgs/top.png"><img class="top" src="/imgs/top.png"></span>
    <% }
    else if(postsList.get(i).getPoststop()>=30 && postsList.get(i).getPoststop()<40){%>
    <span style="font-size: 12px;color: grey;">热度： <img class="top" src="/imgs/top.png"><img class="top" src="/imgs/top.png"><img class="top" src="/imgs/top.png"><img class="top" src="/imgs/top.png"></span>
    <% }
    else if(postsList.get(i).getPoststop()>=40){%>
    <span style="font-size: 12px;color: grey;">热度： <img class="top" src="/imgs/top.png"><img class="top" src="/imgs/top.png"><img class="top" src="/imgs/top.png"><img class="top" src="/imgs/top.png"><img class="top" src="/imgs/top.png"></span>
    <% }%>

            <hr style="border: 1px solid silver">
            <%
                }
                %>
</div>
</body>
</html>
