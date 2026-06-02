function menu2Check(){
	var frm = document.frm;
	
	if(frm.sid.value === ""){
		alert("학번이 입력되지 않았습니다!");
		frm.sid.focus();
		return false;
	}
	if(frm.midscore.value === "" || isNaN(frm.midscore.value)){
		alert("중간고사가 입력되지 않았습니다!");
		frm.midscore.focus();
		return false;
	}
	if(frm.finalscore.value === "" || isNaN(frm.finalscore.value)){
		alert("기말고사가 입력되지 않았습니다!");
		frm.finalscore.focus();
		return false;
	}
	if(frm.attend.value === "" || isNaN(frm.attend.value)){
		alert("출석이 입력되지 않았습니다!");
		frm.attend.focus();
		return false;
	}
	if(frm.report.value === "" || isNaN(frm.report.value)){
		alert("레포트가 입력되지 않았습니다!");
		frm.report.focus();
		return false;
	}
	if(frm.etc.value === "" || isNaN(frm.etc.value)){
		alert("기타가 입력되지 않았습니다.");
		frm.etc.focus();
		return false;
	}
	alert("성적정보가 정상적으로 등록되었습니다!");
	frm.submit();
}

function reset(){
	alert("정보를 지우고 처음부터 다시 입력합니다!");
	location.href="menu2.jsp";
}

function menu4Check(){
	var frm = document.frm;
	
	if(frm.subcode.value === ""){
		alert("과목코드가 입력되지 않았습니다!");
		frm.subcode.focus();
		return false;
	}
	return true;
}