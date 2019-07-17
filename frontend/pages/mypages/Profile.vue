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
            .profile-section
              .is-clearfix
                .is-pulled-right
                  a(href="/users/edit") 名前を編集する
              h2.is-size-5.has-text-black.title.profile-title 名前
              p.nickname {{ user.nickname }}
            .profile-section
              .is-clearfix
                .is-pulled-right
                  a(:href="editProfilePath()") 自己紹介を編集する
              h2.is-size-5.has-text-black.title.profile-title 自己紹介
              pre.profile {{ user.profile }}
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
  },
  methods: {
    editProfilePath() {
      return '/users/' + this.user.id + '/edit'
    }
  }
}
</script>

<style lang="scss" scoped>
.profile-section {
  margin: 1rem 0;

  .profile-title {
    margin-bottom: 1rem;
  }
  .profile {
    background-color: #eeeeee;
    font-size: 1rem;
    padding: 0;
  }
}
</style>
