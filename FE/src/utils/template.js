export function modalPopup(_, data) {
	const { title, content, buttonName } = data;
	const modalHeader = `<div class="modal_header"><span class="title">${title}</span><span class="closeBtn">&times;</span></div>`;
	const modalContent = `<div class="modal_content">${content}</div>`;
	const button = `<button>${buttonName}</button>`;
	return `<div class="modal"><div class="modal_container">${modalHeader}${modalContent}${button}</div></div>`;
}
