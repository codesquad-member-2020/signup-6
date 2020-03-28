import { fields, TERMS } from "../utils/const";
import { modalPopup } from "../utils/template";

let modal = document.querySelector(".modal");
let closeButton;
let contentArea;
let agreementButton;

export const openModal = () => {
	if (modal) {
		modal.classList.remove("close");
		contentArea.addEventListener("scroll", handleButtonActivation, { passive: true });
	} else {
		renderModal();
		bindEventListener();
	}
};

const renderModal = () => {
	const termsModalPopup = modalPopup`${TERMS}`;
	document.body.insertAdjacentHTML("beforeend", termsModalPopup);
};

const bindEventListener = () => {
	modal = document.querySelector(".modal");

	// close modal
	closeButton = modal.querySelector(".closeBtn");
	closeButton.addEventListener("click", closeByClickingButton);
	window.addEventListener("click", closeByClickingOutside);

	// activate agreement button when user scroll down to the bottom
	contentArea = modal.querySelector(".modal_content");
	contentArea.addEventListener("scroll", handleButtonActivation, { passive: true });
};

const closeByClickingButton = () => {
	resetScrollToTheTop();
	deactivateButton();
	modal.classList.add("close");
	contentArea.removeEventListener("scroll", handleButtonActivation, { passive: true });
};

const closeByClickingOutside = e => {
	if (e.target === modal) {
		resetScrollToTheTop();
		deactivateButton();
		modal.classList.add("close");
		contentArea.removeEventListener("scroll", handleButtonActivation, { passive: true });
	}
};

const handleButtonActivation = e => {
	const isContentArea = e.target === contentArea;
	const isBottom =
		contentArea.scrollHeight - Math.ceil(contentArea.scrollTop) === contentArea.clientHeight;
	if (isContentArea && isBottom) activateButton();
};

const activateButton = () => {
	agreementButton = modal.querySelector("button");
	agreementButton.classList.add("active");
	agreementButton.addEventListener("click", check);
};

const deactivateButton = () => {
	agreementButton = modal.querySelector("button");
	agreementButton.classList.remove("active");
	agreementButton.removeEventListener("click", check);
};

const check = () => {
	const checkbox = document.getElementById("terms");
	checkbox.setAttribute("checked", true);
	modal.classList.add("close");
	contentArea.removeEventListener("scroll", handleButtonActivation, { passive: true });
	agreementButton.classList.add("clicked");
	agreementButton.textContent = "동의 완료";
	agreementButton.removeEventListener("click", check);
	fields.terms.value = true;
	fields.terms.status = true;
};

const resetScrollToTheTop = () => {
	contentArea.scrollTop = 0;
};
