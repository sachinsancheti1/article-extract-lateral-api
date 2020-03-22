# article-extract-lateral-api
A node js app to extract articles from the web and then host them in your own localhost or site

This repo is an easy way to extract articles from the web using laterial api [laterial.io](https://lateral.io/docs/article-extractor) and then generate markup files (yaml)

These generated files can then be used for other publishing on any other type of site.
I have done it in Hugo style posts here. 

## Usage
Check the js files

### Example to extract and save as a JSON:

`node article.js --url https://www.homebliss.in/design-inspirations/get-inspired-8-ways-to-optimize-every-corner-of-your-home/ --serial 01158`

### Example to create a YAML post from the JSON:

`node string-body --jsonfile 01158.json --serial 1158`

### Getting an API key to extract

[laterial.io](https://lateral.io/docs/article-extractor)

### Posts suitable for publish

I used the [blogdown](https://github.com/rstudio/blogdown) package in R initially to create the website. Code in 02-json-import.R lines 1-7

## Other codes

There is a lot of R code here that I have not used. It was intially to experiment if I could use the JSONs to create a YAML in R using blogdown::new_post() but in vain as I found that the BODY of content cannot be generated.
