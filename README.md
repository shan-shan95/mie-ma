# README
## Description
三重大学生のみが利用可能なフリマアプリ「ミエマ！」のリポジトリです。
北海道大学の友人[tetsufe君のサイト](https://hufurima.com/)を参考に作っています。

## Install
使用するツール
- rbenv 1.1.1
- ruby 2.5.1
- yarn 1.10.1
- bundler 1.17.2
- git
- mysql 8.0.12
- VSCode拡張機能 
	- rufo
	- eslint
	- prittier

```
$ bundle install --path=vendor/bundle
$ yarn install
$ cp .env.tmp .env
$ bundle exec foreman start -p 3000 // port3000でrailsのサーバーとwebpack-dev-serverを立てている
```
