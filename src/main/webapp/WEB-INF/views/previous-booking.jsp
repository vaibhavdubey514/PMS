<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
if (session.getAttribute("name") == null) {
	response.sendRedirect(request.getContextPath() + "/login");
}
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/x-icon" href="https://static.vecteezy.com/system/resources/thumbnails/002/206/240/small/fast-delivery-icon-free-vector.jpg">
<meta charset="UTF-8">
<title>Previous Booking</title>
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

    h2 {
        font-size: 2rem;
        color: #2c3e50;
        text-align: center;
        margin: 30px 0;
    }

    .form-group {
        margin: 20px auto;
        width: 90%;
        max-width: 400px;
    }

    .form-group label {
        font-weight: bold;
        display: block;
        margin-bottom: 5px;
    }

    .form-group input {
        width: 100%;
        padding: 10px;
        font-size: 15px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    form {
        background-color: white;
        padding: 20px;
        margin: 20px auto;
        border-radius: 8px;
        max-width: 800px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    button[type="submit"] {
        padding: 10px 20px;
        background-color: #34495e;
        color: white;
        border: none;
        border-radius: 4px;
        font-weight: bold;
        cursor: pointer;
        display: block;
        margin: 20px auto 0;
    }

    button[type="submit"]:hover {
        background-color: #2c3e50;
    }

    .alert {
        background-color: #f8d7da;
        color: #721c24;
        border-radius: 5px;
        padding: 10px;
        margin-top: 20px;
        font-weight: bold;
        width: 500px;
        text-align: center;
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

    .pagination {
        display: flex;
        list-style: none;
        padding-left: 0;
        justify-content: center;
        margin-top: 20px;
    }

    .page-item button {
        padding: 6px 12px;
        margin: 0 4px;
        border: none;
        border-radius: 4px;
        background-color: #34495e;
        color: white;
        font-weight: bold;
        cursor: pointer;
    }

    .page-item.active button {
        background-color: #2c3e50;
    }

    .filter-input {
        margin: 20px auto;
        max-width: 400px;
    }

    .filter-input label {
        font-weight: bold;
        display: block;
        margin-bottom: 5px;
    }

    .filter-input input {
        width: 100%;
        padding: 10px;
        font-size: 15px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }
</style>
</head>
<body>
	<jsp:include page="navbar.jsp" />

	<%-- <h2>Previous Booking</h2> --%>

	<%
	if ("Customer".equals(request.getAttribute("role"))) {
	%>
	<h2>Previous Booking</h2>
	<div class="filter-input">
		<label for="bookingIdFilterCustomer">Filter by Booking ID:</label>
		<input type="number" id="bookingIdFilterCustomer" placeholder="Enter Booking ID"
			   oninput="this.value=this.value.slice(0,9)" />
	</div>

	<table>
		<thead>
			<tr>
				<th>User ID</th>
				<th>Booking ID</th>
				<th>Booking Date</th>
				<th>Receiver Name</th>
				<th>Delivered Address</th>
				<th>Amount</th>
				<th>Status</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody id="customer-tbody">
			<%
			ArrayList<ArrayList<String>> customerDetails = (ArrayList<ArrayList<String>>) request.getAttribute("history");
			if (customerDetails == null) {
				customerDetails = new ArrayList<>();
			}
			for (ArrayList<String> row : customerDetails) {
			%>
			<tr>
				<td><%=request.getAttribute("userId")%></td>
				<td><%=row.get(0)%></td>
				<td><%=row.get(1)%></td>
				<td><%=row.get(2)%></td>
				<td><%=row.get(3)%></td>
				<td><%=row.get(4)%></td>
				<td><%=row.get(5)%></td>
				<td>
				
				
					 <%
        String status = row.get(5).trim().toLowerCase();  // Normalized to lower case
        String bookingId = row.get(0);
        if ("booked".equals(status) || "in transit".equals(status)) {
    %>
        <a href="<%=request.getContextPath()%>/cancel-booking?bookingId=<%=bookingId%>"
           onclick="return confirm('Are you sure you want to cancel this booking?');"
           style="display:inline-block; padding:5px 10px; background-color:#e74c3c; color:white; text-decoration:none; border-radius:4px; font-weight:bold;">
           Cancel
        </a>
    <%
        } else {
    %>
        <span style="display:inline-block; padding:5px 10px; background-color:gray; color:white; border-radius:4px; font-weight:bold; cursor:not-allowed;" title="Cannot cancel this booking">
           Cancel
        </span>
    <%
        }
    %>
    
    
				</td>
			</tr>
			<% } %>
		</tbody>
	</table>

	<ul id="customer-pagination" class="pagination"></ul>
	<% } %>

	<% if ("Officer".equals(request.getAttribute("role"))) { %>
	<h2>All Bookings</h2>
	<form action="<%=request.getContextPath()%>/previous-booking" method="post" onsubmit="return validateForm()">
		<div class="form-group">
			<label for="userId">User ID</label>
			<input type="text" id="userId" name="userId" placeholder="Enter User ID" minlength="5" maxlength="15" required />
		</div>
		<div class="form-group">
			<label for="startDate">Start Date</label>
			<input type="date" id="startDate" name="startDate" required />
		</div>
		<div class="form-group">
			<label for="endDate">End Date</label>
			<input type="date" id="endDate" name="endDate" required />
		</div>
		<button type="submit">Search</button>
	</form>

	<div class="filter-input">
		<label for="bookingIdFilterOfficer">Filter by Booking ID:</label>
		<input type="number" id="bookingIdFilterOfficer" placeholder="Enter Booking ID"
			   oninput="this.value=this.value.slice(0,9)" />
	</div>

	<table>
		<thead>
			<tr>
				<th>User ID</th>
				<th>Booking ID</th>
				<th>Booking Date</th>
				<th>Receiver Name</th>
				<th>Delivered Address</th>
				<th>Amount</th>
				<th>Status</th>
			</tr>
		</thead>
		<tbody id="officer-tbody">
			<%
			ArrayList<ArrayList<String>> officerDetails = (ArrayList<ArrayList<String>>) request.getAttribute("history");
			if (officerDetails == null) {
				officerDetails = new ArrayList<>();
			}
			for (ArrayList<String> row : officerDetails) {
			%>
			<tr>
				<td><%=request.getAttribute("userId")%></td>
				<td><%=row.get(0)%></td>
				<td><%=row.get(1)%></td>
				<td><%=row.get(2)%></td>
				<td><%=row.get(3)%></td>
				<td><%=row.get(4)%></td>
				<td><%=row.get(5)%></td>
			</tr>
			<% } %>
		</tbody>
	</table>

	<ul class="pagination" id="officer-pagination"></ul>
	<% } %>

	<% if ("error".equals(request.getAttribute("status"))) { %>
	<div style="display: flex; justify-content: center;">
		<div class="alert"><%=request.getAttribute("errorMessage")%></div>
	</div>
	<% } %>

	<script>
		function validateForm() {
			const userId = document.getElementById("userId");
			const startDate = new Date(document.getElementById("startDate").value);
			const endDate = new Date(document.getElementById("endDate").value);

			if (userId.value.length < 5 || userId.value.length > 15) {
				alert("User ID must be between 5 and 15 characters.");
				return false;
			}
			if (startDate > endDate) {
				alert("Start Date must be before End Date.");
				return false;
			}
			return true;
		}

		document.addEventListener("DOMContentLoaded", function () {
			const role = "<%=request.getAttribute("role")%>";
			let tbodyId = role === "Customer" ? "customer-tbody" : "officer-tbody";
			let paginationId = role === "Customer" ? "customer-pagination" : "officer-pagination";
			let filterId = role === "Customer" ? "bookingIdFilterCustomer" : "bookingIdFilterOfficer";

			const rowsPerPage = 5;
			let currentPage = 1;
			const tableBody = document.getElementById(tbodyId);
			const rows = Array.from(tableBody.getElementsByTagName("tr"));
			const pagination = document.getElementById(paginationId);
			let filteredRows = rows;

			displayRows();
			updatePagination();

			function displayRows() {
				const start = (currentPage - 1) * rowsPerPage;
				const end = start + rowsPerPage;
				tableBody.innerHTML = "";
				filteredRows.slice(start, end).forEach(row => tableBody.appendChild(row));
			}

			function updatePagination() {
				pagination.innerHTML = "";
				const totalPages = Math.ceil(filteredRows.length / rowsPerPage);
				for (let i = 1; i <= totalPages; i++) {
					const pageItem = document.createElement("li");
					pageItem.className = "page-item" + (i === currentPage ? " active" : "");
					const btn = document.createElement("button");
					btn.innerText = i;
					btn.onclick = () => {
						currentPage = i;
						displayRows();
						updatePagination();
					};
					pageItem.appendChild(btn);
					pagination.appendChild(pageItem);
				}
			}

			document.getElementById(filterId).addEventListener("input", e => {
				const filterText = e.target.value.trim();
				filteredRows = rows.filter(row => row.cells[1].textContent.includes(filterText));
				currentPage = 1;
				displayRows();
				updatePagination();
			});
		});
	</script>
</body>
</html>
