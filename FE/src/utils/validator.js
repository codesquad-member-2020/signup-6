import http from "../utils/http.js";
import { API } from "../utils/const.js";
import { fields } from "../utils/const.js";

// id
const validateId = value => {
	if (!value) return [false, ""];
	if (!/^[a-z0-9_\-]{5,20}$/.test(value)) {
		return [false, "5~20자의 영문 소문자, 숫자와 특수기호(_)(-)만 사용 가능합니다."];
	} else {
		return http
			.GET(API.DEPLOY.GET_USERID + value)
			.then(_handleResponse)
			.catch(_handleError);
	}
};

const _handleResponse = res => {
	const { code, exist } = res;
	if (code === 200) {
		return exist === true
			? [false, "이미 사용중인 아이디입니다."]
			: [true, "사용 가능한 아이디 입니다."];
	}
	throw Error(`Network Error ─ ${code}`);
};

const _handleError = err => {
	console.error(err);
	return [false, "네트워크 에러가 발생했습니다. 잠시 후 다시 시도해 주세요."];
};

// password
const validatePassword = value => {
	if (!value) return [false, ""];
	if (!/^.{8,16}$/.test(value)) {
		return [false, "8자 이상 16자 이하로 입력해주세요."];
	}
	if (!/[A-Z]/.test(value)) {
		return [false, "영문 대문자를 최소 1자 이상 포함해주세요."];
	}
	if (!/[a-z]/.test(value)) {
		return [false, "영문 소문자를 최소 1자 이상 포함해주세요."];
	}
	if (!/[0-9]/.test(value)) {
		return [false, "숫자를 최소 1자 이상 포함해주세요."];
	}
	if (!/[\#\$\%\^\&\*\_\+\!]/.test(value)) {
		return [false, "특수문자(#$%^&*_+!)를 최소 1자 이상 포함해주세요."];
	}
	return [true, "안전한 비밀번호입니다."];
};

// password double-check
const doubleCheckPassword = value => {
	if (!value) return [false, ""];
	const password = document.getElementById("password").value;
	return value !== password
		? [false, "비밀번호가 일치하지 않습니다."]
		: [true, "비밀번호가 일치합니다."];
};

// name
const validateName = value => {
	if (!value) return [false, ""];
	const validator = /[0-9\`|\~|\!|\@|\#|\$|\%|\^|\&|\*|\(|\)|\+|\=|\[|\{|\]|\}|\||\\|\'|\<|\,|\.|\>|\?|\/|\""|\;|\:|\s]/;
	return validator.test(value) ? [false, "유효한 이름이 아닙니다."] : [true, ""];
};

// year of birth
const validateYearOfBirth = value => {
	if (!value) return [false, ""];
	return !/^[0-9]{4,}$/.test(value)
		? [false, "태어난 년도 4자리를 정확하게 입력하세요."]
		: _isValidAge(value);
};

const _isValidAge = value => {
	const thisYear = new Date().getFullYear();
	const birthYearOfAge15 = thisYear - 14;
	const birthYearOfAge99 = thisYear - 98;
	if (value > birthYearOfAge15) {
		return [false, "만 14세 이상만 가입 가능합니다."];
	} else if (value < birthYearOfAge99) {
		return [false, "99세 이하만 가입 가능합니다."];
	} else {
		return [true, ""];
	}
};

// month of birth
const validateMonthOfBirth = value => (value !== "월" ? [true, ""] : [false, ""]);

// date of birth
const validateDateOfBirth = value => {
	if (!value) return [false, ""];
	return !/^[0-9]{1,}$/.test(value) ? [false, "유효한 날짜가 아닙니다."] : _isValidDate(value);
};

const _isValidDate = value => {
	const month = Number(document.getElementById("mm").value);
	if (isNaN(month)) return [false, "태어난 달을 선택해주세요."];
	const min = 1;
	let max;
	month % 2 === 1 ? (max = 31) : month === 2 ? (max = 28) : (max = 30);
	return value < min || value > max ? [false, "유효한 날짜가 아닙니다."] : [true, ""];
};

// gender
const validateGender = value => (value !== "성별" ? [true, ""] : [false, ""]);

// email
const validateEmail = value => {
	if (!value) return [false, ""];
	return !/^\S+@\S+[\.][0-9a-z]+$/.test(value)
		? [false, "@ 포함하여 정확하게 입력해주세요."]
		: [true, ""];
};

// mobile
const validatePhoneNumber = value => {
	if (!value) return [false, ""];
	return !/^(010)([0-9]{7,8})$/.test(value) ? [false, "형식에 맞지 않는 번호입니다."] : [true, ""];
};

// interest
const validateInterest = tags =>
	tags.length < 3 ? [false, "3개 이상의 관심사를 입력해주세요."] : [true, ""];

// form
const handleSubmit = e => {
	e.preventDefault();
	for (const [field, state] of Object.entries(fields)) {
		const { title, value, status } = state;
		if (!value || status === null) {
			field !== "terms"
				? alert(`${title} 항목을 입력해주세요.`)
				: alert(`${title}에 동의해주세요.`);
			return;
		}
		if (status === false) {
			alert(`${title}을 올바르게 입력해주세요.`);
			return;
		}
	}
	_saveUser();
};

const _saveUser = () => {
	http.POST(API.DEPLOY.POST_USERDATA, _formatData());
};

const _formatData = () => {
	const data = {};
	const { id, password, name, yy, mm, dd, gender, email, mobile, interest } = fields;
	data.userId = id.value;
	data.password = password.value;
	data.userName = name.value;
	data.birthDate = `${yy.value}-${mm.value}-${dd.value}`;
	data.sex = gender.value;
	data.email = email.value;
	data.mobile = mobile.value;
	data.interests = interest.value;
	return data;
};

export default {
	validateId,
	validatePassword,
	doubleCheckPassword,
	validateName,
	validateYearOfBirth,
	validateMonthOfBirth,
	validateDateOfBirth,
	validateGender,
	validateEmail,
	validatePhoneNumber,
	validateInterest,
	handleSubmit
};
