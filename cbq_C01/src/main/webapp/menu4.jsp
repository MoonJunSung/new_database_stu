<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="db.jsp" %>
<%@ include file="header.jsp" %>
<script src="script.js"></script>

<h2>과목별 성적 조회</h2>

<form name="frm" method="post" action="" onsubmit="return menu4Check()">
	<table>
		<tr>
			<th>과목코드</th>
			<td>
				<input type="text" name="subcode" autofocus="autofocus">
			</td>
			<td>
				<input type="submit" value="조회">
			</td>
		</tr>
	</table>
</form>

<br><br>

<table>
	<tr>
		<th>학번</th>
		<th>성명</th>
		<th>학과</th>
		<th>과목</th>
		<th>중간</th>
		<th>기말</th>
		<th>출석</th>
		<th>레포트</th>
		<th>기타</th>
		<th>총점</th>
		<th>학점</th>
	</tr>
<%
	request.setCharacterEncoding("UTF-8");

	String subcode = request.getParameter("subcode");

	String sql = "SELECT ST.STUID, ST.SNAME, ST.DEPT_NAME, "
				+" SJ.SUBNAME, "
				+" SC.MIDSCORE, SC.FINALSCORE, SC.ATTEND, SC.REPORT, SC.ETC, "
				+" ROUND(SC.MIDSCORE * 0.3 + SC.FINALSCORE * 0.3 + SC.ATTEND * 0.2 + SC.REPORT * 0.1 + SC.ETC * 0.1, 1) AS TOTALSCORE, "
				+" CASE "
				+" WHEN SC.MIDSCORE * 0.3 + SC.FINALSCORE * 0.3 + SC.ATTEND * 0.2 + SC.REPORT * 0.1 + SC.ETC * 0.1 >= 95 THEN 'A+' "
				+" WHEN SC.MIDSCORE * 0.3 + SC.FINALSCORE * 0.3 + SC.ATTEND * 0.2 + SC.REPORT * 0.1 + SC.ETC * 0.1 >= 90 THEN 'A' "
				+" WHEN SC.MIDSCORE * 0.3 + SC.FINALSCORE * 0.3 + SC.ATTEND * 0.2 + SC.REPORT * 0.1 + SC.ETC * 0.1 >= 85 THEN 'B+' "
				+" WHEN SC.MIDSCORE * 0.3 + SC.FINALSCORE * 0.3 + SC.ATTEND * 0.2 + SC.REPORT * 0.1 + SC.ETC * 0.1 >= 80 THEN 'B' "
				+" WHEN SC.MIDSCORE * 0.3 + SC.FINALSCORE * 0.3 + SC.ATTEND * 0.2 + SC.REPORT * 0.1 + SC.ETC * 0.1 >= 75 THEN 'C+' "
				+" WHEN SC.MIDSCORE * 0.3 + SC.FINALSCORE * 0.3 + SC.ATTEND * 0.2 + SC.REPORT * 0.1 + SC.ETC * 0.1 >= 70 THEN 'C' "
				+" WHEN SC.MIDSCORE * 0.3 + SC.FINALSCORE * 0.3 + SC.ATTEND * 0.2 + SC.REPORT * 0.1 + SC.ETC * 0.1 >= 65 THEN 'D+' "
				+" WHEN SC.MIDSCORE * 0.3 + SC.FINALSCORE * 0.3 + SC.ATTEND * 0.2 + SC.REPORT * 0.1 + SC.ETC * 0.1 >= 60 THEN 'D' "
				+" ELSE 'F' END AS GRADE "
				+" FROM TBL_STUDENT_202210 ST "
				+" JOIN TBL_SCORE_202210 SC ON ST.STUID = SC.SID "
				+" JOIN TBL_SUBJECT_202210 SJ ON SC.SUBCODE = SJ.SUBCODE "
				+" WHERE TRIM(SC.SUBCODE) = ? "
				+" ORDER BY ST.STUID ";

	PreparedStatement p = con.prepareStatement(sql);
	p.setString(1, subcode);

	ResultSet rs = p.executeQuery();

	if(rs.next()){
%>


<%
		do{
%>
	<tr>
		<td><%=rs.getString("STUID") %></td>
		<td><%=rs.getString("SNAME") %></td>
		<td><%=rs.getString("DEPT_NAME") %></td>
		<td><%=rs.getString("SUBNAME") %></td>
		<td><%=rs.getString("MIDSCORE") %></td>
		<td><%=rs.getString("FINALSCORE") %></td>
		<td><%=rs.getString("ATTEND") %></td>
		<td><%=rs.getString("REPORT") %></td>
		<td><%=rs.getString("ETC") %></td>
		<td><%=rs.getString("TOTALSCORE") %></td>
		<td><%=rs.getString("GRADE") %></td>
	</tr>
<%
		}while(rs.next());
%>
</table>

<%
	}

	rs.close();
	p.close();

%>

<%@ include file="footer.jsp" %>
