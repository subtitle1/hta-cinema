// input에 잘못된 입력이 있을 때를 대비해 기존의 값을 저장하는 객체
let savedNumberValue;

/*
 * 반환값은 유효성 검사 통과 여부이다.
 * 숫자만 입력이 가능하다.
 * input이 비어있거나 허용된 값만 있으면 savedNumberValue에 그 값을 저장한다.
 */
function onlyNumberAllowedValidation(inputElement) {
	const value = inputElement.val();
	
	console.log("onlyNumberReg.test: " + onlyNumberReg.test(value));
	if (onlyNumberReg.test(value) || value === "") {
		savedNumberValue = value;
		return true;
	} else {
		inputElement.val(savedNumberValue);
		console.log("savedNumberValue: " + savedNumberValue);
		return false;
	}
}