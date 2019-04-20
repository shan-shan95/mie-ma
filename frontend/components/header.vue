<template lang="pug">
  nav.navbar(role='navigation' aria-label='main navigation')
    .navbar-brand
      a.navbar-item(href='/')
        img(src='../images/image.jpg' alt='top-banner' width='112' height='28')
    #navbarBasicExample.navbar-menu
      .navbar-start
        a.navbar-item ホーム
        a.navbar-item 出品一覧
        .navbar-item.has-dropdown.is-hoverable
          a.navbar-link More
          .navbar-dropdown
            a.navbar-item About
            a.navbar-item Jobs
            a.navbar-item Contact
            hr.navbar-divider
            a.navbar-item Report an issue
    .navbar-end
      .navbar-item
        .buttons
          a.button.is-primary
            strong 会員登録
          a.button.is-light ログイン
</template>

<script>
</script>

<style lang="scss" scoped>
p {
  font-size: 2em;
  text-align: center;
  background-color: greenyellow;
}
</style>
