const path = require('path')
const glob = require('glob')
const webpack = require('webpack')
const MiniCssExtractPlugin = require('mini-css-extract-plugin')
const VueLoaderPlugin = require('vue-loader/lib/plugin')
const ManifestPlugin = require('webpack-manifest-plugin')
const merge = require('webpack-merge')
const common = require('./webpack.common.js')
const PurgecssPlugin = require('purgecss-webpack-plugin')
const PATHS = {
  src: path.join(__dirname, 'frontend')
}

let entries = {}
glob.sync('./frontend/pages/**/*.js').map(file => {
  let name = file.split('/')[4].split('.')[0]
  entries[name] = file
})

module.exports = merge(common, {
  mode: 'production',
  entry: {
    application: './frontend/init/application.js',
    application: './frontend/init/application.scss',
    rails_ujs: './frontend/init/rails_ujs.js',
    ...entries
  },
  output: {
    filename: 'javascripts/[name]-[hash].js',
    path: path.resolve(__dirname, 'public/assets/'),
    publicPath: '/'
  },
  plugins: [
    new VueLoaderPlugin(),
    new MiniCssExtractPlugin({
      filename: 'stylesheets/[name]-[hash].css'
    }),
    new ManifestPlugin({
      writeToFileEmit: true
    }),
    new PurgecssPlugin({
      paths: glob.sync(`${PATHS.src}/**/*`, { nodir: true })
    })
  ],
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        loader: 'babel-loader',
        options: {
          presets: [
            [
              '@babel/preset-env',
              {
                targets: ['>0.25% in JP', 'not ie <= 10', 'not op_mini all'],
                useBuiltIns: 'entry',
                corejs: 3
              }
            ]
          ]
        }
      },
      {
        test: /\.vue$/,
        loader: 'vue-loader'
      },
      {
        test: /\.pug/,
        loader: 'pug-plain-loader'
      },
      {
        test: /\.(c|sc)ss$/,
        use: [
          {
            loader: MiniCssExtractPlugin.loader,
            options: {
              publicPath: path.resolve(__dirname, 'public/assets/stylesheets/')
            }
          },
          'css-loader',
          'sass-loader'
        ]
      },
      {
        test: /\.(jpg|png|gif)$/,
        loader: 'file-loader',
        options: {
          name: '[name].[ext]',
          outputPath: 'images/',
          publicPath: function(path) {
            return 'images/' + path
          }
        }
      },
      {
        test: /\.(woff(2)?|ttf|eot|svg)$/,
        use: [
          {
            loader: 'file-loader',
            options: {
              name: 'fonts/[name].[ext]',
              publicPath: '../'
            }
          }
        ]
      }
    ]
  },
  resolve: {
    alias: {
      vue: 'vue/dist/vue.js'
    },
    extensions: [
      '.js',
      '.scss',
      'css',
      '.vue',
      '.jpg',
      '.png',
      '.gif',
      '.woff',
      '.woff2',
      '.svg',
      '.ttf',
      '.eot',
      ' '
    ]
  }
})
