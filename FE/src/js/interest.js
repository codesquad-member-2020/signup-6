import { tag } from "../utils/template";
import { changeMessageColor } from "./message";
import _ from "../utils/validator";
import { fields } from "../utils/const";

const inputBox = document.querySelector(".interest");
const tagBox = inputBox.querySelector(".tag_box");
const input = inputBox.querySelector("input");

let tags = [];
let pause = true;

export const handleTagButton = e => {
	const value = e.target.value;
	const key = e.key;
	handleInsertAction(key, value);
	handleDeleteAction(key, value);
};

const handleInsertAction = (key, value) => {
	const isComma = key === ",";
	const isEnter = key === "Enter";
	if (isComma || isEnter) {
		const withoutValue = (isComma && value.length === 1) || (isEnter && value.length === 0);
		if (withoutValue) {
			input.value = "";
			return;
		}
		const tagName = isComma ? value.slice(0, -1) : value;
		tags.push(tagName);
		addTag(tagName);
		setMessageOfInterest();
		input.value = "";
	}
};

const addTag = tagName => {
	const tagButton = tag`${tagName}`;
	tagBox.insertAdjacentHTML("beforeend", tagButton);
	tagBox.addEventListener("click", removeTag);
};

const handleDeleteAction = (key, value) => {
	const isDeleting = key === "Backspace" || key === "Delete";
	const isEmpty = value === "";
	if (isDeleting && tags.length !== 0) {
		if (isEmpty && pause) {
			pause = false;
			return;
		}
		if (isEmpty && !pause) {
			const lastTagElement = tagBox.lastElementChild;
			tagBox.removeChild(lastTagElement);
			input.value = tags.pop();
			pause = true;
		}
	}
};

const removeTag = e => {
	const selectedTag = e.target.getAttribute("data-tag");
	if (selectedTag) {
		tags = tags.filter(tag => tag !== selectedTag);
		const selectedTagElement = e.target.closest(".tag");
		selectedTagElement.parentNode.removeChild(selectedTagElement);
	}
};

const setMessageOfInterest = () => {
	const [status, message] = _.validateInterest(tags);
	const messageElement = input.closest(".input_container").lastElementChild;
	changeMessageColor(messageElement, status);
	messageElement.textContent = message;
	fields.interest.value = tags.join(", ");
	fields.interest.status = status;
};
