<%--
  Created by IntelliJ IDEA.
  User: 22398
  Date: 2021/9/10
  Time: 14:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="register/html; charset=gb2312">
        <title>用户登录</title>
        <style>
            * {
                margin: 0;
                padding: 0;
            }

            html {
                height: 100%;
                width: 100%;
                overflow: hidden;
                margin: 0;
                padding: 0;
                background: url(/imgs/register.png) no-repeat 0px 0px;
                background-repeat: no-repeat;
                background-size: 100% 100%;
                -moz-background-size: 100% 100%;
            }

            body {
                display: flex;
                align-items: center;
                justify-content: center;
                height: 100%;
            }

            #loginDiv {
                width: 37%;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 650px;
                background-color: rgba(75, 81, 95, 0.3);
                box-shadow: 7px 7px 17px rgba(52, 56, 66, 0.5);
                border-radius: 5px;
            }

            p,
            .sexDiv {
                margin-top: 10px;
                margin-left: 20px;
                color: azure;
            }

            .sexDiv>input,
            .hobby>input {
                width: 30px;
                height: 17px;
            }

            input,
            select {
                margin-left: 15px;
                border-radius: 5px;
                border-style: hidden;
                height: 30px;
                width: 140px;
                background-color: rgba(216, 191, 216, 0.5);
                outline: none;
                color: #f0edf3;
                padding-left: 10px;
            }

            .button {
                border-color: cornsilk;
                background-color: rgba(100, 149, 237, .7);
                color: aliceblue;
                border-style: hidden;
                border-radius: 5px;
                width: 100px;
                height: 31px;
                font-size: 16px;
            }

            .introduce>textarea {
                background-color: rgba(216, 191, 216, 0.5);
                border-style: hidden;
                outline: none;
                border-radius: 5px;
            }

            h1 {
                text-align: center;
                margin-bottom: 20px;
                margin-top: 20px;
                color: #f0edf3;
            }

            b {
                margin-left: 50px;
                color: #FFEB3B;
                font-size: 10px;
                font-weight: initial;
            }
        </style>
    </head>
    <script type="text/javascript">
        function checkUser() {
            var getName=document.getElementById("getname").value;
            var xhr=new XMLHttpRequest();
            var data=new FormData();
            data.append("getNameValue",getName);
            xhr.open("post","/login.do",true);
            xhr.onload=function (){
                if(JSON.parse(xhr.responseText)==="no"){
                    document.getElementById("check").innerText="X";
                }
                else if(JSON.parse(xhr.responseText)==="yes"){
                    document.getElementById("check").innerText="√";
                }
            }
            xhr.send(data);
        }

        function chenkPassword() {
            var getName=document.getElementById("getname").value;
            var getPs=document.getElementById("getpassword").value;
            var xhr=new XMLHttpRequest();
            var data=new FormData();
            data.append("getNameValue",getName);
            data.append("getPsValue",getPs);
            xhr.open("post","/login1.do",true);
            xhr.onload=function () {
                if(JSON.parse(xhr.responseText)==="用户不存在"){
                    alert("用户不存在");
                }
                else if(JSON.parse(xhr.responseText)==="登录成功"){
                    alert("登录成功");
                }
                else {
                    alert("密码错误");
                }
            }
            xhr.send(data)
        }
    </script>
<body>
<%--注册页面跳转到登录页面，获取Session携带的name值，并且设置为name输入框的默认值--%>
<%
    String Sessionname= (String) request.getSession().getAttribute("Sessionname");
    if(Sessionname==null){
        Sessionname="";
    }
    else {
        Sessionname=(String) request.getSession().getAttribute("Sessionname");
    }
%>
<div id="loginDiv">
    <form action="/login2.do" method="post">
        <h1>登录</h1>
        <p>用户姓名:<input name="name" id="getname" type="text" autofocus required value="<%=Sessionname%>" onchange=" checkUser()"><span id="check"></span></p>

        <p>用户密码:<input name="password" id="getpassword" type="password" autofocus required></p>

        <p style="text-align: center;">
            <input type="submit" class="button"  onclick="chenkPassword()" value="登录">
            <input type="reset" class="button" value="重置">
        </p>
    </form>
</div>

</body>
</html>
