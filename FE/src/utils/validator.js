// id
const validateId = value => {
	if (!value) return ["fail", ""];
	if (!/^[a-z0-9_\-]{5,20}$/.test(value)) {
		return ["fail", "5~20자의 영문 소문자, 숫자와 특수기호(_)(-) 만 사용 가능합니다."];
	} else {
		// 아이디 중복 확인
		return ["pass", "사용 가능한 아이디 입니다."];
	}
};

// password
const validatePassword = value => {
	if (!value) return ["fail", ""];
	if (!/^.{8,16}$/.test(value)) {
		return ["fail", "8자 이상 16자 이하로 입력해주세요."];
	}
	if (!/[A-Z]/.test(value)) {
		return ["fail", "영문 대문자를 최소 1자 이상 포함해주세요."];
	}
	if (!/[a-z]/.test(value)) {
		return ["fail", "영문 소문자를 최소 1자 이상 포함해주세요."];
	}
	if (!/[0-9]/.test(value)) {
		return ["fail", "숫자를 최소 1자 이상 포함해주세요."];
	}
	if (!/[\#\$\%\^\&\*\_\+\!]/.test(value)) {
		return ["fail", "특수문자(#$%^&*_+!)를 최소 1자 이상 포함해주세요."];
	}
	return ["pass", "안전한 비밀번호입니다."];
};

// password double-check
const doubleCheckPassword = value => {
	if (!value) return ["fail", ""];
	const password = document.getElementById("password").value;
	return value !== password
		? ["fail", "비밀번호가 일치하지 않습니다."]
		: ["pass", "비밀번호가 일치합니다."];
};

// name
const validateName = value => {
	if (!value) return ["fail", ""];
	const validator = /[0-9\`|\~|\!|\@|\#|\$|\%|\^|\&|\*|\(|\)|\+|\=|\[|\{|\]|\}|\||\\|\'|\<|\,|\.|\>|\?|\/|\""|\;|\:|\s]/;
	return validator.test(value) ? ["fail", "유효한 이름이 아닙니다."] : ["pass", ""];
};

// year of birth
const validateYearOfBirth = value => {
	if (!value) return ["fail", ""];
	return !/^[0-9]{4,}$/.test(value)
		? ["fail", "태어난 년도 4자리를 정확하게 입력하세요."]
		: _isValidAge(value);
};

const _isValidAge = value => {
	const thisYear = new Date().getFullYear();
	const birthYearOfAge15 = thisYear - 14;
	const birthYearOfAge99 = thisYear - 98;
	if (value > birthYearOfAge15) {
		return ["fail", "만 14세 이상만 가입 가능합니다."];
	} else if (value < birthYearOfAge99) {
		return ["fail", "99세 이하만 가입 가능합니다."];
	} else {
		return ["pass", ""];
	}
};

// date of birth
const validateDateOfBirth = value => {
	if (!value) return ["fail", ""];
	return !/^[0-9]{1,}$/.test(value) ? ["fail", "유효한 날짜가 아닙니다."] : _isValidDate(value);
};

const _isValidDate = value => {
	const month = Number(document.getElementById("mm").value);
	if (isNaN(month)) return ["fail", "태어난 달을 선택해주세요."];
	const min = 1;
	let max;
	month % 2 === 1 ? (max = 31) : month === 2 ? (max = 28) : (max = 30);
	return value < min || value > max ? ["fail", "유효한 날짜가 아닙니다."] : ["pass", ""];
};

// email
const validateEmail = value => {
	if (!value) return ["fail", ""];
	return !/^\S+@\S+[\.][0-9a-z]+$/.test(value)
		? ["fail", "@ 포함하여 정확하게 입력해주세요."]
		: ["pass", ""];
};

// mobile
const validatePhoneNumber = value => {
	if (!value) return ["fail", ""];
	return !/^(010)([0-9]{7,8})$/.test(value)
		? ["fail", "형식에 맞지 않는 번호입니다."]
		: ["pass", ""];
};

// interest
const validateInterest = value => {
	if (!value) return ["fail", ""];
	const interestList = value.split(", ");
	return interestList.length < 3 ? ["fail", "3개 이상의 관심사를 입력해주세요."] : ["pass", ""];
};

export default {
	validateId,
	validatePassword,
	doubleCheckPassword,
	validateName,
	validateYearOfBirth,
	validateDateOfBirth,
	validateEmail,
	validatePhoneNumber,
	validateInterest
};
