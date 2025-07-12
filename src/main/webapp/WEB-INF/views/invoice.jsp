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
<title>Invoice</title>
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
		border-radius: 4px;
	}
	nav a:hover {
		background-color: #2c3e50;
	}
	h2 {
		text-align: center;
		color: #2c3e50;
		margin: 30px 0 20px;
		font-size: 2rem;
	}
	.form-container {
		display: flex;
		justify-content: center;
		margin-bottom: 20px;
	}
	form {
		display: flex;
		gap: 10px;
		background-color: white;
		padding: 20px;
		border-radius: 8px;
		box-shadow: 0 0 10px rgba(0,0,0,0.1);
	}
	input[type="number"] {
		width: 350px;
		padding: 10px;
		font-size: 16px;
		border: 1px solid #ccc;
		border-radius: 4px;
	}
	button {
		padding: 10px 18px;
		background-color: #34495e;
		color: white;
		border: none;
		border-radius: 4px;
		font-weight: bold;
		cursor: pointer;
	}
	button:hover {
		background-color: #2c3e50;
	}
	.invalid-feedback {
		color: red;
		font-size: 12px;
		margin-top: 5px;
		display: none;
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
	.invoice-container {
		width: 700px;
		margin: 30px auto;
		background-color: white;
		padding: 30px 40px;
		border-radius: 10px;
		box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	}
	.invoice-title {
		text-align: center;
		color: #2c3e50;
		margin-bottom: 30px;
		font-size: 1.5rem;
	}
	.invoice-row {
		display: flex;
		justify-content: space-between;
		border-bottom: 1px solid #ddd;
		padding: 10px 0;
	}
	.invoice-row p {
		margin: 0;
	}
	.print-btn {
		display: flex;
		justify-content: center;
		margin-top: 10px;
	}
	@media print {
		.d-print-none {
			display: none;
		}
	}
</style>
</head>
<body>

	<jsp:include page="navbar.jsp" />

	<h2 class="d-print-none">Invoice</h2>

	<input type="hidden" id="bId" value="<%=request.getAttribute("bId") != null ? request.getAttribute("bId") : ""%>" />

	<div class="form-container d-print-none">
		<form id="invoice-form" action="<%=request.getContextPath()%>/invoice" method="post" onsubmit="return validateForm()">
			<div>
				<input type="number" name="bookingId" id="bookingId"
					oninput="this.value=this.value.slice(0,9)"
					placeholder="Enter Booking ID" required />
				<small class="invalid-feedback" id="error-msg">Booking ID must be a number (max 9 digits)</small>
			</div>
			<button type="submit">Generate</button>
		</form>
	</div>

	<% if ("error".equals(request.getAttribute("status"))) { %>
		<div style="display: flex; justify-content: center;">
			<div class="alert d-print-none"><%=request.getAttribute("errorMessage")%></div>
		</div>
	<% } %>

	<%
	if ("success".equals(request.getAttribute("status"))) {
		String[] titles = new String[]{"Booking ID", "Receiver Name", "Receiver Address", "Receiver Pin Code",
			"Receiver Mobile Number", "Parcel Weight", "Parcel Contents Description", "Parcel Delivery Type",
			"Parcel Packing Preference", "Parcel Pickup Time", "Parcel Dropoff Time", "Parcel Service Cost"};
		String[] attributes = new String[]{"bookingId", "receiverName", "receiverAddress", "receiverPin",
			"receiverMobileNumber", "parcelWeight", "parcelContentsDescription", "parcelDeliveryType",
			"parcelPackingPreference", "parcelPickupTime", "parcelDropoffTime", "parcelServiceCost"};
	%>
	<div class="invoice-container">
		<div class="print-btn d-print-none">
			<button onclick="printDetails()">Print</button>
		</div>
		<h3 class="invoice-title">My Invoice</h3>
		<%
		for (int i = 0; i < titles.length; i++) {
		%>
		<div class="invoice-row">
			<p><strong><%=titles[i]%></strong></p>
			<p><%="parcelServiceCost".equals(attributes[i]) ? "Rs " + request.getAttribute(attributes[i]) : request.getAttribute(attributes[i])%></p>
		</div>
		<% } %>
	</div>
	<% } %>

	<script>
		document.addEventListener("DOMContentLoaded", function () {
			const bId = document.getElementById("bId").value;
			if (bId && bId.length > 0) {
				document.getElementById("bookingId").value = bId;
				if (validateForm()) {
					document.getElementById("invoice-form").submit();
				}
			}
		});

		function validateForm() {
			const bookingId = document.getElementById("bookingId");
			const errorMsg = document.getElementById("error-msg");
			const pattern = /^\d{1,9}$/;
			errorMsg.style.display = "none";
			if (!pattern.test(bookingId.value)) {
				errorMsg.style.display = "block";
				return false;
			}
			return true;
		}

		function printDetails() {
			window.print();
		}
	</script>
</body>
</html>
