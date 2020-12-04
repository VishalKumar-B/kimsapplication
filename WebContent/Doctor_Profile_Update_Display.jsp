<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
</head>
<body align="center" bgcolor="BEEEE3">
	<h1>Welcome to Doctor Home</h1>
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
	<%
		int id = (Integer) session.getAttribute("sid");
	String sql = "select * from doctor where id=?";
	ps = connection.prepareStatement(sql);
	ps.setInt(1, id);
	ResultSet rs = ps.executeQuery();
	if (rs.next()) {
	%>
	<form action="./Doctor_Profile_Update.jsp" method="post">
		<table align="center">
			<tr>
				<td align="right">Name:</td>
				<td align="left"><input type="text" name="name"
					value="<%=rs.getString("name")%>"></td>
			</tr>
			<tr>
				<td align="right">E-mail:</td>
				<td align="left"><input type="email" name="email"
					value="<%=rs.getString("email")%>"></td>
			</tr>
			<tr>
				<td align="right">Phone Number:</td>
				<td align="left"><input type="number" name="phone"
					value="<%=rs.getInt("phone")%>"></td>
			</tr>
			<tr>
				<td align="right">specialisation:</td>
				<td align="left"><select name="specialisation">
						<option value="<%=rs.getString("specialisation")%>"><%=rs.getString("specialisation")%></option>
						<option value="dentist">Dentist</option>
						<option value="ENT">ENT</option>
						<option value="cardiologist">Cardiologist</option>
				</select></td>
			</tr>
			<tr>
				<td align="right"><input type="submit" value="Update"></td>
				<td align="left"><input type="reset" value="Reset"></td>
			</tr>
		</table>
	</form>

	<%
		}
	%>