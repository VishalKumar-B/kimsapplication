package com.motivity.patient;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.databaseconnection.DatabaseConnection;

public class PatientRegister extends HttpServlet {

	Connection connection = null;
	PreparedStatement ps = null;

	public void init(ServletConfig config) {
		try {
			connection = DatabaseConnection.connectivity();
		} catch (ClassNotFoundException e) {
// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println(connection);
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		int age = Integer.parseInt(request.getParameter("age"));
		long phone = Long.parseLong(request.getParameter("phone"));
		PrintWriter pw = response.getWriter();

		String sql = "insert into patient (name, password, email, age, phone) values (?, ?, ?, ?, ?)";
		try {
			ps = connection.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, password);
			ps.setString(3, email);
			ps.setInt(4, age);
			ps.setLong(5, phone);
			pw.println("<html><body bg colour = 'lightblue'> <h1 align = 'centre'> ");
			int x = ps.executeUpdate();
			if (x != 0) {
				pw.println("patient registerd successfully");

			}
			pw.println("</h1><br><a href = 'Patient_Login.html'>Login</a></body> <html>");
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
}