<%@ page import="com.YuezhIforum.service.UserServer" %>
<%@ page import="com.YuezhIforum.bean.Posts" %>
<%@ page import="java.util.List" %>
<%
    String name= (String) request.getSession().getAttribute("name");
    UserServer server= (UserServer) request.getSession().getAttribute("server");
    int uid=server.findUseId(name);
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我的帖子</title>
    <style>
        td{
            height: 20px;
            width: 130px;
        }
        tr{
            height: 30px;
            text-align: center;
        }
        #in1,#in2{
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 1;
            -webkit-box-orient: vertical;
        }
        a{
            text-decoration: none;
            color:black;
        }
    </style>
</head>
<body>
<div>
    <div >
        <table style="text-align: center;background-color: #e2e2e2">
            <hr style="border: #e2e2e2 2px solid">
             <tr style="color: #4682B4">
                <td>标题</td>
                <td>作者</td>
                <td>发帖时间</td>
                <td style="width: 200px">内容</td>
                 <td>类型</td>
                 <td>操作</td>
             </tr>
            <%
                List<Posts> postsList= server.uid_findall(uid);
                if(postsList.size()==0) {%>
                    <h3 style="text-align: center">您还没有发布贴子哦，赶紧去发布吧！</h3>
                <%}else {
                for (int i = 0; i < postsList.size(); i++) {
            %>
            <tr>
                <td id="in1" style="width: 100px;"><a href="PostDetails_userPosts.jsp?id=<%=postsList.get(i).getId()%>" title="查看帖子" ><%=postsList.get(i).getPostsname()%></a></td>
                <td id="in3"><%=postsList.get(i).getPostsauthor()%></td>
                <td id="in5" style="width: 220px"><%=postsList.get(i).getPostsdate()%></td>
                <td id="in2" style="width: 220px"><a href="PostDetails_userPosts.jsp?id=<%=postsList.get(i).getId()%>" title="查看帖子"><%=postsList.get(i).getPostsbody()%></a></td>
                <td id="in4"><a href="PostsTypeShowAll.jsp?type=<%=postsList.get(i).getPoststype()%>&startid=0" target="mainFrame" title="查看此类型的帖子" ><%=postsList.get(i).getPoststype()%></a></td>
                <td><button style="color: #4682B4;border: #4682B4 1px solid;border-radius: 10%"><a href="deleteposts.do?postsid=<%=postsList.get(i).getId()%>" style="color: #4682B4;text-decoration: none" title="删除此帖子">删除</a></button></td>
            </tr>
            <%
                }
                }
            %>

         </table>
    </div>
</div>
</body>
</html>
