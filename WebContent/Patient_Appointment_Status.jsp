<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
</head>
<body align="center" bgcolor="BEEEE3">
	<h1>Welcome to Patient Home</h1>
	<br>
	<br>
	<a href="Patient_Home.html">Home</a> |
	<a href="Patient_Profile.jsp">Profile</a> |
	<a href="Appointment.jsp">Appointment</a> |
	<a href="Patient_Appointment_Status.jsp">Appointment Status</a> |
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
		</tr>

		<%
			String sql = "select * from appointment where pid=?";
		ps = connection.prepareStatement(sql);
		int pid = (Integer) session.getAttribute("sid");
		ps.setInt(1, pid);
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
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>