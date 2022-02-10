// 유효성 검사를 통과했는지 여부를 저장하는 변수로 true이면 통과한 것이다.
let passwordLengthAndCombinationValidationFlag = false;
let passwordValueMatchValidationFlag = false;

// 비밀번호 input에 잘못된 입력이 있을 때를 대비해 기존의 값을 저장하는 객체
const savedPasswordValue = {password: "", checkPassword: ""};

/*
 * targetInput: 유효성 검사를 실시할 input
 * isPassword: true/false. targetInput이 비밀번호 input이면 true이다.
 * 반환값은 유효성 검사 통과 여부이다.
 * 비밀번호와 비밀번호 확인에 동일하게 적용되는 유효성 검사이다.
 * 비밀번호에는 영문, 숫자, 일부 특수문자의 입력만 허용된다.
 * 비밀번호 input이 비어있거나 허용된 값만 있으면 savedPasswordValue 객체에 그 값을 저장한다.
 * 비밀번호 input에 허용되지 않는 값이 포함되어 있으면 이전으로 되돌리고 툴팁을 표시한다.
 */
function passwordKeyboardInputValidation(targetInput, isPassword) {
	const value = targetInput.val();
	let key;
	
	if (isPassword) {
		key = "password";
	} else {
		key = "checkPassword";
	}
	
	console.log("passwordReg.test: " + passwordReg.test(value));
	if (passwordReg.test(value) || value === "") {
		savedPasswordValue[key] = value;
		return true;
	} else {
		targetInput.val(savedPasswordValue[key]);
		console.log("savedPasswordValue: " + savedPasswordValue[key]);
		return false;
	}
}

/*
 * 비밀번호에 적용되는 유효성 검사이다.
 * 반환값은 유효성 검사 통과 여부이다.
 * 비밀번호의 길이와 조합이 적절한지 확인한다.
 * 비밀번호는 10자리 이상, 16자리 이하만 가능하다.
 * 비밀번호는 영문, 숫자, 일부 특수문자 중 2가지 이상이 반드시 조합되어야 한다.
 * 유효성 검사 통과 여부에 따라 flag의 값을 변경한다.
 */
function passwordLengthAndCombinationValidation(inputElement) {
	const value = inputElement.val();
	
	if (!(value.length >= 10 && value.length <= 16)) {
		passwordLengthAndCombinationValidationFlag = false;
		return false;
	}
	
	let totalCombination = 0;
	if (engReg.test(value)) {
		totalCombination++;
	}
	if (numReg.test(value)) {
		totalCombination++;
	}
	if (specialReg.test(value)) {
		totalCombination++;
	}
	console.log("totalCombination: " + totalCombination);
	if (totalCombination < 2) {
		passwordLengthAndCombinationValidationFlag = false;
		return false;
	} else {
		passwordLengthAndCombinationValidationFlag = true;
		return true;
	}
}

/*
 * passwordInput: 비밀번호 input
 * checkPasswordInput: 비밀번호 확인 input
 * 반환값은 유효성 검사 통과 여부이다.
 * 비밀번호와 비밀번호 확인이 일치하는지 확인하는 유효성 검사이다.
 * matchErrorDiv: 비밀번호 불일치 메세지를 표시하는 div
 * 비밀번호 확인 input이 값이 비어있으면 에러메세지를 표시하지 않고 flag를 false로 변경한다.
 * 비밀번호와 비밀번호 확인 input의 값이 일치하면 falg를 true로 변경한다.
 */
function passwordValueMatchValidation(passwordInput, checkPasswordInput) {
	if (passwordInput.val() === checkPasswordInput.val()) {
		passwordValueMatchValidationFlag = true;
		return true;
	} else {
		passwordValueMatchValidationFlag = false;
		return false;
	}
}

// 모든 비밀번호 유효성 검사를 통과했으면 true를 반환한다.
function isAllPasswordFlagTrue() {
	console.log("passwordLengthAndCombinationValidationFlag: " + passwordLengthAndCombinationValidationFlag);
	console.log("passwordValueMatchValidationFlag: " + passwordValueMatchValidationFlag);
	return passwordLengthAndCombinationValidationFlag && passwordValueMatchValidationFlag
}