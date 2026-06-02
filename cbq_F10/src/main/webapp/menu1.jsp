<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="db.jsp" %>
<%@ include file="header.jsp" %>

<%
	String sql = "SELECT STUID, SNAME, "
				+" SUBSTR(JUMIN, 1, 6) || '-' || SUBSTR(JUMIN, 7, 7) AS JUMIN, "
				+" DEPT_NAME, "
				+" CASE "
				+" WHEN SUBSTR(JUMIN, 7, 1) = '3' THEN '남자' "
				+" WHEN SUBSTR(JUMIN, 7, 1) = '4' THEN '여자' "
				+" ELSE '' END AS GENDER, "
				+" PHONE, EMAIL "
				+" FROM TBL_STUDENT_202210 "
				+" ORDER BY STUID ";

	PreparedStatement p = con.prepareStatement(sql);
	ResultSet rs = p.executeQuery();
%>

<h2>학생정보현황</h2>

<table>
	<tr>
		<th>학번</th>
		<th>이름</th>
		<th>주민번호</th>
		<th>학과명</th>
		<th>성별</th>
		<th>전화번호</th>
		<th>이메일</th>
	</tr>

<%
	while(rs.next()) {
%>
	<tr>
		<td><%=rs.getString("STUID") %></td>
		<td><%=rs.getString("SNAME") %></td>
		<td><%=rs.getString("JUMIN") %></td>
		<td><%=rs.getString("DEPT_NAME") %></td>
		<td><%=rs.getString("GENDER") %></td>
		<td><%=rs.getString("PHONE") %></td>
		<td><%=rs.getString("EMAIL") %></td>
	</tr>
<%
	}
	
	rs.close();
	p.close();
	con.close();
%>
</table>
<%@ include file="footer.jsp" %>