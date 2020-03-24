const path = require("path");
const MiniCssExtractPlugin = require("mini-css-extract-plugin");

const ENTRY_FILE = path.resolve(__dirname, "src", "js", "main.js");
const OUTPUT_DIR = path.join(__dirname, "src", "static");

const config = {
	entry: ENTRY_FILE,
	plugins: [
		new MiniCssExtractPlugin({
			filename: "style.css"
		})
	],
	module: {
		rules: [
			{
				test: /\.js$/,
				use: "babel-loader",
				exclude: /node_modules/
			},
			{
				test: /\.scss$/,
				use: [MiniCssExtractPlugin.loader, "css-loader", "sass-loader"],
				exclude: /node_modules/
			}
		]
	},
	output: {
		path: OUTPUT_DIR,
		filename: "bundle.js"
	}
};

module.exports = config;
