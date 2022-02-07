// 비밀번호 유효성 검사를 위한 정규표현식들
const engReg = /[a-zA-Z]/;
const numReg = /[0-9]/;
const specialReg = /[~!@#$%^&*+=?_-]/;
const allowedReg = /^[a-zA-Z0-9~!@#$%^&*+=?_-]+$/;

// 유효성 검사를 통과했는지 여부를 저장하는 변수로 true이면 통과한 것이다.
let passwordValidationFlag = false;
let passwordValueMatchFlag = false;

// 비밀번호 input에 잘못된 입력이 있을 때를 대비해 기존의 값을 저장하는 객체
const savedValue = {password: "", checkPassword: ""};

/*
 * errorDivElement: 에러 메세지를 표시할 엘리먼트, flag: true/false
 * flag에 따라 divElement의 바로 이전에 있는 엘리먼트의 클래스에 row-other를 제거하거나 추가한다.
 * flag에 따라 divElement의 hidden 속성을 추가하거나 제거한다.
 * flag가 true이면 divElement의 바로 이전에 있는 엘리먼트의 클래스에서 row-other를 제거하고
 *  divElement의 hidden 속성을 제거해서 보이게 한다.
 */
function showErrorMessage(errorDivElement, flag) {
	if (flag) {
		errorDivElement.prev().removeClass("row-other");
		errorDivElement.prop("hidden", false);
	} else {
		errorDivElement.prev().addClass("row-other");
		errorDivElement.prop("hidden", true);
	}
}

/*
 * targetInput: 유효성 검사를 실시할 input
 * isPassword: true/false. targetInput이 비밀번호 input이면 true이다.
 * tooltip: input에 해당하는 tooltip
 * 비밀번호와 비밀번호 확인에 동일하게 적용되는 유효성 검사이다.
 * 비밀번호에는 영문, 숫자, 일부 특수문자의 입력만 허용된다.
 * 비밀번호 input이 비어있거나 허용된 값만 있으면 savedValue 객체에 그 값을 저장한다.
 * 비밀번호 input에 허용되지 않는 값이 포함되어 있으면 이전으로 되돌리고 툴팁을 표시한다.
 * 마지막에는 비밀번호와 비밀번호 확인의 값이 동일한지 체크한다.
 */
function passwordCommonValidation(targetInput, isPassword, tooltip) {
	const value = targetInput.val();
	let key;
	if (isPassword) {
		key = "password";
	} else {
		key = "checkPassword";
	}
	console.log("allowedReg.test: " + allowedReg.test(value));
	
	if (allowedReg.test(value) || value === "") {
		savedValue[key] = value;
	} else {
		targetInput.val(savedValue[key]);
		tooltip.show();
		setTimeout(function() {
			tooltip.hide();
		}, 3000);
		console.log("savedValue: " + savedValue[key]);
		clearTimeout();
	}
}

/*
 * 비밀번호에서만 적용되는 유효성 검사이다.
 * 비밀번호의 길이와 조합이 적절한지 확인한다.
 * 비밀번호는 10자리 이상, 16자리 이하만 가능하다.
 * 비밀번호는 영문, 숫자, 일부 특수문자 중 2가지 이상이 조합되어야 한다.
 * 유효성 검사 통과 여부에 따라 에러메세지를 표시하거나 flag의 값을 변경한다.
 */
function passwordValidation(inputElement, passwordErrorDiv) {
	const value = inputElement.val();
	
	if (!(value.length >= 10 && value.length <= 16)) {
		showErrorMessage(passwordErrorDiv, true);
		return;
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
		showErrorMessage(passwordErrorDiv, true);
		passwordValidationFlag = false;
	} else {
		showErrorMessage(passwordErrorDiv, false);
		passwordValidationFlag = true;
	}
}

/*
 * passwordInput: 비밀번호 input
 * checkPasswordInput: 비밀번호 확인 input
 * 비밀번호와 비밀번호 확인이 일치하는지 확인하는 유효성 검사이다.
 * matchErrorDiv: 비밀번호 불일치 메세지를 표시하는 div
 * 비밀번호 확인 input이 값이 비어있으면 에러메세지를 표시하지 않고 flag를 false로 변경한다.
 * 비밀번호와 비밀번호 확인 input의 값이 일치하면 에러메세지를 표시하지 않고 falg를 true로 변경한다.
 */
function passwordValueMatchValidation(passwordInput, checkPasswordInput, matchErrorDiv) {
	if (checkPasswordInput.val() === "") {
		showErrorMessage(matchErrorDiv, false);
		passwordValueMatchFlag = false;
		return;
	}
	if (passwordInput.val() === checkPasswordInput.val()) {
		showErrorMessage(matchErrorDiv, false);
		passwordValueMatchFlag = true;
	} else {
		showErrorMessage(matchErrorDiv, true);
		passwordValueMatchFlag = false;
	}
}

// 모든 비밀번호 유효성 검사를 통과했으면 true를 반환한다.
function isAllFlagTrue() {
	console.log("passwordValidationFlag: " + passwordValidationFlag);
	console.log("passwordValueMatchFlag: " + passwordValueMatchFlag);
	if (passwordValidationFlag && passwordValueMatchFlag) {
		return true;
	} else {
		return false;
	}
}