import { tag } from "../utils/template";
import { changeMessageColor } from "./message";
import _ from "../utils/validator";
import { fields } from "../utils/const";

const inputBox = document.querySelector(".interest");
const tagBox = inputBox.querySelector(".tag_box");
const input = inputBox.querySelector("input");

const tags = [];

export const handleTagButton = e => {
	const value = e.target.value;
	if (e.key === ",") {
		if (value.length === 1) {
			input.value = "";
			return;
		}
		const tagName = value.slice(0, -1);
		tags.push(tagName);
		addTag(tagName);
		setMessageOfInterest();
		input.value = "";
	}
};

const addTag = tagName => {
	const tagButton = tag`${tagName}`;
	tagBox.insertAdjacentHTML("beforeend", tagButton);
};

const setMessageOfInterest = () => {
	const [status, message] = _.validateInterest(tags);
	const messageElement = input.closest(".input_container").lastElementChild;
	changeMessageColor(messageElement, status);
	messageElement.textContent = message;
	fields.interest.value = tags.join(", ");
	fields.interest.status = status;
};
