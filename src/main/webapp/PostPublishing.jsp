<%@ page import="com.YuezhIforum.service.UserServer" %><%
    String name= (String) request.getSession().getAttribute("name");
    UserServer server= (UserServer) request.getSession().getAttribute("server");
    if(name==null){
%>
<h3 style="text-align: center">请先登录</h3>
    <%}
    else {
        int id=server.findUseId(name);
        request.setAttribute("id",id);%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>帖子发表</title>
    <style>
        input{
            margin-top: 10px;
            margin-left: 10px;
        }
        #in1{margin-left: 10px}
        #in2{padding-left: 0px}
        #in3{margin-left: 70px}
        #in4{margin-left: 10px}
    </style>
    <script type="text/javascript">
        function imgput() {
            alert("发表成功！")
        }
    </script>
</head>
<body>
<div>
            <span><p style="text-align:center;font-size: 25px;color: #4682B4;">发表帖子</p></span>
           <div style="margin-left: 35%;margin-top: 10%">
            <form method="post" action="postsPublish.do" enctype="multipart/form-data" style="border: 1px black" >
                帖子标题：<input type="text" name="postsname" placeholder="请输入帖子标题"><br>
                帖子内容：<textarea name="postsbody"   style="vertical-align:top;outline:none;height: 400px;width:400px;margin-top: 3px;margin-left: 10px" placeholder="请输入帖子内容"></textarea><br>
<%--                帖子作者：<input type="text" name="postsauthor" placeholder="请输入帖子作者"><br>--%>
                帖子类型：<select id="in1" name="poststype">
                            <option value="娱乐">娱乐</option>
                            <option value="杂谈">杂谈</option>
                            <option value="经济">经济</option>
                            <option value="文学">文学</option>
                            <option value="校园趣事">校园趣事</option>
                        </select><br>
                添加图片：<input  name="postsimg" id="in2" type="file" value="选择图片"><br>
                <input id="in3" type="submit" value="发表" onclick="imgput()"> <input id="in4" type="reset">
           </form>
           </div>
        </div>
</body>
</html>
<%
    }
%>