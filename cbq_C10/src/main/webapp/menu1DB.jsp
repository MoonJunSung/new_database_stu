<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="db.jsp"%>

<%
    request.setCharacterEncoding("UTF-8");
    String r_no = request.getParameter("R_NO");
    String m_no = request.getParameter("M_NO");
    String b_code = request.getParameter("B_CODE");
    String rent_date = request.getParameter("RENT_DATE");
    int rent_days = Integer.parseInt(request.getParameter("rent_days"));
    
    String sql = "INSERT INTO TBL_RENT_01 VALUES (?, ?, ?, ?, ?)";
    PreparedStatement p = con.prepareStatement(sql);
    p.setString(1, r_no);
    p.setString(2, m_no);
    p.setString(3, b_code);
    p.setString(4, rent_date);
    p.setInt(5, rent_days);
    
    p.executeUpdate();
    p.close();
    
    String updateSql = "UPDATE TBL_BOOK_01 SET B_RENT = 'Y' WHERE B_CODE = ?";
    PreparedStatement p1 = con.prepareStatement(updateSql);
    p1.setString(1, b_code);
    p1.executeUpdate();
    p1.close();
    
    con.close();
    response.sendRedirect("index.jsp");
%>
