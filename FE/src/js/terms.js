import { TERMS } from "../utils/const.js";
import { modalPopup } from "../utils/template.js";

export const renderModal = () => {
	const termsModalPopup = modalPopup`${TERMS}`;
	document.body.insertAdjacentHTML("beforeend", termsModalPopup);
	// 이벤트 바인딩
	// 닫기버튼 or 팝업 바깥 클릭 시 닫힘 (닫기 전에 체크박스 체크 여부 확인)
	// 스크롤 끝까지 내렸을 때 '동의'버튼 활성화
};
