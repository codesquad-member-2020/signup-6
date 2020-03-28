import _ from "../utils/validator";
import { fields } from "../utils/const";

let timer;

export const setMessage = (target, validator) => {
	if (timer) {
		clearTimeout(timer);
	}
	timer = setTimeout(async () => {
		const { id, value } = target;
		const [status, message] = await validator(value);
		const messageElement = target.closest(".input_container").lastElementChild;
		changeMessageColor(messageElement, status);
		messageElement.textContent = message;
		fields[id].value = value;
		fields[id].status = status;
	}, 200);
};

export const changeMessageColor = (element, status) => {
	if (element.classList.contains(status)) return;
	const statusSwitchingObj = { true: "false", false: "true" };
	element.classList.remove(statusSwitchingObj[status]);
	element.classList.add(status);
};
