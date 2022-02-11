// year이 윤년이면 true를 반환한다.
function isLeapYear(year) {
	return year % 4 === 0 && (year % 100 !== 0 || year % 400 === 0);
}

/*
 * 생년월일에 적용되는 유효성 검사이다.
 * 반환값은 유효성 검사 통과 여부이다.
 */
function birthDateValidation(inputElement) {
	const value = inputElement.val();
	
	const birthDate = new Date(value.substr(0, 4) + "-" + value.substr(4, 2) + "-" + value.substr(6, 2));
	const birthYear = Number(value.substr(0, 4));
    const birthMonth = Number(value.substr(4, 2));
    const birthDay = Number(value.substr(6, 2));

	const todayDate = new Date();
	
	const daysPerMonth = {1: 31, 3: 31, 4: 30, 5: 31, 6: 30, 7: 31, 8: 31, 9: 30, 10: 31, 11: 30, 12: 31}
	
	if (value.length !== 8) {
		console.log("false1");
		return false;
	}
	if (birthDate > todayDate) {
		console.log("false2");
		return false;
	}
	if (birthYear < 1900) {
		console.log("false3");
		return false;
	}
	if (!(birthMonth >= 1 && birthMonth <= 12)) {
		console.log("false4");
		return false;
	}
	if (birthDay < 1) {
		console.log("false5");
		return false;
	}
	if (birthMonth !== 2) {
		return birthDay <= daysPerMonth[birthMonth];
	}
	if (birthDay > 29) {
		console.log("false7");
		return false;
	}
	if (!isLeapYear(birthYear) && birthDay === 29) {
		console.log("false8");
		return false;
	}
	return true;
}