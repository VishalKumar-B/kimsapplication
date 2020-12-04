<%@include file="connection.jsp"%>
<%
	int id = Integer.parseInt(request.getParameter("id"));
String name = (String) session.getAttribute("sname");
String sql = "update appointment set status=?,doctor_name=? where aid=?";
ps = connection.prepareStatement(sql);
ps.setString(1, "Accepted");
ps.setString(2, name);
ps.setInt(3, id);
int x = ps.executeUpdate();
if (x != 0)
	response.sendRedirect("View_Appointment.jsp?msg=Accepted");
%>