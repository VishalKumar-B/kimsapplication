<%@ page import="java.sql.*"%>
<%@include file="connection.jsp"%>
<%
	int id = (Integer) session.getAttribute("sid");
String name = request.getParameter("name");
String email = request.getParameter("email");
int age = Integer.parseInt(request.getParameter("age"));
long phone = Long.parseLong(request.getParameter("phone"));

String sql = "Update patient set name=?,email=?,age=?,phone=? where id=?";

ps = connection.prepareStatement(sql);
ps.setString(1, name);
ps.setString(2, email);
ps.setInt(3, age);
ps.setLong(4, phone);
ps.setInt(5, id);

int x = ps.executeUpdate();
if (x != 0)
	response.sendRedirect("Patient_Profile.jsp?msg=updated");
%>