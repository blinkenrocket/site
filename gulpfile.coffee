gulp = require 'gulp'
ghPages = require 'gulp-gh-pages'


gulp.task 'publish', ->
	gulp.src('./public/**/*')
		.pipe ghPages
			remoteUrl: 'git@github.com:blinkenrocket/blinkenrocket.github.io.git'
			branch: 'master'
