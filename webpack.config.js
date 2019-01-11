module.exports = (env, argv) => {
  const IS_DEV = argv.mode === 'development'

  return {
    entry: ['babel-polyfill', './app/assets/javascripts/application.js'],
    output: {
      filename: 'main.js',
      path: `${__dirname}/public/packs`
    },
    devtool: IS_DEV ? 'source-map' : 'none',
    module: {
      rules: [
        {
          test: /\.js$/,
          exclude: /node_modules/,
          loader: 'babel-loader'
        },
        {
          test: /\.vue$/,
          loader: 'vue-loader',
          options: {
            loaders: {
              js: 'babel-loader!eslint-loader',
              sass: 'vue-style-loader!css-loader!sass-loader?indentedSyntax'
            },
            extractCSS: true
          }
        }
      ]
    }
  }
}
