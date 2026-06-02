<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="db.jsp" %>
<%@ include file="header.jsp" %>
<script src="script.js"></script>

<h2>성적입력</h2>
<form name="frm" method="POST" onsubmit="return menu2Check()">
	<table>
		<tr>
			<th>학번</th>
			<td>
				<input type="text" name="sid" autofocus="autofocus">
			</td>
		</tr>
		<tr>
			<th>교과코드</th>
			<td>
				<select name="subcode">
				<%
					String sql = "SELECT SUBCODE, SUBNAME FROM TBL_SUBJECT_202210 ORDER BY SUBCODE ";
					PreparedStatement p = con.prepareStatement(sql);
					ResultSet rs = p.executeQuery();
					
					while(rs.next()) {
				%>
					<option value="<%=rs.getString("SUBCODE") %>">
						<%=rs.getString("SUBCODE") %>-<%=rs.getString("SUBNAME") %>
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
			<th>중간</th>
			<td>
				<input type="text" name="midscore">
			</td>
		</tr>
		<tr>
			<th>기말</th>
			<td>
				<input type="text" name="finalscore">
			</td>
		</tr>
		<tr>
			<th>출석</th>
			<td>
				<input type="text" name="attend">
			</td>
		</tr>
		<tr>
			<th>레포트</th>
			<td>
				<input type="text" name="report">
			</td>
		</tr>
		<tr>
			<th>기타</th>
			<td>
				<input type="text" name="etc">
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="등록">
				<input type="button" value="취소" onclick="menu2Reset()">
			</td>
		</tr>
	</table>
</form>
<%@ include file="footer.jsp" %>