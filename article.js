var request = require("request");
const argv = require("yargs").argv;
const url = require("url");
const urlObj = new URL(argv.url);
const fs = require("fs");
const linkCheck = require('link-check');
const dotenv = require('dotenv').config();


const lighting = options =>{
	request(options, function (error, response, body) {
		if (error) throw new Error(error);
		console.log(`Writing ${argv.serial}`)
		fs.writeFile(
			`${argv.serial}.json`,
			body,
			err => {
				if (err) throw err;
			}
			);
	});
}
const apiarticle = turl => {

	linkCheck(turl, function (err, result) {
		if (err) {
			console.error(err);
			return;
		}
		var options = { method: 'GET',
		url: 'https://document-parser-api.lateral.io/',
		qs: { url: turl },
		headers:
		{ 'content-type': 'application/json',
		'subscription-key': process.env.apikey } };
		lighting(options);
	});
};

return apiarticle(argv.url);


// Usage: node article.js --url https://www.homebliss.in/design-inspirations/get-inspired-8-ways-to-optimize-every-corner-of-your-home/ --serial 01158