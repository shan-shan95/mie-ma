<template lang="pug">
  nav.navbar(role='navigation' aria-label='main navigation')
    .navbar-brand
      a.navbar-item(href='/')
        img(src='../images/image.jpg' alt='top-banner' width='112' height='28')
      a.navbar-burger.burger(role='button', aria-label='menu', aria-expanded='false' data-target='navbarBasicExample', @click="toggleIsActive()", v-bind:class="{ 'is-active': this.isActive }")
        span(aria-hidden='true')
        span(aria-hidden='true')
        span(aria-hidden='true')
    #navbarBasicExample.navbar-menu(@click="toggleIsActive()", v-bind:class="{ 'is-active': this.isActive }")
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
            div(v-if="this.isSignedIn")
              a.button.is-light(
                href="/users/sign_out",
                data-method="delete"
                )
                | ログアウト
            div(v-else)
              a.button.is-primary
                strong 会員登録
              a.button.is-light(href="/users/sign_in") ログイン
</template>

<script>
export default {
  data() {
    return {
      isActive: false,
      isSignedIn: gon.is_signed_in
    }
  },
  methods: {
    toggleIsActive() {
      this.isActive = !this.isActive
    }
  }
}
</script>

<style lang="scss" scoped>
</style>
