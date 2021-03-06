<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.javaConnect.auth.model.PostModel"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <title>PageDown-Bootstrap Demo Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
	<link href="bootstrap-3.3.4-dist/styles.css" rel="stylesheet">
    
   

</head>
<body>
	<%
	//HttpSession session = request.getSession();
	ArrayList<PostModel> posts = (ArrayList<PostModel>) session.getAttribute("posts");
	%>
	
  <ul class="posts" style="margin-top: 10em; ">
        <%for(PostModel post: posts){ %>
            <li class="post">
                <div class="post-thumbnail">
                	<% String username = post.getAuthor_name();%>
                   <a href="profile?username=<%=username%>" >
                <img class="img-rounded profile-thumbnail" src="DisplayImage?username=<%=username %>" height="50px" width="50px" >
            </a>
                </div>
                <div class="post-content">
                    <div class="post-date"><%=post.getTimestamp() %></div>
                    <div class="post-author">
                        <a href="profile?username=<%=username%>">
                           <%= username%>
                        </a>
                    </div>
                    <div  class="post-body sample">
                   <h1> <%=post.getTitle() %></h1>
                    </div>
                    <div class="post-footer">
                        <%if (session.getAttribute("username").equals(username)){ %>
                            <a href="edit?id=<%=post.getPid() %>">
                                <span class="label label-success">Edit</span>
                            </a>
                        <!--  {% elif current_user.is_administrator() %}
                            <a href="{{ url_for('.edit', id=post.id) }}">
                                <span class="label label-danger">Edit&nbsp;[Admin]</span
                            </a>-->
                        <%} %>
                        <span class="label label-info">Views | <%=post.getPid() %></span>
                        <a href="post?id=<%=post.getPid()%>">
                            <span class="label label-primary">Permalink</span>
                        </a>
                        <a href="#comments">
                            <span class="label label-primary">Comments</span>
                         </a>
                    </div>
                </div>
            </li>
        <%} //for ends %>
    </ul>
</body>
</html>
    