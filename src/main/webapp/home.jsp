<%@ page import="com.YuezhIforum.service.UserServer" %>
<%@ page import="com.YuezhIforum.bean.User" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.YuezhIforum.bean.Posts" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>岳职论坛</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <style>
        button{
            font-size: 18px;
            background-color:  #4682B4;
            height: 40px;
            width: 180px;
            margin-left: -40px;
            border: 0px solid  #4682B4;
        }
        input{
            margin-left: 60px;
            width: 460px;
            border: 1px solid #e2e2e2;
            height: 40px;
            background-repeat: no-repeat;
            background-size: 25px;
        }
    </style>
    <script type="text/javascript">
            function getValue() {
            var aa = document.getElementById('searchTxt').value
            window.open("search_show.jsp?postsvalue=" + aa+"&startid=0","mainFrame")
        }
            function getImgs() {
                //获取图片路径
                var value=document.getElementById("getImgs").files[0];
                var getnamevalue=document.getElementById("getname").value;
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
            function button1() {
                document.getElementById("button1").style.backgroundColor="#F0F0F0";
                document.getElementById("button2").style.backgroundColor="#4682B4";
                document.getElementById("button3").style.backgroundColor="#4682B4";
                document.getElementById("button4").style.backgroundColor="#4682B4";
                document.getElementById("button5").style.backgroundColor="#4682B4";
            }
            function button2() {
                document.getElementById("button1").style.backgroundColor="#4682B4";
                document.getElementById("button2").style.backgroundColor="#F0F0F0";
                document.getElementById("button3").style.backgroundColor="#4682B4";
                document.getElementById("button4").style.backgroundColor="#4682B4";
                document.getElementById("button5").style.backgroundColor="#4682B4";
            }
            function button3() {
                document.getElementById("button1").style.backgroundColor="#4682B4";
                document.getElementById("button2").style.backgroundColor="#4682B4";
                document.getElementById("button3").style.backgroundColor="#F0F0F0";
                document.getElementById("button4").style.backgroundColor="#4682B4";
                document.getElementById("button5").style.backgroundColor="#4682B4";
            }
            function button4() {
                document.getElementById("button1").style.backgroundColor="#4682B4";
                document.getElementById("button2").style.backgroundColor="#4682B4";
                document.getElementById("button3").style.backgroundColor="#4682B4";
                document.getElementById("button4").style.backgroundColor="#F0F0F0";
                document.getElementById("button5").style.backgroundColor="#4682B4";
            }
            function button5() {
                document.getElementById("button1").style.backgroundColor="#4682B4";
                document.getElementById("button2").style.backgroundColor="#4682B4";
                document.getElementById("button3").style.backgroundColor="#4682B4";
                document.getElementById("button4").style.backgroundColor="#4682B4";
                document.getElementById("button5").style.backgroundColor="#F0F0F0";
            }
            function topsum() {
                var xhr=new XMLHttpRequest();
                xhr.open("post","/topsum.do",true);
                xhr.onload=function (){
                    document.getElementById("topsum").innerHTML=JSON.parse(xhr.responseText);
                }
                xhr.send();
            }
    </script>
    <%
        //获取login.jsp界面传来的name
        String name= (String) request.getSession().getAttribute("name");
        UserServer server= (UserServer) request.getSession().getAttribute("server");
    %>
</head>
<body style="background: #F5F5F5" onkeydown="if(event.keyCode===13) document.all.serach.click()" onmousemove="topsum()">
<%--让function getImgs()获取name值--%>
<input type="text" style="display:none" id="getname" value="<%=name%>">
<%--头部--%>
<div class="container">
    <div class="row" style="height: 60px">
        <div class="col-md-12" style="height: 60px;">
            <a href="home.jsp"><img STYLE="height: 80px;width: 150px;"src="/imgs/logo.png"></a>
            <input style="outline: none"  bindinput="listenerNewLabelInput" id="searchTxt" type="text" placeholder="请输入作者、标题、内容">
            <button id="serach" style="margin-left:-4px;height:40px;width: 60px;"onclick="getValue(this)" title="点击搜索">搜索</button>
            <%
                if(name==null){
            %>
            <p style="position: absolute;top: 20px;right: 200px;font-size: 20px"><a href="login.jsp" style="text-decoration: none">登录</a></p>
            <p style="position: absolute;top: 20px;right: 120px;font-size: 20px"><a href="register.jsp" style="text-decoration: none">注册</a></p>
            <%
                }else {
                    //获取user的头像图片名字
                    User user=server.login(name);
            %>
            <p style="color:#4682B4;position: absolute;top: 20px;right: 150px;font-size: 20px"><%=name%></p>
            <img id="img" style="color:#4682B4;position: absolute;top: 10px;right: 280px;font-size: 20px;height: 50px;width: 50px;border-radius: 100%"src="/imgs/<%=user.getImg()%>">
            <input type="file" id="getImgs" onchange="getImgs()" style="position: absolute;top: 10px;right: 280px;z-index: 1;width: 50px;height: 50px;opacity: 0">
            <button style="position: absolute;top: 13px;right: 13px;width: 100px;height: 40px;border-radius: 10%" title="点击退出"><a href="out.do" style="color: white;text-decoration: none">退出登录</a></button>
            <%
                }
            %>
        </div>
    </div>
</div>
<div><hr style="border: 1px solid #4682B4"></div>


<%--类别栏--%>
<div style="height: 80px;width: 840px;position: absolute;top: 103px;left: 555px;background:#F0F0F0;">
   <hr style="border: #4682B4 1px solid;position: relative;top: -21px;z-index: 1">
    <div style="height: 85px;width: 970px;position: relative;top: -41px;z-index: 1;">
        <button id="button1" name="button2" style="background: #4682B4;width: 168px;height: 80px;margin-left: 0px;"><a href="PostsTopShowAll.jsp" style="text-align: center;width: 168px;text-decoration: none; display: inline-block;color: black" target="mainFrame" onclick="button1()">热帖</a></button>
        <button id="button2" name="button2" style="background: #4682B4;width: 168px;height: 80px;margin-left: -4px"><a href="PostsTypeShowAll.jsp?type=娱乐&startid=0" style="width: 168px;text-decoration: none; display: inline-block;color: black" target="mainFrame" onclick="button2()">娱乐</a></button>
        <button id="button3" name="button2" style="background: #4682B4;width: 168px;height: 80px;margin-left: -4px"><a href="PostsTypeShowAll.jsp?type=杂谈&startid=0" style="width: 168px;text-decoration: none; display: inline-block;color: black" target="mainFrame"  onclick="button3()">杂谈</a></button>
        <button id="button4" name="button2" style="background: #4682B4;width: 168px;height: 80px;margin-left: -4px"><a href="PostsTypeShowAll.jsp?type=经济&startid=0" style="width: 168px;text-decoration: none; display: inline-block;color: black" target="mainFrame"  onclick="button4()">经济</a></button>
        <button id="button5" name="button2" style="background: #4682B4;width: 168px;height: 80px;margin-left: -4px;"><a href="PostsTypeShowAll.jsp?type=文学&startid=0" style="width: 168px;text-decoration: none; display: inline-block;color: black;" target="mainFrame"  onclick="button5()">文学</a></button>
    </div>
</div>
<%--body--%>
<div class="container">
    <div class="row" style="height: 870px">
        <div class="col-md-12" style="height: 870px";>
             <table width="102.6%" height="870px" style="margin-left: -15px;">
                <tr>
                    <td width="180px" style="margin: 0px 30px;background:  #4682B4">
                     <ul>
                        <button><a href="PostPublishing.jsp" style="text-decoration: none;color: white" target="mainFrame">发表帖子</a></button>
                         <button><a href="userhome.jsp" style="text-decoration: none;color: white" target="mainFrame">个人中心</a></button>
                     </ul>
                    </td>
                     <td>
                         <iframe name="mainFrame" width="85%" height="770" frameborder="0" src="homeshow.jsp" style="margin-top: 66px"></iframe>
                    </td>
             </tr>
            </table>
            <div style="width:150px;height:870px;position: absolute;top: 0px;right: 0px;z-index: 1">
                    <%--获取数据库的所有帖子标签--%>
                <div>
                   <p style="padding-top:10px;text-align: center;font-size: 18px;">标签大全</p>
                    <p style="text-align: center">
                    <%

                            List<String> typelist=server.findall();
                            System.out.println(typelist);
                            for(int i = 0; i < typelist.size(); i++) {
                    %>
                   <a href="PostsTypeShowAll.jsp?type=<%=typelist.get(i)%>&startid=0" style="text-decoration: none;" target="mainFrame" title="查看所有<%=typelist.get(i)%>帖子"><%=typelist.get(i)%>&emsp;</a>
                    <%
                        }
                    %>
                    </p>
                    <hr style="border: 1px solid silver">
                </div>
            <%--论坛公告--%>
                <div>
                    <p style="padding-top:10px;text-align: center;font-size: 18px;">论坛公告</p>
                    <p style="text-align: center">
                    <%
                     List<Posts> gonggaolist=server.findgonggao();
                     System.out.println(gonggaolist);
                      for(int i = 0; i < gonggaolist.size(); i++) {
                    %>
                    <p><a href="PostDetails.jsp?id=<%=gonggaolist.get(i).getId()%>&type=<%=gonggaolist.get(i).getPoststype()%>&startid=0" style="text-decoration: none;" target="mainFrame" title="查看帖子"><%=gonggaolist.get(i).getPostsname()%></a></p>
                    <%
                        }
                    %>
                    <p style="text-align: right"><a href="PostsTypeShowAll.jsp?type=公告&startid=0" style="text-decoration: none;" target="mainFrame" title="查看所有公告">更多>></a></p>
                    </p>
                    <hr style="border: 1px solid silver">
                </div>
                <div>
                    <p style="padding-top:10px;text-align: center;font-size: 18px;">总浏览量</p>
                    <%
                        int sum=server.sumPostsTop();
                        System.out.println(sum);
                    %>
                    <p id="topsum" style="padding-top:10px;text-align: center;font-size: 15px;"><%=sum%></p>
                    <hr style="border: 1px solid silver">
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
