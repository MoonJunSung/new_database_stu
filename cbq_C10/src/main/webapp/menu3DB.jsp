<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ include file="db.jsp"%>

<%
    request.setCharacterEncoding("UTF-8");

    String M_NO = request.getParameter("M_NO");

    String sql = "SELECT R.R_NO, "
               + "R.M_NO, "
               + "R.B_CODE, "
               + "B.B_NAME, "
               + "TO_CHAR(TO_DATE(R.RENT_DATE, 'YYYYMMDD'), 'YYYY\"년\"MM\"월\"DD\"일\"') AS RENT_DATE, "
               + "R.RENT_DAYS "
               + "FROM TBL_RENT_01 R "
               + "JOIN TBL_BOOK_01 B "
               + "ON R.B_CODE = B.B_CODE "
               + "WHERE R.M_NO = ? "
               + "ORDER BY R.R_NO ASC";

    PreparedStatement p = con.prepareStatement(sql);
    p.setString(1, M_NO);

    ResultSet rs = p.executeQuery();
%>

<%
    if(rs.next()){
%>
	<h2><%=M_NO %>님의 대출정보</h2>

	<table>
		<tr>
			<th>대출번호</th>
			<th>회원번호</th>
			<th>도서코드</th>
			<th>도서명</th>
			<th>대출일자</th>
			<th>대출일수</th>
		</tr>

<%
		do{
%>
		<tr>
			<td><%=rs.getString("R_NO") %></td>
			<td><%=rs.getString("M_NO") %></td>
			<td><%=rs.getString("B_CODE") %></td>
			<td><%=rs.getString("B_NAME") %></td>
			<td><%=rs.getString("RENT_DATE") %></td>
			<td><%=rs.getString("RENT_DAYS") %></td>
		</tr>
<%
		}while(rs.next());
%>
	</table>

<%
    }else{
%>
	<h2>해당 회원의 대출 정보가 없습니다.</h2>
<%
    }
%>

<div style="text-align: center; margin-top: 15px;">
	<input type="button" value="돌아가기" onclick="location.href='menu3.jsp'">
</div>

<%
    rs.close();
    p.close();
    con.close();
%>

<%@ include file="footer.jsp"%>