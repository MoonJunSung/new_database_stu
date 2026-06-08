<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="db.jsp" %>
<%@ include file="header.jsp" %>
<script src="script.js"></script>
<h2>도서대출입력</h2>
<form name="frm" method="post" action="menu1DB.jsp">
<table>
	<tr>
	    <th>대출번호</th>
	    <td><input type="text" name="R_NO" autofocus="autofocus"></td>
	    <td style="text-align: left">예)20250001</td>
	</tr>
	<tr>
	    <th>회원번호</th>
	    <td><input type="text" name="M_NO"></td>
	    <td style="text-align: left">예)1001</td>
	</tr>
	<tr>
	    <th>도서명</th>
	    <td colspan="2" style="text-align: left">
	        <select name="B_CODE">
					<option value="">도서선택</option>
				<%
					String sql = "SELECT B_CODE, B_NAME FROM TBL_BOOK_01 ORDER BY B_CODE ASC";
					PreparedStatement p = con.prepareStatement(sql);
					ResultSet rs = p.executeQuery();
				
					while(rs.next()) {
				%>
					<option value="<%=rs.getString("B_CODE") %>">
						<%=rs.getString("B_CODE") %>-<%=rs.getString("B_NAME") %>
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
	    <th>대출일자</th>
	    <td><input type="text" name="RENT_DATE"></td>
	    <td style="text-align: left">예)20250101</td>
	</tr>
	<tr>
	    <th>대출일수</th>
	    <td><input type="text" name="rent_days"></td>
	    <td style="text-align: left">예)세자리숫자</td>
	</tr>
	<tr>
	    <td colspan="3">
	        <input type="button" value="대출등록" onclick="return1Check()">
        	<input type="button" value="다시쓰기" onclick="return1Reset()">
	    </td>
	</tr>
</table>
</form>
<%@ include file="footer.jsp" %>
