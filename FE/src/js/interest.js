import { tag } from "../utils/template";
import { changeMessageColor } from "./message";
import _ from "../utils/validator";
import { fields } from "../utils/const";

const inputBox = document.querySelector(".interest");
const tagBox = inputBox.querySelector(".tag_box");
const input = inputBox.querySelector("input");

let tags = [];

export const handleTagButton = e => {
	const value = e.target.value;
	const key = e.key;
	if (key === "," || key === "Enter") {
		if (value.length === 1) {
			input.value = "";
			return;
		}
		const tagName = key === "," ? value.slice(0, -1) : value;
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
