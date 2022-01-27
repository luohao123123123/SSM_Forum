<%--
  Created by IntelliJ IDEA.
  User: 22398
  Date: 2021/9/10
  Time: 14:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="register/html; charset=gb2312">
    <title>用户注册</title>
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

        #name_trip {
            margin-left: 50px;
            color: red;
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

        .introduce {
            margin-left: 110px;
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
    function checkPassword(){
        if(form.name.value==""){
            document.getElementById("error").innerText="用户账号不能为空";
            return false;
        }
        if(form.password.value==""){
            document.getElementById("error").innerText="用户密码不能为空";
            return false;
        }
        if(form.password1.value==""){
            document.getElementById("error").innerText="确认密码不能为空";
            return false;
        }
        if(form.age.value==""){
            document.getElementById("error").innerText="用户年龄不能为空";
            return false;
        }
        if(form.school.value==""){
            document.getElementById("error").innerText="school不能为空";
            return false;
        }
        if(form.password.value !=form.password1.value){
            document.getElementById("error").innerText="密码不一致! 请重新输入密码";
            return false;
        }
        return true;
    }
</script>

<body>
<div id="loginDiv">
   <span id="error" style="position: absolute;text-align: center;color: red;top: 230px"></span>
    <form action="register.do" method="post" name="form">
        <h1>注册</h1>
        <p>
            用户账号：
            <input type="text" name="name">
        </p>
        <p>
            用户密码：
            <input type="password" name="password">
        </p>
        <p>
            确认密码：
            <input type="password" name="password1">
        </p>
        <div class="sexDiv">
            用户性别:&emsp;&nbsp;
            <input class="sex" name="sex" value="男" type="radio">男
            <input class="sex" name="sex" value="女" type="radio">女
            <label id="sex_trip"></label>
        </div>
        <p>
            用户年龄：
            <input type="text" name="age">
        </p>
        <p>
            school&emsp;：
            <input type="text" name="school">
        </p>


        <p style="text-align: center;">
            <input type="submit" class="button" value="注册" onclick="return checkPassword()">
            <input type="reset" class="button" value="重置">
        </p>
    </form>
</div>

</body>
</html>


