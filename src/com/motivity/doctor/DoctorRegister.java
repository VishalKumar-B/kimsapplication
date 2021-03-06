package com.motivity.doctor;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.databaseconnection.DatabaseConnection;

public class DoctorRegister extends HttpServlet {

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
		String phone = request.getParameter("phone");
		long mobile = Long.parseLong(phone);
		String specialisation = request.getParameter("specialization");
		PrintWriter pw = response.getWriter();

		String sql = "insert into doctor (name, password, email, phone, specialisation) values (?, ?, ?, ?, ?)";
		try {
			ps = connection.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, password);
			ps.setString(3, email);
			ps.setLong(4, mobile);
			ps.setString(5, specialisation);
			pw.println("<html><body bg colour = 'lightblue'> <h1 align = 'centre'> ");
			int x = ps.executeUpdate();
			if (x != 0) {
				pw.println("doctor registerd successfully");

			}
			pw.println("</h1><br><a href = 'Doctor_Login.html'>Login</a></body> <html>");
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
}