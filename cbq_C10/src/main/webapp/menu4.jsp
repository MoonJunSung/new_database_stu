<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="db.jsp" %>
<%@ include file="header.jsp" %>
<h2>회원정보조회</h2>
<table>
	<tr>
	    <th>회원번호</th>
	    <th>회원명</th>
	    <th>전화번호</th>
	    <th>주소</th>
	    <th>생년월일</th>
	</tr>
<%
	String sql = "SELECT M_NO, "
	           + "M_NAME, "
	           + "PHONE, "
	           + "ADDRESS, "
	           + "SUBSTR(BIRTH_DAY,1,4)||'년'||SUBSTR(BIRTH_DAY,5,2)||'월'||SUBSTR(BIRTH_DAY,7,2)||'일' AS BIRTH_DAY "
	           + "FROM TBL_MEMBER_01 "
	           + "ORDER BY M_NO ASC";
	PreparedStatement p = con.prepareStatement(sql);
	ResultSet rs = p.executeQuery();
	while(rs.next()){
%>
	<tr>
	    <td><%=rs.getString("M_NO") %></td>
	    <td><%=rs.getString("M_NAME") %></td>
	    <td><%=rs.getString("PHONE") %></td>
	    <td><%=rs.getString("ADDRESS") %></td>
	    <td><%=rs.getString("BIRTH_DAY") %></td>
	</tr>
<%
	}
	rs.close();
	p.close();
	con.close();
%>
</table>
<%@ include file="footer.jsp" %>