import { tag } from "../utils/template";

const inputBox = document.querySelector(".interest");
const tagBox = inputBox.querySelector(".tag_box");
const input = inputBox.querySelector("input");

const tags = [];

export const handleTagButton = e => {
	if (e.key === ",") {
		const tagName = input.value.slice(0, -1);
		tags.push(tagName);
		addTag(tagName);
		input.value = "";
		console.log(tags);
	}
};

const addTag = tagName => {
	const tagButton = tag`${tagName}`;
	tagBox.insertAdjacentHTML("beforeend", tagButton);
};
