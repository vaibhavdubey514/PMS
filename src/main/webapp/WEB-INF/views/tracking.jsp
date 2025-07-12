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
<meta charset="UTF-8">
<title>Track</title>

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
    text-align: center;
    margin-top: 40px;
}

.tracking-form-container {
    display: flex;
    justify-content: center;
    margin-top: 20px;
}

.tracking-form-container form {
    display: flex;
    align-items: center;
    gap: 10px;
    background-color: #fff;
    padding: 20px 25px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0,0,0,0.1);
}

.tracking-form-container input[type="number"] {
    padding: 10px;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 4px;
    width: 200px;
}

.tracking-form-container button {
    padding: 10px 18px;
    background-color: #34495e;
    color: white;
    border: none;
    border-radius: 4px;
    font-weight: bold;
    cursor: pointer;
}

.tracking-form-container button:hover {
    background-color: #2c3e50;
}

.alert {
    background-color: #f8d7da;
    color: #721c24;
    border-radius: 5px;
    padding: 10px;
    margin-top: 20px;
    font-weight: bold;
}

table {
    width: 90%;
    border-collapse: collapse;
    margin: 30px auto;
    background-color: #fff;
    border-radius: 8px;
    overflow: hidden;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

thead {
    background-color: #2c3e50;
    color: white;
}

th, td {
    padding: 12px 15px;
    text-align: center;
    border-bottom: 1px solid #ddd;
}

tbody tr:nth-child(even) {
    background-color: #f2f2f2;
}

tbody tr:hover {
    background-color: #e1e7ed;
    transition: background-color 0.3s ease;
}
</style>
</head>
<body>
	<jsp:include page="navbar.jsp" />

	<h2>Track Parcel</h2>

	<div class="tracking-form-container">
		<form action="<%=request.getContextPath()%>/tracking" method="post" onsubmit="return validateForm()">
			<input type="number" name="bookingId" id="bookingId" placeholder="Enter Booking ID"
				oninput="this.value=this.value.slice(0,9)" required />
			<button type="submit">Search</button>
		</form>
	</div>

	<div style="display: flex; justify-content: center;">
		<%
		if ("error".equals(request.getAttribute("status"))) {
		%>
		<div class="alert" style="width: 500px;"><%=request.getAttribute("errorMessage")%></div>
		<%
		}
		%>
	</div>

	<%
	if ("success".equals(request.getAttribute("status"))) {
	%>
	<table>
		<thead>
			<tr>
				<th>Booking Id</th>
				<th>Sender Name</th>
				<th>Sender Address</th>
				<th>Receiver Name</th>
				<th>Receiver Address</th>
				<th>Date of Booking</th>
				<th>Parcel Status</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><%=request.getAttribute("bookingId")%></td>
				<td><%=request.getAttribute("name")%></td>
				<td><%=request.getAttribute("address")%></td>
				<td><%=request.getAttribute("receiverName")%></td>
				<td><%=request.getAttribute("receiverAddress")%></td>
				<td><%=request.getAttribute("dateOfBooking")%></td>
				<td><%=request.getAttribute("parcelStatus")%></td>
			</tr>
		</tbody>
	</table>
	<%
	}
	%>

	<script>
		function validateForm() {
			const bookingId = document.getElementById("bookingId");
			const pattern = /^\d+$/;
			if (!pattern.test(bookingId.value)) {
				alert("Booking ID must be a valid number.");
				return false;
			}
			return true;
		}
	</script>
</body>
</html>
