<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
</head>
<body align="center" bgcolor="BEEEE3">
	<h1>Appointments</h1>
	<br>
	<br>
	<a href="Doctor_Home.html">Home</a> |
	<a href="Doctor_Profile.jsp">Profile</a> |
	<a href="View_Appointment.jsp">Appointment Details</a> |
	<a href="index.html">Logout</a>
	<br>
	<br>

	<%@include file="connection.jsp"%>
	<table border="1" align="center">
		<tr>
			<td>Patient Name</td>
			<td>Phone Number</td>
			<td>Email</td>
			<td>Gender</td>
			<td>Blood Group</td>
			<td>Specialist</td>
			<td>Date</td>
			<td>Time</td>
			<td>Status</td>
			<td>Doctor Name</td>
			<td>Action</td>
		</tr>

		<%
			String sql = "select * from appointment where specialist=?";
		ps = connection.prepareStatement(sql);
		String specialisation = (String) session.getAttribute("sspecialisation");
		ps.setString(1, specialisation);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString("name")%></td>
			<td><%=rs.getInt("phone")%></td>
			<td><%=rs.getString("email")%></td>
			<td><%=rs.getString("gender")%></td>
			<td><%=rs.getString("blood_group")%></td>
			<td><%=rs.getString("specialist")%></td>
			<td><%=rs.getString("date_of_appointment")%></td>
			<td><%=rs.getString("time_of_appointment")%></td>
			<td><%=rs.getString("status")%></td>
			<td><%=rs.getString("doctor_name")%></td>
			<%
				if (rs.getString("status").equalsIgnoreCase("Accepted")) {
			%>
			<td>Accepted</td>
			<%
				} else {
			%>
			<td><a href="Accept_Appointment.jsp?id=<%=rs.getInt("aid")%>">Accept</a></td>
			<%
				}
			%>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>