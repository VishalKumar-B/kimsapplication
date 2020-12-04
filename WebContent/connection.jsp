<%@ page import="java.sql.*,com.databaseconnection.DatabaseConnection"%>
<%
	Connection connection = DatabaseConnection.connectivity();
PreparedStatement ps = null;
%>