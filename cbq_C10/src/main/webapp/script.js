/**
 * 도서대출관리 유효성 검사
 */
function return1Check(){
	var frm = document.frm;
	if(frm.R_NO.value===""){
		alert("대출번호가 입력되지 않았습니다.")
		frm.R_NO.focus()
		return false
	}
	if(frm.M_NO.value===""){
		alert("회원번호가 입력되지 않았습니다.")
		frm.M_NO.focus()
		return false
	}
	if(frm.B_CODE.value===""){
		alert("도서명이 선택되지 않았습니다.")
		frm.B_CODE.focus()
		return false
	}
	if(frm.RENT_DATE.value===""){
		alert("대출일자가 입력되지 않았습니다.")
		frm.RENT_DATE.focus()
		return false
	}
	if(frm.rent_days.value==="" || isNaN(frm.rent_days.value)){
		alert("대출일수가 숫자가 아니거나 입력되지 않았습니다.")
		frm.rent_days.focus()
		return false
	}
	alert("대출정보가 정상적으로 등록되었습니다!")
	frm.submit()
}

function return1Reset(){
	alert("정보를 지우고 처음부터 다시 입력합니다!")
	location.href="menu1.jsp"
}

function return2Check(){
	var frm = document.frm;
	if(frm.M_NO.value===""){
		alert("회원명이 선택되지 않았습니다.")
		frm.M_NO.focus()
		return false
	}
	frm.submit()
}
