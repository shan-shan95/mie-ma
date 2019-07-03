<template lang="pug">
#edit
  Header
  main
    .columns
      .column.is-2
        Menu
      .column.is-10
        .hero
          .hero-body
            h1.title.is-3 プロフィール編集
            hr
            h2.profile-example__title 自己紹介の例
            .profile-example__content
              p 以下のようにする必要はありませんが、お金をやり取りするので詳しく書いておくと、相手も安心して取引ができます。
              p 名前はハンドルネームで構いません。
              p -----------------------
              p 生物資源学部1年の〇〇です。(学部と学年)
              p セパタクローサークルに所属していて、毎週月曜日は汗を流しています。(人柄がわかるような趣味)
              p よく服を購入するので、着なくなった服を出品します。
              p TwitterID: @mie_univ_market
              p -----------------------
            form(
              :action="updatePath()"
              accept-charset="UTF-8"
              method="post"
            )
              input(
                name="_method"
                type="hidden"
                value="patch"
              )
              input(
                name="utf8"
                type="hidden"
                value="✓"
              )
              input(
                name="authenticity_token"
                type="hidden"
                :value="csrfToken()"
              )
              textarea.textarea.is-primary(
                autocomplete="off"
                rows="10"
                name="user[profile]"
              )
              button.button.is-info.submit(
                type="submit"
              ) 送信
  Footer
</template>

<script>
import Header from '../../components/AppHeader'
import Footer from '../../components/AppFooter'
import Menu from '../../components/MypageMenu'

export default {
  data() {
    return {
      user: gon.current_user
    }
  },
  components: {
    Header,
    Footer,
    Menu
  },
  methods: {
    updatePath() {
      return '/users/' + this.user.id
    },
    csrfToken() {
      return document.getElementsByName('csrf-token').item(0).content
    }
  }
}
</script>

<style lang="scss" scoped>
.profile-example__title {
  font-size: 1.2rem;
  font-weight: bold;
  margin-bottom: 1rem;
}
.profile-example__content {
  margin-bottom: 1rem;
}
.textarea {
  margin-bottom: 1rem;
}
.submit {
  margin: 0 auto;
  display: block;
}
</style>
