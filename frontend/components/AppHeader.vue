<template lang="pug">
#header
  nav.navbar(
    role="navigation"
    aria-label="main navigation"
  )
    .navbar-brand
      a.navbar-item.logo(href="/")
        img.logo(
          src="https://s3-ap-northeast-1.amazonaws.com/miema-assets-bucket/assets/images/logo.png"
          alt="top-banner"
          decoding="async"
        )
      a.navbar-burger.burger(
        role="button?"
        aria-label="menu"
        aria-expanded="false"
        data-target="navbarMenu"
        @click="toggleIsActive()"
        :class="{ 'is-active': this.isActive, 'top': !this.isActive }"
      )
        span(aria-hidden="true")
        span(aria-hidden="true")
        span(aria-hidden="true")
    #navbarMenu.navbar-menu(
      @click="toggleIsActive()"
      :class="{ 'is-active': this.isActive }"
    )
      .navbar-start
        a.navbar-item(href="/news") お知らせ
        a.navbar-item(href="/mypage/profile") マイページ
      .navbar-end
        .navbar-item.button-item
          .buttons
            div(v-if="this.isSignedIn")
              a.button.is-light(
                href="/users/sign_out"
                data-method="delete"
              ) ログアウト
            div(v-else)
              a.button.is-primary(href="/users/sign_up")
                strong 会員登録
              a.button.is-light(href="/users/sign_in") ログイン
  .notice.is-primary.notification(v-if="notice")
    button.delete(@click="deleteNotice()")
    p {{ notice }}
  .alert.is-danger.notification(v-if="alert")
    button.delete(@click="deleteAlert()")
    p {{ alert }}
</template>

<script>
export default {
  data() {
    return {
      isActive: false,
      isSignedIn: gon.is_signed_in,
      notice: gon.notice,
      alert: gon.alert
    }
  },
  methods: {
    toggleIsActive() {
      this.isActive = !this.isActive
    },
    deleteNotice() {
      this.notice = null
    },
    deleteAlert() {
      this.alert = null
    }
  }
}
</script>

<style lang="scss" scoped>
.navbar {
  box-shadow: 2px 2px 4px gray;

  .logo {
    margin-left: 2em;
    max-height: 3rem;
    margin-top: 1rem;
    margin-bottom: 1rem;
  }
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
.button-item {
  padding-right: 3rem;
}
</style>
