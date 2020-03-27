import _ from "../utils/validator.js";

let timer;

export const setMessage = (target, validator) => {
	if (timer) {
		clearTimeout(timer);
	}
	timer = setTimeout(async () => {
		const { id, value } = target;
		const [status, message] = await validator(value);
		const messageElement = target.closest(".input_container").lastElementChild;
		_changeMessageColor(messageElement, status);
		messageElement.textContent = message;
		_.fields[id].value = value;
		_.fields[id].status = status;
		console.log(id, "updated", _.fields);
	}, 200);
};

const _changeMessageColor = (element, status) => {
	if (element.classList.contains(status)) return;
	const statusSwitchingObj = { true: "false", false: "true" };
	element.classList.remove(statusSwitchingObj[status]);
	element.classList.add(status);
};
