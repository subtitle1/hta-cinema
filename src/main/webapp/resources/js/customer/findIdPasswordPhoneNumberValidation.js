/*
 * 핸드폰 번호에 적용되는 유효성 검사이다.
 * 반환값은 유효성 검사 통과 여부이다.
 * /^01([0|1|6|7|8|9])([0-9]{7,8})$/
 */
function findIdPasswordPhoneNumberValidation(inputElement) {
	const value = inputElement.val();
	
	console.log("phoneNumberReg.test: " + phoneNumberReg.test(value));
	if (!phoneNumberReg.test(value)) {
		phoneNumberValidationFlag = false;
		return false;
	} else {
		phoneNumberValidationFlag = true;
		return true;
	}
}