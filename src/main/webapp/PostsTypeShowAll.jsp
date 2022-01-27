<%@ page import="com.YuezhIforum.service.UserServer" %>
<%@ page import="com.YuezhIforum.bean.Posts" %>
<%@ page import="java.util.List" %>
<%
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
    String type=request.getParameter("type");
    int startid=Integer.parseInt(request.getParameter("startid"));
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>标签---<%=type%></title>
    <style>
        #in{
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
        }
        button{
            border: #4682B4 1px solid;
            border-radius: 10%;
            color: #4682B4;
        }
        #a1,#a2,#a3,#a4,#a5,#a6,#a7,#a8,#a9,#a10{
            text-decoration: none;
            color: #4682B4;
        }
    </style>
</head>
<body>
<div>
            <%
                UserServer server= (UserServer) request.getSession().getAttribute("server");
                List<Posts> postsList=server.type_findall(type,startid,4);
                int Postscount=server.postsTypeCount(type);
                if(postsList.size()==0){%>
            <h2 style="text-align: center">暂无<%=type%>类型的内容</h2>
            <%} else {
                for (int i = 0; i < postsList.size(); i++) {
            %>
            <%--所有type相同的页面--%>
            <span><h4><a href="PostDetails.jsp?id=<%=postsList.get(i).getId()%>&type=<%=postsList.get(i).getPoststype()%>&startid=<%=startid%>" style="text-decoration: none;color: navy" title="查看帖子"><%=postsList.get(i).getPostsname()%></a></h4></span>
            <span><a id="in" href="PostDetails.jsp?id=<%=postsList.get(i).getId()%>&type=<%=postsList.get(i).getPoststype()%>&startid=<%=startid%>" style="text-decoration: none;color: grey;font-size: 15px" title="查看帖子"><%=postsList.get(i).getPostsbody()%></a></span><br><br>
            <span style="font-size: 12px;color: grey;">
                 <a href="userInformation.jsp?postsauthor=<%=postsList.get(i).getPostsauthor()%>" title="查看此用户" style="text-decoration: none;color: grey"><%=postsList.get(i).getPostsauthor()%></a>
            </span>&emsp;&emsp;<span style="font-size: 12px;color: grey;"><%=postsList.get(i).getPostsdate()%></span>
            &emsp;&emsp;<span style="font-size: 12px;color: grey;"><%=postsList.get(i).getPoststype()%></span>
            <hr style="border: 1px solid silver">
            <%
                }%>
    <%--分页--%>
    <%
        if(Postscount<=4){%>

          <%  }
        else if(Postscount-startid<4){%>
    <div style="text-align: center;margin-top: 30px"><button><a id="a9" href="PostsTypeShowAll.jsp?type=<%=type%>&startid=0">首页</a> </button>&emsp;&emsp;<button><a id="a1" href="PostsTypeShowAll.jsp?type=<%=type%>&startid=<%=startid-4%>">上一页</a></button>&emsp;&emsp;<button><a id="a6" href="PostsTypeShowAll.jsp?type=<%=type%>&startid=<%=Postscount-Postscount%4%>">尾页</a></button></div>
    <% }
    else if(startid==0){%>
    <div style="text-align: center;margin-top: 30px"><button><a id="a10" href="PostsTypeShowAll.jsp?type=<%=type%>&startid=0">首页</a> </button>&emsp;&emsp;<button><a id="a2" href="PostsTypeShowAll.jsp?type=<%=type%>&startid=<%=startid+4%>">下一页</a></button>&emsp;&emsp;
        <button><a id="a5" href="PostsTypeShowAll.jsp?type=<%=type%>&startid=<%=Postscount-Postscount%4%>">尾页</a></button>
    </div>

    <%}
    else {%>
    <div style="text-align: center;margin-top: 30px"><button><a id="a8" href="PostsTypeShowAll.jsp?type=<%=type%>&startid=0">首页</a> </button>&emsp;&emsp;<button><a id="a3" href="PostsTypeShowAll.jsp?type=<%=type%>&startid=<%=startid-4%>">上一页</a></button>&emsp;&emsp;
        <button><a id="a4" href="PostsTypeShowAll.jsp?type=<%=type%>&startid=<%=startid+4%>">下一页</a></button> &emsp;&emsp;<button><a id="a7" href="PostsTypeShowAll.jsp?type=<%=type%>&startid=<%=Postscount-Postscount%4%>">尾页</a></button></div>
    <%
        }
                }%>

</div>
</body>
</html>
