<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
</head>
<body align="center" bgcolor="BEEEE3">
	<h1>Welcome to Doctor Profile</h1>
	<br>
	<br>
	<a href="Doctor_Home.html">Home</a> |
	<a href="Doctor_Profile.jsp">Profile</a> |
	<a href="View_Appointment.jsp">Appointment Details</a> |
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
			<td>Phone</td>
			<td>Specialisation</td>
			<td>Action</td>
		</tr>
		<%
			int id = (Integer) session.getAttribute("sid");
		String sql = "select * from doctor where id=?";
		ps = connection.prepareStatement(sql);
		ps.setInt(1, id);
		ResultSet rs = ps.executeQuery();

		while (rs.next()) {
		%>

		<tr>
			<td><%=rs.getInt("id")%></td>
			<td><%=rs.getString("name")%></td>
			<td><%=rs.getString("email")%></td>
			<td><%=rs.getInt("phone")%></td>
			<td><%=rs.getString("specialisation")%></td>
			<td><a href="Doctor_Profile_Update_Display.jsp?msg=+id">Update</a></td>
		</tr>

		<%
			}
		%>

	</table>
</body>
</html>