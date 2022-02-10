// 이름 input에 잘못된 입력이 있을 때를 대비해 기존의 값을 저장하는 객체
let savedNameValue;

/*
 * 이름에 적용되는 유효성 검사이다.
 * 반환값은 유효성 검사 통과 여부이다.
 * 한글, 영어만 입력이 가능하다.
 * 이름 input이 비어있거나 허용된 값만 있으면 savedNameValue에 그 값을 저장한다.
 */
function nameValidation(inputElement) {
	const value = inputElement.val();
	
	console.log("nameReg.test: " + nameReg.test(value));
	if (nameReg.test(value) || value === "") {
		savedNameValue = value;
		return true;
	} else {
		inputElement.val(savedNameValue);
		console.log("savedNameValue: " + savedNameValue);
		return false;
	}
}