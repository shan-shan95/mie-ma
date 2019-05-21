<template lang="pug">
#mypage
  Header
  main
    .columns
      .column.is-2
        Menu
      .column.is-10
        .hero
          .hero-body
            h1.title.is-3 プロフィール
            hr
            .is-clearfix
              .is-pulled-right
                a(href="/users/edit") 編集する
            h2.is-size-5.has-text-black 自己紹介
            p {{ user.profile }}
  Footer
</template>

<script>
import Header from '../../components/AppHeader'
import Footer from '../../components/AppFooter'
import Menu from '../../components/MypageMenu'

export default {
  data() {
    return {
      user: gon.user
    }
  },
  components: {
    Header,
    Footer,
    Menu
  }
}
</script>

<style lang="scss" scoped>
</style>
