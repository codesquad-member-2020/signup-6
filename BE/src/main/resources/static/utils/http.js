const GET = async url => {
	const response = await fetch(url);
	const resPromise = await response.json();
	return resPromise;
};

const POST = async (url, data) => {
	const options = {
		method: "POST",
		headers: {
			"Content-type": "application/json"
		},
		body: JSON.stringify(data)
	};
	const response = await fetch(url, options);
	const resPromise = await response.json();
	return resPromise;
};

export default { GET, POST };
