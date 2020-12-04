<%@ page import="java.sql.*"%>
<%@include file="connection.jsp"%>
<%
	int id = (Integer) session.getAttribute("sid");
String name = request.getParameter("name");
String email = request.getParameter("email");
long phone = Long.parseLong(request.getParameter("phone"));
String specialisation = request.getParameter("specialisation");

String sql = "Update doctor set name=?,email=?,phone=?,specialisation=? where id=?";

ps = connection.prepareStatement(sql);
ps.setString(1, name);
ps.setString(2, email);
ps.setLong(3, phone);
ps.setString(4, specialisation);
ps.setInt(5, id);

int x = ps.executeUpdate();
if (x != 0)
	response.sendRedirect("Doctor_Profile.jsp?msg=updated");
%>