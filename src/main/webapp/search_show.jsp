<%
    String name= (String) request.getSession().getAttribute("name");
    if(name==null){
%>
<h3 style="text-align: center">请先登录</h3>
<%}
else {%>
<%@ page import="com.YuezhIforum.service.UserServer" %>
<%@ page import="com.YuezhIforum.bean.Posts" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>搜索展示</title>
    <style>
        #in{
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
        }
        #a1,#a2,#a3,#a4,#a5,#a6,#a7,#a8,#a9,#a10{
            text-decoration: none;
            color: #4682B4;
        }
        button{
            border: #4682B4 1px solid;
            border-radius: 10%;
            color: #4682B4;
        }
    </style>
</head>
<body>
<div>
            <%
                String postsvalue=request.getParameter("postsvalue");
                int startid=Integer.parseInt(request.getParameter("startid"));
                if(postsvalue==""){%>
                <h3 style="text-align: center">请输入搜索内容</h3>
                <%}
                else {
                    UserServer server= (UserServer) request.getSession().getAttribute("server");
                List<Posts> postsList=server.search(postsvalue,startid);
                int Postscount=server.postsSearchCount(postsvalue);
                if(postsList.size()==0){
                    %>
    <h2 style="text-align: center">未搜索到<%=postsvalue%>相关内容</h2>
                <%}
                else {
                for (int i = 0; i < postsList.size(); i++) {
            %>
            <%--所有搜索到的数据的页面--%>
            <span><h4><a href="PostDetails_search.jsp?id=<%=postsList.get(i).getId()%>&searchvalue=<%=postsvalue%>&startid=<%=startid%>" style="text-decoration: none;color: navy"><%=postsList.get(i).getPostsname()%></a></h4></span>
            <span><a id="in" href="PostDetails_search.jsp?id=<%=postsList.get(i).getId()%>&searchvalue=<%=postsvalue%>&startid=<%=startid%>" style="text-decoration: none;color: grey;font-size: 15px"><%=postsList.get(i).getPostsbody()%></a></span><br><br>
            <span style="font-size: 12px;color: grey;">
                <a href="userInformation.jsp?postsauthor=<%=postsList.get(i).getPostsauthor()%>" title="查看此用户" style="text-decoration: none;color: grey"> <%=postsList.get(i).getPostsauthor()%></a>
            </span>&emsp;&emsp;<span style="font-size: 12px;color: grey;"><%=postsList.get(i).getPostsdate()%>&emsp;&emsp;</span><span style="font-size: 12px;color: grey;"><%=postsList.get(i).getPoststype()%></span>
    &emsp;&emsp;<span style="font-size: 12px;color: grey;"><%=postsList.get(i).getId()%></span>
            <hr style="border: 1px solid silver">
            <%
                }%>


        <%
            if(Postscount<=4){

            }
            else if( Postscount-startid<4) {%>
    <div style="text-align: center;margin-top: 30px"><button><a id="a9" href="search_show.jsp?postsvalue=<%=postsvalue%>&startid=0">首页</a> </button>&emsp;&emsp;<button><a id="a1" href="search_show.jsp?postsvalue=<%=postsvalue%>&startid=<%=startid-4%>">上一页</a></button>&emsp;&emsp;<button><a id="a6" href="search_show.jsp?postsvalue=<%=postsvalue%>&startid=<%=Postscount-Postscount%4%>">尾页</a></button></div>
           <% }
            else if(startid==0) {%>
    <div style="text-align: center;margin-top: 30px"><button><a id="a10" href="search_show.jsp?postsvalue=<%=postsvalue%>&startid=0">首页</a> </button>&emsp;&emsp;<button><a id="a2" href="search_show.jsp?postsvalue=<%=postsvalue%>&startid=<%=startid+4%>">下一页</a></button>&emsp;&emsp;
        <button><a id="a5" href="search_show.jsp?postsvalue=<%=postsvalue%>&startid=<%=Postscount-Postscount%4%>">尾页</a></button>
    </div>
           <%}
            else {
        %>
    <div style="text-align: center;margin-top: 30px"><button><a id="a8" href="search_show.jsp?postsvalue=<%=postsvalue%>&startid=0">首页</a> </button>&emsp;&emsp;<button><a id="a3" href="search_show.jsp?postsvalue=<%=postsvalue%>&startid=<%=startid-4%>">上一页</a></button>&emsp;&emsp;
        <button><a id="a4" href="search_show.jsp?postsvalue=<%=postsvalue%>&startid=<%=startid+4%>">下一页</a></button> &emsp;&emsp;<button><a id="a7" href="search_show.jsp?postsvalue=<%=postsvalue%>&startid=<%=Postscount-Postscount%4%>">尾页</a></button></div>
            <%}
                }
                }
            %>
        </div>
</body>
</html>
<%
    }
%>
