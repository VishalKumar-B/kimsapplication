<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
</head>
<body align="center" bgcolor="BEEEE3">
	<h1>Welcome to Appointment page</h1>
	<br>
	<br>
	<a href="Patient_Home.html">Home</a> |
	<a href="Patient_Profile.jsp">Profile</a> |
	<a href="Appointment.jsp">Appointment</a> |
	<a href="Patient_Appointment_Status.jsp">Appointment Status</a> |
	<a href="index.html">Logout</a>
	<br>
	<br>
	<%@ page import="java.sql.*"%>
	<%@include file="connection.jsp"%>
	<%
		int id = (Integer) session.getAttribute("sid");
	String sql = "select name,email,phone from patient where id=?";
	ps = connection.prepareStatement(sql);
	ps.setInt(1, id);
	ResultSet rs = ps.executeQuery();
	if (rs.next()) {
	%>
	<form action="Apply_Appointment.jsp" method="post">
		<table align="center">
			<tr>
				<td align="right">Name:</td>
				<td aligh="left"><input type="text" name="name"
					value="<%=rs.getString("name")%>"></td>
			</tr>
			<tr>
				<td align="right">Phone:</td>
				<td align="left"><input type="number" name="phone"
					value="<%=rs.getInt("phone")%>"></td>
			</tr>
			<tr>
				<td align="right">Email:</td>
				<td align="left"><input type="text" name="email"
					value="<%=rs.getString("email")%>"></td>
			</tr>
			<tr>
				<td align="right">Gender:</td>
				<td align="left"><input type="radio" name="gender" value="male">Male
					<input type="radio" name="gender" value="female">Female</td>
			</tr>
			<tr>
				<td align="right">Blood Group:</td>
				<td align="left"><select name="blood_group">
						<option value="none" selected disabled hidden>-select-</option>
						<option>A+</option>
						<option>B+</option>
						<option>O+</option>
						<option>AB+</option>
						<option>AB-</option>
						<option>O-</option>
						<option>B-</option>
				</select></td>
			</tr>
			<tr>
				<td align="right">Specialist:</td>
				<td align="left"><select name="specialist">
						<option value="none" selected disabled hidden>-select-</option>
						<option value="dentist">Dentist</option>
						<option value="ENT">ENT</option>
						<option value="cardiologist">Cardiologist</option>
				</select></td>
			</tr>
			<tr>
				<td align="right">Date:</td>
				<td align="left"><input type="date" name="date_of_appointment"></td>
			</tr>
			<tr>
				<td align="right">Time:</td>
				<td align="left"><input type="time" name="time_of_appointment"></td>
			</tr>
			<tr>
				<td></td>
				<td align="left"><input type="submit" value="Apply"></td>
			</tr>
		</table>
	</form>
	<%
		}
	%>
</body>
</html>