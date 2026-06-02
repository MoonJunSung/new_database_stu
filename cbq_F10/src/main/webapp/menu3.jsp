<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="db.jsp" %>
<%@ include file="header.jsp" %>

<%
		String sql = "SELECT ST.STUID, ST.SNAME, "
				+" SJ.SUBNAME, SJ.SUBCODE, SJ.PRONAME, "
				+" SC.MIDSCORE, SC.FINALSCORE, SC.ATTEND, SC.REPORT, SC.ETC, "
				+" ROUND((SC.MIDSCORE + SC.FINALSCORE + SC.ATTEND + SC.REPORT + SC.ETC) / 5, 0) AS AVGSCORE, "
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
				+" ORDER BY ST.STUID ";

	PreparedStatement p = con.prepareStatement(sql);
	ResultSet rs = p.executeQuery();
%>

<h2>성적현황</h2>

<table>
	<tr>
		<th>학번</th>
		<th>성명</th>
		<th>교과목</th>
		<th>교과목코드</th>
		<th>담당교수</th>
		<th>중간</th>
		<th>기말</th>
		<th>출석</th>
		<th>레포트</th>
		<th>기타</th>
		<th>평균</th>
		<th>총점</th>
		<th>학점</th>
	</tr>

<%
	while(rs.next()) {
%>
	<tr>
		<td><%=rs.getString("STUID") %></td>
		<td><%=rs.getString("SNAME") %></td>
		<td><%=rs.getString("SUBNAME") %></td>
		<td><%=rs.getString("SUBCODE") %></td>
		<td><%=rs.getString("PRONAME") %></td>
		<td><%=rs.getString("MIDSCORE") %></td>
		<td><%=rs.getString("FINALSCORE") %></td>
		<td><%=rs.getString("ATTEND") %></td>
		<td><%=rs.getString("REPORT") %></td>
		<td><%=rs.getString("ETC") %></td>
		<td><%=rs.getString("AVGSCORE") %></td>
		<td><%=rs.getString("TOTALSCORE") %></td>
		<td><%=rs.getString("GRADE") %></td>
	</tr>
<%
	}

	rs.close();
	p.close();
	con.close();
%>
</table>

<%@ include file="footer.jsp" %>