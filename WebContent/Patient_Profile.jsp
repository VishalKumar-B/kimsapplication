<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
</head>
<body align="center" bgcolor="BEEEE3">
	<h1>Welcome to Patient Profile</h1>
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
	<table align="center" border="1.0" cellpadding="2">
		<tr>
			<td>Id</td>
			<td>Name</td>
			<td>Email</td>
			<td>Age</td>
			<td>Phone</td>
			<td>Action</td>
		</tr>
		<%
			int id = (Integer) session.getAttribute("sid");
		String sql = "select * from patient where id=?";
		ps = connection.prepareStatement(sql);
		ps.setInt(1, id);
		ResultSet rs = ps.executeQuery();

		while (rs.next()) {
		%>

		<tr>
			<td><%=rs.getInt("id")%></td>
			<td><%=rs.getString("name")%></td>
			<td><%=rs.getString("email")%></td>
			<td><%=rs.getInt("age")%></td>
			<td><%=rs.getInt("phone")%></td>
			<td><a href="Patient_Profile_Update_Display.jsp?msg=+id">Update</a></td>
		</tr>

		<%
			}
		%>

	</table>
</body>
</html>