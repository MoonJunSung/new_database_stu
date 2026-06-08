<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="db.jsp" %>
<%@ include file="header.jsp" %>
<h2>전체도서조회</h2>
<table>
<tr>
    <th>도서코드</th>
    <th>도서명</th>
    <th>도서위치</th>
    <th>도서취득일</th>
    <th>대출상태</th>
</tr>
<%
		String sql = "SELECT B_CODE, " 
		        + " B_NAME, "
		        + " B_LOCATION, "
		        + " SUBSTR(B_GET_DATE,1,4)||'년'||SUBSTR(B_GET_DATE,5,2)||'월'||SUBSTR(B_GET_DATE,7,2)||'일' AS B_GET_DATE, "
		        + " CASE WHEN B_RENT = 'Y' THEN '대출중' "
		        + " ELSE '대출가능' END AS B_RENT "
		        + " FROM TBL_BOOK_01 "
		        + " ORDER BY B_CODE ASC";
    PreparedStatement p = con.prepareStatement(sql);
    ResultSet rs = p.executeQuery();

    while(rs.next()) {
%>
<tr>
    <td><%=rs.getString("B_CODE") %></td>
    <td><%=rs.getString("B_NAME") %></td>
    <td><%=rs.getString("B_LOCATION") %></td>
    <td><%=rs.getString("B_GET_DATE") %></td>
    <td><%=rs.getString("B_RENT") %></td>
</tr>
<%
    }
    rs.close();
    p.close();
    con.close();
%>
</table>
<%@ include file="footer.jsp" %>
