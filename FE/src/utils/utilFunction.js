const _getMessage = validator => value => validator(value);

const _setColor = (element, status) => {
	if (element.classList.contains(status)) return;
	const statusSwitchingObj = { pass: "fail", fail: "pass" };
	element.classList.remove(statusSwitchingObj[status]);
	element.classList.add(status);
};

let timer;

export const setMessage = (target, validator) => {
	if (timer) {
		clearTimeout(timer);
	}
	timer = setTimeout(() => {
		const [status, message] = _getMessage(validator)(target.value);
		const messageElement = target.closest(".input_container").lastElementChild;
		_setColor(messageElement, status);
		messageElement.textContent = message;
	}, 200);
};
