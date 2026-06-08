<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="db.jsp" %>
<%@ include file="header.jsp" %>
<h2>도서대출입력</h2>
<form name="frm" method="POST" onsubmit="return menu2Check()">
	<table>
		<tr>
		    <th>대출번호</th>
		    	<td style="text-align: left"><input type="text" name="R_NO" autofocus="autofocus"></td>
		   		<td style="text-align: left">예)20250001</td>
		</tr>
		<tr>
		    <th>회원번호</th>
		    	<td style="text-align: left"><input type="text" name="R_NO"></td>
		   		<td style="text-align: left">예)1001</td>
		</tr>
		<tr>
			<th>도서코드</th>
			<td colspan="2" style="text-align: left">
				<select name="B_CODE">
					<%
						
					%>
				</select>
			</td>
		</tr>
	</table>
</form>

<%@ include file="footer.jsp" %>