<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
if (session.getAttribute("name") == null) {
    response.sendRedirect(request.getContextPath() + "/login");
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f6f8;
            color: #333;
        }

        nav {
            background-color: #34495e;
            padding: 15px 0;
        }

        nav ul {
            list-style: none;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
        }

        nav li {
            margin: 0 15px;
        }

        nav a {
            color: white;
            text-decoration: none;
            font-weight: bold;
            padding: 6px 10px;
        }

        nav a:hover {
            background-color: #2c3e50;
            border-radius: 4px;
        }

        .welcome-container {
            max-width: 800px;
            margin: 50px auto;
            background-color: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h2 {
            font-size: 2rem;
            color: #2c3e50;
        }
    </style>
</head>
<body>
    <jsp:include page="navbar.jsp" />
    
    <div class="welcome-container">
        <h2>Hello <%=request.getAttribute("name")%></h2>
        <h3>Welcome to <%=request.getAttribute("role") %> dashboard</h3>
    </div>
</body>
</html>
