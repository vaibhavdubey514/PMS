<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" integrity="sha512-..." crossorigin="anonymous" referrerpolicy="no-referrer" />


<style>
	nav {
		background-color: #34495e;
		padding: 15px 0;
	}
	nav ul {
		list-style: none;
		margin: 0;
		padding: 0;
		display: flex;
		justify-content: space-between;
		flex-wrap: wrap;
	}
	
	nav ul div{
	margin: 0;
		padding: 0;
	display: flex;
		justify-content: space-between;
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
	}
	nav a:hover {
		background-color: #2c3e50;
	}
</style>

<nav class="d-print-none">
	<ul>
		<div>
		<li><a href=""><i class="fa-solid fa-user"></i>&nbsp;<%=session.getAttribute("userId") %></a></li>
		</div>
		
		<div>
		<%
		if ("Customer".equals(request.getAttribute("role"))) {
		%>
		<li><a href="<%=request.getContextPath()%>/">Home</a></li>
		<li><a href="<%=request.getContextPath()%>/booking-service">Booking Service</a></li>
		<li><a href="<%=request.getContextPath()%>/invoice">Invoice</a></li>
		<li><a href="<%=request.getContextPath()%>/tracking">Tracking</a></li>
		<li><a href="<%=request.getContextPath()%>/previous-booking">Previous Booking</a></li>
		<li><a href="<%=request.getContextPath()%>/contact-support">Contact Support</a></li>
		<%--<li><a href="<%=request.getContextPath()%>/logout">Logout</a></li>--%>
		<%
		} else {
		%>
		<li><a href="<%=request.getContextPath()%>/">Home</a></li>
		<%-- <li><a href="<%=request.getContextPath()%>/booking-service">Booking Service</a></li> --%>
		<%-- <li><a href="<%=request.getContextPath()%>/invoice">Invoice</a></li> --%>
		<li><a href="<%=request.getContextPath()%>/tracking">Tracking</a></li>
		<li><a href="<%=request.getContextPath()%>/previous-booking">All Bookings</a></li>
		<li><a href="<%=request.getContextPath()%>/delivery-status">Delivery Status/Update</a></li>
		<li><a href="<%=request.getContextPath()%>/pickup-scheduling">Pickup Scheduling</a></li>
		<%-- <li><a href="<%=request.getContextPath()%>/logout">Logout</a></li> --%>
		<%
		}
		%>
		</div>
		
		<div>
		<li><a href="<%=request.getContextPath()%>/logout">Logout<i class="fa-solid fa-right-from-bracket"></i>&nbsp;</a></li>
		</div>
	</ul>
</nav>
