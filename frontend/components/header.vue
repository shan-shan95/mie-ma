<template lang="pug">
nav.navbar(role='navigation' aria-label='main navigation')
  .navbar-brand
    a.navbar-item.logo(href='/')
      img(src='../images/logo.png' alt='top-banner' width='240' height='192')
    a.navbar-burger.burger(role='button', aria-label='menu', aria-expanded='false' data-target='navbarBasicExample', @click="toggleIsActive()", v-bind:class="{ 'is-active': this.isActive, 'top': !this.isActive }")
      span(aria-hidden='true')
      span(aria-hidden='true')
      span(aria-hidden='true')
  #navbarBasicExample.navbar-menu(@click="toggleIsActive()", v-bind:class="{ 'is-active': this.isActive }")
    .navbar-end
      .navbar-item.button-item
        .buttons
          div(v-if="this.isSignedIn")
            a.button.is-light(
              href="/users/sign_out",
              data-method="delete"
              )
              | ログアウト
          div(v-else)
            a.button.is-primary(href="/users/sign_up")
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
.navbar {
  box-shadow: 2px 2px 4px gray;
}
.navbar-item img {
  max-height: 10rem;
}
.navbar-burger {
  height: 5rem;
  width: 5rem;
  margin-top: auto;
  margin-bottom: auto;
  margin-right: 1rem;

  span {
    left: calc(50% - 10px);
    height: 2px;
    width: 24px;
    border-radius: 4px;
  }
}
.top {
  span {
    &:nth-child(1) {
      top: calc(50% - 9px);
    }
    &:nth-child(3) {
      top: calc(50% + 7px);
    }
  }
}
.logo {
  padding-left: 2rem;
}
.button-item {
  padding-right: 3rem;
}
</style>
