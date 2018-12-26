const { environment } = require('@rails/webpacker')
const { VueLoaderPlugin } = require('vue-loader')
const vue =  require('./loaders/vue')

environment.loaders.get('sass').use.push('import-glob-loader')
environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin())
environment.loaders.prepend('vue', vue)
environment.config.merge({
	resolve: {
		alias: {
			'@': 'javascripts',
			vue: 'vue/dist/vue.js',
		}
	}
})

module.exports = environment
