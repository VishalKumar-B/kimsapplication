package com.motivity.patient;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.databaseconnection.DatabaseConnection;

public class PatientLogin extends HttpServlet {

	Connection connection = null;
	PreparedStatement ps = null;

	public void init(ServletConfig config) {
		try {
			connection = DatabaseConnection.connectivity();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String password = request.getParameter("password");
		PrintWriter pw = response.getWriter();

		String sql = "select * from patient where email=? and password=?";

		try {
			ps = connection.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);

			HttpSession hs = request.getSession();
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				hs.setAttribute("sid", rs.getInt("id"));
				hs.setAttribute("spname", rs.getString("name"));
				response.sendRedirect("./Patient_Home.html?msg=loggedin");
			} else {
				response.sendRedirect("./Patient_Login.html?msg=failed");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}