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
	const closeButton = document.querySelector(".closeBtn");
	closeButton.addEventListener("click", closeByClickingButton);
	window.addEventListener("click", closeByClickingOutside);
};

const closeByClickingButton = () => {
	modal.classList.add("close");
};

const closeByClickingOutside = e => {
	if (e.target === modal) {
		modal.classList.add("close");
	}
};
