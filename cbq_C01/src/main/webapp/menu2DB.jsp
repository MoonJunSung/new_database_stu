<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="db.jsp" %>

<%
		request.setCharacterEncoding("UTF-8");
		
		String sid = request.getParameter("sid");
		String subcode = request.getParameter("subcode");
		String midscore = request.getParameter("midscore");
		String finalscore = request.getParameter("finalscore");
		String attend = request.getParameter("attend");
		String report = request.getParameter("report");
		String etc = request.getParameter("etc");
		
		String sql = "INSERT INTO TBL_SCORE_202210 VALUES (?, ?, ?, ?, ?, ?, ?)";
		
		PreparedStatement p = con.prepareStatement(sql);
		
		p.setString(1, sid);
		p.setString(2, subcode);
		p.setInt(3, Integer.parseInt(midscore));
		p.setInt(4, Integer.parseInt(finalscore));
		p.setInt(5, Integer.parseInt(attend));
		p.setInt(6, Integer.parseInt(report));
		p.setInt(7, Integer.parseInt(etc));
		
		p.executeUpdate();
		
		p.close();
		con.close();
%>

<script>
	location.href = "menu3DB.jsp";
</script>