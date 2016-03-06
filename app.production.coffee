axis = require 'axis'
jeet = require 'jeet'
autoprefixer = require 'autoprefixer-stylus'
rupture = require 'rupture'
js_pipeline  = require 'js-pipeline'
css_pipeline = require 'css-pipeline'

module.exports =
	debug: true
	output: 'public'
	ignores: ['README.md', '.gitignore', 'layouts/*', '**/_*', 'feedback/*', 'cron.sh', 'v3/*', 'contact-form/*']

	extensions: [
		css_pipeline(files: ['styles/default.styl'], out: 'css/default.css', minify: true),
	]

	stylus:
		use: [axis(), autoprefixer(), jeet(), rupture()]

	layouts:
		default: 'layouts/default.jade'

	server:
		clean_urls: true
