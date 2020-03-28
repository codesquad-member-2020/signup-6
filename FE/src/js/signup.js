import _ from "../utils/validator";
import { setMessage } from "./message";
import { openModal } from "./terms";
import { resetForm } from "./reset";

document.getElementById("id").addEventListener("input", e => setMessage(e.target, _.validateId));

document
	.getElementById("password")
	.addEventListener("input", e => setMessage(e.target, _.validatePassword));

document
	.getElementById("password_check")
	.addEventListener("input", e => setMessage(e.target, _.doubleCheckPassword));

document
	.getElementById("name")
	.addEventListener("input", e => setMessage(e.target, _.validateName));

document
	.getElementById("yy")
	.addEventListener("input", e => setMessage(e.target, _.validateYearOfBirth));

document
	.getElementById("mm")
	.addEventListener("click", e => setMessage(e.target, _.validateMonthOfBirth));

document
	.getElementById("dd")
	.addEventListener("input", e => setMessage(e.target, _.validateDateOfBirth));

document
	.getElementById("gender")
	.addEventListener("click", e => setMessage(e.target, _.validateGender));

document
	.getElementById("email")
	.addEventListener("focusout", e => setMessage(e.target, _.validateEmail));

document
	.getElementById("mobile")
	.addEventListener("focusout", e => setMessage(e.target, _.validatePhoneNumber));

document
	.getElementById("interest")
	.addEventListener("focusout", e => setMessage(e.target, _.validateInterest));

document.querySelector(".terms_text").addEventListener("click", openModal);

document.getElementById("reset").addEventListener("click", resetForm);

document.getElementById("signup_form").addEventListener("submit", _.validateForm);
