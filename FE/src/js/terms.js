import { TERMS } from "../utils/const.js";
import { modalPopup } from "../utils/template.js";

let modal = document.querySelector(".modal");

export const openModal = () => {
	if (modal) {
		modal.classList.remove("close");
	} else {
		renderModal();
		modal = document.querySelector(".modal");
	}
};

const renderModal = () => {
	const termsModalPopup = modalPopup`${TERMS}`;
	document.body.insertAdjacentHTML("beforeend", termsModalPopup);
	bindEventListener();
};

const bindEventListener = () => {
	// close modal
	const closeButton = document.querySelector(".closeBtn");
	closeButton.addEventListener("click", closeByClickingButton);
	window.addEventListener("click", closeByClickingOutside);

	// activate agreement button when user scroll down to the bottom
	const contentArea = document.querySelector(".modal_content");
	contentArea.addEventListener("scroll", handleButtonActivation);
};

const closeByClickingButton = () => {
	modal.classList.add("close");
	deactivateButton();
};

const closeByClickingOutside = e => {
	if (e.target === modal) {
		modal.classList.add("close");
		deactivateButton();
	}
};

const handleButtonActivation = e => {
	const content = e.target;
	const isBottom = content.scrollHeight - content.scrollTop === content.clientHeight;
	if (isBottom) activateButton();
};

const activateButton = () => {
	const agreementButton = modal.querySelector("button");
	agreementButton.classList.add("active");
	agreementButton.addEventListener("click", check);
};

const deactivateButton = () => {
	const agreementButton = modal.querySelector("button");
	agreementButton.classList.remove("active");
	agreementButton.removeEventListener("click", check);
};

const check = () => {
	const checkbox = document.getElementById("terms");
	checkbox.setAttribute("checked", true);
	modal.classList.add("close");
};
