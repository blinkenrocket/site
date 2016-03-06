axis = require 'axis'
jeet = require 'jeet'
autoprefixer = require 'autoprefixer-stylus'
rupture = require 'rupture'
js_pipeline  = require 'js-pipeline'
css_pipeline = require 'css-pipeline'

module.exports =
	debug: true
	output: 'public'
	ignores: ['README.md', '.gitignore', 'layouts/*', '**/_*', 'feedback/*', 'cron.sh', 'v3/*', 'contact-form/*', 'mixins/*']

	extensions: [
		js_pipeline(files: [], out: 'js/vendor.js'),
		js_pipeline(files: 'styles/content.coffee', out: 'js/content.js'),
		js_pipeline(files: 'styles/nav.coffee', out: 'js/nav.js'),
		css_pipeline(files: ['styles/default.styl'], out: 'css/default.css'),
		css_pipeline(files: ['assets/css/*.css'], out: 'css/vendor.css')
	]

	stylus:
		use: [axis(), autoprefixer(), jeet(), rupture()]

	layouts:
		default: 'layouts/default.jade'

	server:
		clean_urls: true
