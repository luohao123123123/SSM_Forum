<%@ page import="com.YuezhIforum.service.UserServer" %>
<%@ page import="com.YuezhIforum.bean.Comment" %>
<%@ page import="java.util.List" %>
<%@ page import="com.YuezhIforum.bean.Posts" %>
<%
    String username=request.getParameter("username");
    UserServer server= (UserServer) request.getSession().getAttribute("server");
    int uid=server.findUseId(username);
    List<Comment> commentList = server.useidFindComment(uid);
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我的评论</title>
    <style>
        #in{
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 1;
            -webkit-box-orient: vertical;
        }
    </style>
</head>
<body>
<div>
    <h3 style="text-align: center">我的评论</h3>
    <%
        for (int i = 0; i < commentList.size(); i++) {
           Posts posts= server.commentidFindPosts(commentList.get(i).getId());
    %>
    <p style="color: #4682B4">帖子标题：<%=posts.getPostsname()%></p>
<p id="in">评论内容：<a href="PostDetails_userComment.jsp?id=<%=posts.getId()%>&username=<%=username%>" style="text-decoration: none;color: grey" title="查看此评论的帖子"><%=commentList.get(i).getCommentValue()%></a></p>
    <hr>
    <%
        }
    %>
</div>

</body>
</html>
