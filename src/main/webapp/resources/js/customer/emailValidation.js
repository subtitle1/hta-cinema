// 유효성 검사를 통과했는지 여부를 저장하는 변수로 true이면 통과한 것이다.
let emailValidationFlag = false;

/*
 * 핸드폰 번호에 적용되는 유효성 검사이다.
 * 반환값은 유효성 검사 통과 여부이다.
 * /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
 */
function emailValidation(inputElement) {
	const value = inputElement.val();
	
	console.log("emailReg.test: " + emailReg.test(value));
	if (!emailReg.test(value)) {
		emailValidationFlag = false;
		return false;
	} else {
		emailValidationFlag = true;
		return true;
	}
}