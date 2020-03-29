export const API = Object.freeze({
	DEV: {
		GET_USERID:
			"https://87cda762-6dbe-4c52-a3cb-297f7f4c88dd.mock.pstmn.io/api/users/exist/userId?userId=",
		POST_USERDATA: "https://87cda762-6dbe-4c52-a3cb-297f7f4c88dd.mock.pstmn.io/api/users"
	},
	DEPLOY: {
		GET_USERID: "https://codesquad-signup6.herokuapp.com/api/users/exist/userId?userId=",
		POST_USERDATA: "https://codesquad-signup6.herokuapp.com/api/users"
	}
});

export const fields = {
	id: { title: "아이디", value: null, status: null },
	password: { title: "비밀번호", value: null, status: null },
	password_check: { title: "비밀번호 재확인", value: null, status: null },
	name: { title: "이름", value: null, status: null },
	yy: { title: "생년월일", value: null, status: null },
	mm: { title: "생년월일", value: null, status: null },
	dd: { title: "생년월일", value: null, status: null },
	gender: { title: "성별", value: null, status: null },
	email: { title: "이메일", value: null, status: null },
	mobile: { title: "휴대전화", value: null, status: null },
	interest: { title: "관심사", value: null, status: null },
	terms: { title: "약관", value: null, status: null }
};

export const TERMS = {
	title: "개인정보 수집 및 이용에 대한 안내",
	content:
		"NHN㈜(nhncorp.com 이하 '회사'라 함)는 이용자들의 개인정보보호를 매우 중요시하며, 이용자가 회사의 서비스(이하 '네이버 서비스' 또는 '네이버'라 함)를 이용함과 동시에 온라인상에서 회사에 제공한 개인정보가 보호 받을 수 있도록 최선을 다하고 있습니다. 이에 회사는 통신비밀보호법, 전기통신사업법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 등 정보통신서비스제공자가 준수하여야 할 관련 법규상의 개인정보보호 규정 및 정보통신부가 제정한 개인정보보호지침을 준수하고 있습니다. 회사는 개인정보 취급방침을 통하여 이용자들이 제공하는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다. 회사는 개인정보 취급방침을 홈페이지 첫 화면에 공개함으로써 이용자들이 언제나 용이하게 보실 수 있도록 조치하고 있습니다. 회사의 개인정보 취급방침은 정부의 법률 및 지침 변경이나 회사의 내부 방침 변경 등으로 인하여 수시로 변경될 수 있고, 이에 따른 개인정보 취급방침의 지속적인 개선을 위하여 필요한 절차를 정하고 있습니다. 그리고 개인정보 취급방침을 개정하는 경우 회사는 개인정보 취급방침 변경 시행 7일전부터 네이버 공지사항을 통하여 공지하고 버전번호 및 개정일자 등을 부여하여 개정된 사항을 이용자들이 쉽게 알아볼 수 있도록 하고 있습니다. 네이버의 개인정보 취급방침은 다음과 같은 내용을 담고 있습니다.",
	buttonName: "동의"
};
