export const resetForm = e => {
	const userChoice = confirm("모든 내용을 새로 작성하시겠습니까?");
	userChoice ? clear() : e.preventDefault();
};

const clear = () => {
	// clear messages
	const messages = document.querySelectorAll(".message");
	messages.forEach(message => (message.textContent = ""));

	// clear tag buttons
	const tagBox = document.querySelector(".tag_box");
	while (tagBox.firstChild) {
		tagBox.removeChild(tagBox.firstChild);
	}
};
