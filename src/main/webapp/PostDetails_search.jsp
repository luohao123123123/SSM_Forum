<%@ page import="com.YuezhIforum.service.UserServer" %>
<%@ page import="com.YuezhIforum.bean.Posts" %>
<%@ page import="java.util.List" %>
<%@ page import="com.YuezhIforum.bean.User" %>
<%@ page import="com.YuezhIforum.bean.Comment" %>
<%
    String name= (String) request.getSession().getAttribute("name");
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
    //获取PostsTypeShowAll.jsp传来的帖子id
    int id=Integer.parseInt(request.getParameter("id"));
    String searchvalue=request.getParameter("searchvalue");
    UserServer server= (UserServer) request.getSession().getAttribute("server");
    List<Posts> postsList1= server.id_findall(id);
    int pageid=Integer.parseInt(request.getParameter("startid"));
    for (int i = 0; i < postsList1.size(); i++) {

%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>搜索帖子详情--<%=postsList1.get(i).getPostsname()%></title>
    <script type="text/javascript">
        function plbutton() {
            document.getElementById("pl").style.display="block"
        }
        function plbuttonNo() {
            document.getElementById("pl").style.display="none"
        }
        function commentPublish() {
            var commentvalue=document.getElementById("commentValue").value;
            var postsid=document.getElementById("postsid").value;
            var username=document.getElementById("username").value;
            var xhr=new XMLHttpRequest();
            var data=new FormData();
            data.append("commentValue",commentvalue);
            data.append("postsid",postsid);
            data.append("username",username);
            xhr.open("post","/commentPublish.do",true);
            xhr.onload=function (){
                if (JSON.parse(xhr.responseText)==="ok"){
                    alert("评论成功！")
                }
                else if (JSON.parse(xhr.responseText==="no")){
                    alert("评论失败")
                }
                document.getElementById("pl").style.display="none"
                window.open("PostDetails_search.jsp?id=<%=id%>&startid=<%=pageid%>&searchvalue=<%=searchvalue%>","mainFrame")
            }
            xhr.send(data);
        }
    </script>
</head>
<body>
<div><a style="text-decoration: none;color: grey" href="search_show.jsp?postsvalue=<%=searchvalue%>&startid=<%=pageid%>">《返回</a></div>
<div>
            <span style="text-align: center;color: #4682B4"><h3><%=postsList1.get(i).getPostsname()%></h3></span>
            <div style="background-color: #e2e2e2">
                <span>
                <%=postsList1.get(i).getPostsbody()%>
                </span><br>
                <%
                    if(postsList1.get(i).getPostsimg().equals("无图片")){

                    }
                    else {
                %>
                <img style="max-height: 500px;" src="imgs/<%=postsList1.get(i).getPostsimg()%>" >
                <%
                    }
                %>
            </div><br>
            <span  style="font-size: 15px;float: left;margin-left: 30px;color: #4682B4"><p>
                <a href="userInformation.jsp?postsauthor=<%=postsList1.get(i).getPostsauthor()%>" title="查看此用户" style="text-decoration: none;color: #4682B4"><%=postsList1.get(i).getPostsauthor()%></a>
            </p></span>
            <p style="font-size: 5px;float: left;margin:18px 80px;color: #4682B4"><%=postsList1.get(i).getPostsdate()%></p>
    <p><button onclick="plbutton()" style="border:none;border-radius: 10%;z-index: 3"><img src="imgs/pl.png" style="height: 20px;width: 20px" title="写评论"></button></p>

</div>
<div style="margin-top: 40px"><hr></div>
<div id="pl" style="display: none">
    <textarea  id="commentValue"  style="vertical-align:top;outline:none;height: 200px;width:60%;margin-top: 3px;margin-left: 10px;" placeholder="请输入评论"></textarea><br>
    <div style="padding-left: 20px;margin-top: 5px;"><button onclick="commentPublish()">提交</button>&emsp; <button onclick="plbuttonNo()">取消</button></div>
    <input id="postsid" value="<%=postsList1.get(i).getId()%>" type="hidden">
    <input id="username" value="<%=name%>" type="hidden">
</div>
<%--评论--%>
<div><h3 style="color: #4682B4">评论</h3></div>
<%
    List<Comment> commentList=server.postsidFindComment(postsList1.get(i).getId());
    for (int j = 0; j < commentList.size(); j++) {
        User user=server.userIdFindUser(commentList.get(j).getUid());
%>
<div style="margin-top: 30px">
    <div><img src="/imgs/<%=user.getImg()%>" style="height: 40px;width: 40px;border-radius: 100%"><a href="userInformation.jsp?postsauthor=<%=user.getName()%>" style="text-decoration: none;color: #4682B4" title="查看用户"><%=user.getName()%></a></div>
    <div style="width: 80%;background: #e2e2e2">&ensp;&ensp;<%=commentList.get(j).getCommentValue()%></div>
</div>
<%
    }
%>
</body>
</html>
<%
    }
%>
