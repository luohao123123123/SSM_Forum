<%@ page import="com.YuezhIforum.service.UserServer" %>
<%@ page import="com.YuezhIforum.bean.User" %><%
    UserServer server= (UserServer) request.getSession().getAttribute("server");
    String name= (String) request.getSession().getAttribute("name");
    User user=server.login(name);
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<%--    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">--%>
    <title>个人信息</title>
    <style>
        input{
            font-size: 15px;
            width: 100px;
            height: 30px;
            outline: none;
            border: none;
            background-color:#F0F0F0;
        }
    </style>
    <script type="text/javascript">
        function updatename() {
            var namevalue=document.getElementById("namevalue").value;
            var idvalue=document.getElementById("nameid").value;
            var xhr=new XMLHttpRequest();
            var data=new FormData();
            //传值
            data.append("namevalue",namevalue);
            data.append("idvalue",idvalue);
            xhr.open("post","/updatename.do",true);
            xhr.onload=function (){
                if(JSON.parse(xhr.responseText)==="no"){
                    document.getElementById("namevalue").value=document.getElementById("oldname").value;
                    alert("更新失败！");
                }else {
                    document.getElementById("namevalue").value=JSON.parse(xhr.responseText);
                    alert("更新成功！");
                }
            }
            xhr.send(data);
        }
        function updatsex() {
            var sexvalue=document.getElementById("sexvalue").value;
            var idvalue=document.getElementById("nameid").value;
            var xhr=new XMLHttpRequest();
            var data=new FormData();
            //传值
            data.append("sexvalue",sexvalue);
            data.append("idvalue",idvalue);
            xhr.open("post","/updatesex.do",true);
            xhr.onload=function (){
                if(JSON.parse(xhr.responseText)==="no"){
                    document.getElementById("sexvalue").value=document.getElementById("oldsex").value;
                    alert("更新失败！");
                }else {
                    document.getElementById("sexvalue").value=JSON.parse(xhr.responseText);
                    alert("更新成功！");
                }
            }
            xhr.send(data);
        }

        function updatage() {
            var agevalue=document.getElementById("agevalue").value;
            var idvalue=document.getElementById("nameid").value;
            var xhr=new XMLHttpRequest();
            var data=new FormData();
            //传值
            data.append("agevalue",agevalue);
            data.append("idvalue",idvalue);
            xhr.open("post","/updateage.do",true);
            xhr.onload=function (){
                if(JSON.parse(xhr.responseText)==="no"){
                    document.getElementById("agevalue").value=document.getElementById("oldage").value;
                    alert("更新失败！");
                }else {
                    document.getElementById("agevalue").value=JSON.parse(xhr.responseText);
                    alert("更新成功！");
                }
            }
            xhr.send(data);
        }

        function updateschool() {
            var schoolvalue=document.getElementById("schoolvalue").value;
            var idvalue=document.getElementById("nameid").value;
            var xhr=new XMLHttpRequest();
            var data=new FormData();
            //传值
            data.append("schoolvalue",schoolvalue);
            data.append("idvalue",idvalue);
            xhr.open("post","/updateschool.do",true);
            xhr.onload=function (){
                if(JSON.parse(xhr.responseText)==="no"){
                    document.getElementById("schoolvalue").value=document.getElementById("oldschool").value;
                    alert("更新失败！");
                }else {
                    document.getElementById("schoolvalue").value=JSON.parse(xhr.responseText);
                    alert("更新成功！");
                }
            }
            xhr.send(data);
        }

        function updatepassword() {
            var passwordvalue=document.getElementById("passwordvalue").value;
            var idvalue=document.getElementById("nameid").value;
            var xhr=new XMLHttpRequest();
            var data=new FormData();
            //传值
            data.append("passwordvalue",passwordvalue);
            data.append("idvalue",idvalue);
            xhr.open("post","/updatepassword.do",true);
            xhr.onload=function (){
                if(JSON.parse(xhr.responseText)==="no"){
                    document.getElementById("passwordvalue").value=document.getElementById("oldpassword").value;
                    alert("更新失败！");
                }else {
                    document.getElementById("passwordvalue").value=JSON.parse(xhr.responseText);
                    alert("更新成功！");
                }
            }
            xhr.send(data);
        }
        function getImgs() {
            //获取图片路径
            var value=document.getElementById("getImgs").files[0];
            var getnamevalue=document.getElementById("oldname").value;
            console.log(getnamevalue)
            var xhr=new XMLHttpRequest();
            var data=new FormData();
            //传值
            data.append("imgs",value)
            data.append("getnamevalue",getnamevalue)
            xhr.open("post","/imgs.do",true)
            xhr.onload=function (){
                //获取上传头像图片的路径赋值给img.src
                document.getElementById("img").src=("/imgs/"+JSON.parse(xhr.responseText).ReturnValue3);
            }
            xhr.send(data);
        }
    </script>
</head>
<body>
        <div  style="height: 700px;">
            <div style="height: 150px">
                <img id="img" style="color:#4682B4;position: absolute;top: 10px;right: 41%;font-size: 20px;height: 150px;width: 150px;"src="/imgs/<%=user.getImg()%>">
                <input type="file" id="getImgs" onchange="getImgs()" style="position: absolute;top: 10px;right: 41%;z-index: 1;width: 150px;height: 150px;opacity: 0">
            </div>

            <div style="padding-left: 40%;margin-top: 15px;">用户名：<input type="text" id="namevalue" value="<%=user.getName()%>" onchange="updatename()"></div>
            <div  style="padding-left: 40%;margin-top: 15px;">性&emsp;别：<input id="sexvalue" type="text" value="<%=user.getSex()%>" onchange="updatsex()"></div>
            <div  style="padding-left: 40%;margin-top: 15px;">年&emsp;龄：<input id="agevalue" type="text" value="<%=user.getAge()%>" onchange="updatage()"></div>
            <div  style="padding-left: 40%;margin-top: 15px;">学&emsp;校：<input id="schoolvalue" type="text" value="<%=user.getSchool()%>" onchange="updateschool()"></div>
            <div  style="padding-left: 40%;margin-top: 15px;">密&emsp;码：<input id="passwordvalue" type="password" value="<%=user.getPassword()%>" onchange="updatepassword()"></div>

            <input id="nameid" type="hidden" value="<%=user.getId()%>">
            <input id="oldname" type="hidden" value="<%=user.getName()%>">
            <input id="oldsex" type="hidden" value="<%=user.getSex()%>">
            <input id="oldage" type="hidden" value="<%=user.getAge()%>">
            <input id="oldschool" type="hidden" value="<%=user.getSchool()%>">
            <input id="oldpassword" type="hidden" value="<%=user.getPassword()%>">
            <button style="margin-top: 15px;margin-left: 45%;border: #4682B4 1px solid;border-radius: 10%"><a href="login.jsp" style="text-decoration: none;color: #4682B4" target="_top">完成修改</a></button>

        </div>
</body>
</html>
