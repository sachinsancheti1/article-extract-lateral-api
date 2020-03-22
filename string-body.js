// file system module to perform file operations
const fs = require('fs');
const path = require('path');
const argv = require("yargs").argv;
const { render } = require("mustache");

// read template and files
let template = fs.readFileSync("template.md").toString();
var jsonData = fs.readFileSync('./jsons/'+argv.jsonfile);
var jsonObj = JSON.parse(jsonData);
// var jsonContent = JSON.stringify(jsonObj);
// console.log(jsonContent);

// create title, slug and categories
// slug = 9-big-data-and-advanced-analytics-solutions
// filename = 2020-03-21-9-big-data-and-advanced-analytics-solutions.md
if(jsonObj.message == undefined){
	var titlehy = jsonObj.title.replace(/\s+/g, '-').toLowerCase();
	var titlehy = titlehy.replace(/[&\/\\#, +()$~%.'":*?<>{}!]/g, '_');
	jsonObj["title"] = jsonObj.title.replace(/[:]/g, '_');
	var slug = argv.serial+"-"+titlehy;
	var filename = "2020-03-21-"+slug+".md";
	var categories = jsonObj.keywords.join("\n- ");
	jsonObj["serial"] = argv.serial;
	jsonObj["slug"] = slug;
	jsonObj["categories"] = "\n- "+categories.toString();

// render with mustache
let output = render(template,jsonObj);

// write new file
console.log(filename);
fs.writeFile('new_site/content/post/'+filename,output , 'utf8', function (err) {
	if (err) {
		console.log("An error occured while writing JSON Object to File.");
		return console.log(err);
	}
	// console.log("JSON file has been saved.");
});
} else {
	console.log(jsonObj.message);
}

// Usage: node string-body --jsonfile 01158.json --serial 1158