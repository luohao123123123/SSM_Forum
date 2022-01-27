<%--
  Created by IntelliJ IDEA.
  User: 22398
  Date: 2021/9/27
  Time: 8:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>二维码生成器</title>
</head>
<body>

<div style="text-align: center">
    <form action="/erweima.do" method="post">
        <input type="text" name="textValue">
        <input type="submit" value="生成">
    </form>
    <%
        if (request.getAttribute("file")!=null){
    %>
    <img src="imgs/${file}">
    <%
        }else { }
    %>
</div>

</body>
</html>
