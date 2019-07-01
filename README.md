# README

## Description

三重大学生のみが利用可能なフリマアプリ「ミエマ」のリポジトリです。
北海道大学の友人[tetsufe 君のサイト](https://hufurima.com/)を参考に作っています。

## Tool

- rbenv 1.1.1
- Ruby 2.5.1
- Rails 5.2.2
- yarn 1.15.2
- bundler 1.17.2
- git
- mysql 5.7.25
- VSCode 拡張機能
  - rufo
  - eslint
  - prittier
  - Vetur

## Install

```
$ bundle install --path=vendor/bundle --jobs=4
$ yarn install
$ cp .env.tmp .env
$ bundle exec rails db:create
$ bundle exec foreman start -p 3000 // port3000でrailsのサーバーとwebpack-dev-serverを立てている
```
