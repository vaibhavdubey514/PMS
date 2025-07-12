<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
if (session.getAttribute("name") == null) {
    response.sendRedirect(request.getContextPath() + "/login");
}
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/x-icon" href="https://static.vecteezy.com/system/resources/thumbnails/002/206/240/small/fast-delivery-icon-free-vector.jpg">
    <meta charset="UTF-8">
    <title>Contact Support</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f6f8;
            margin: 0;
            padding: 0;
            color: #333;
        }

        /* NAVBAR STYLING (Copied from index.jsp) */
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
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }

        nav a:hover {
            background-color: #2c3e50;
        }

        /* PAGE HEADER */
        h3 {
            text-align: center;
            margin-top: 40px;
            font-size: 26px;
            color: #2c3e50;
        }

        /* CARD CONTAINER */
        .card {
            max-width: 450px;
            margin: 30px auto;
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.12);
            padding: 30px;
        }

        .card h6 {
            font-size: 16px;
            color: #34495e;
            margin-bottom: 6px;
        }

        .card p {
            margin: 0 0 15px;
            font-size: 15px;
            color: #555;
        }

        .card div {
            margin-bottom: 15px;
        }
    </style>
</head>
<body>

    <!-- NAVIGATION BAR -->
    <nav>
        <ul>
            <%
            if ("Customer".equals(request.getAttribute("role"))) {
            %>
            <li><a href="<%=request.getContextPath()%>/">Home</a></li>
            <li><a href="<%=request.getContextPath()%>/booking-service">Booking Service</a></li>
            <li><a href="<%=request.getContextPath()%>/invoice">Invoice</a></li>
            <li><a href="<%=request.getContextPath()%>/tracking">Tracking</a></li>
            <li><a href="<%=request.getContextPath()%>/previous-booking">Previous Booking</a></li>
            <li><a href="<%=request.getContextPath()%>/contact-support">Contact Support</a></li>
            <li><a href="<%=request.getContextPath()%>/logout">Logout</a></li>
            <%
            } else {
            %>
            <li><a href="<%=request.getContextPath()%>/">Home</a></li>
            <li><a href="<%=request.getContextPath()%>/booking-service">Booking Service</a></li>
            <li><a href="<%=request.getContextPath()%>/invoice">Invoice</a></li>
            <li><a href="<%=request.getContextPath()%>/tracking">Tracking</a></li>
            <li><a href="<%=request.getContextPath()%>/previous-booking">Previous Booking</a></li>
            <li><a href="<%=request.getContextPath()%>/delivery-status">Delivery Status</a></li>
            <li><a href="<%=request.getContextPath()%>/pickup-scheduling">Pickup Scheduling</a></li>
            <li><a href="<%=request.getContextPath()%>/logout">Logout</a></li>
            <%
            }
            %>
        </ul>
    </nav>

    <!-- CONTACT SUPPORT CONTENT -->
    <h3>Contact Support</h3>

    <div class="card">
        <div>
            <h6>Email:</h6>
            <p>support@pms.com</p>
        </div>
        <div>
            <h6>Contact:</h6>
            <p>+91 7665774129</p>
        </div>
        <div>
            <h6>Address:</h6>
            <p>Assotech Business Cresterra, Tower 2, Noida Sector-135</p>
        </div>
    </div>

</body>
</html>
