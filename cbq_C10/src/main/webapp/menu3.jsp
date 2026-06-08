<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="db.jsp" %>
<%@ include file="header.jsp" %>

<script src="script.js"></script>

<h2>회원별대출조회</h2>

<form name="frm" method="post" action="menu3DB.jsp">
<table>
	<tr>
		<th>회원명</th>
		<td style="text-align: left">
			<select name="M_NO">
				<option value="">회원선택</option>
				<%
					String sql = "SELECT M_NO, M_NAME FROM TBL_MEMBER_01 ORDER BY M_NO ASC";
					PreparedStatement p = con.prepareStatement(sql);
					ResultSet rs = p.executeQuery();

					while(rs.next()) {
				%>
					<option value="<%=rs.getString("M_NO") %>">
						<%=rs.getString("M_NAME") %>-<%=rs.getString("M_NO") %>
					</option>
				<%
					}
					rs.close();
					p.close();
					con.close();
				%>
			</select>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="button" value="조회하기" onclick="return2Check()">
			<input type="button" value="홈으로" onclick="location.href='index.jsp'">
		</td>
	</tr>
</table>
</form>

<%@ include file="footer.jsp" %>