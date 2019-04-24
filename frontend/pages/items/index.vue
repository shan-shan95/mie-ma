<template lang="pug">
#index
  Header
  main.columns
    article.hero.column.is-two-third
      .hero-body
        h1.title.is-3 新着アイテム
        hr
        p アイテム
    aside.hero.column.is-one-third
      .hero-body
        h3.title.is-5 Twitter
        Timeline(
          :id="twitterId",
          :source-type="'profile'",
          :options="{ 'height': twitterHeight }"
        )
      .hero-body
        h3.title.is-5 リンク集
        hr
        span ・
        a(href='http://www.mie-u.ac.jp/') 三重大学公式サイト
        br
        span ・
        a(href='http://www.mie-u.ac.jp/') Moodle (e-ラーニングシステム)
        br
        span ・
        a(href='http://www.cc.mie-u.ac.jp/') 総合情報処理センター
        br
        span  ・
        a(href='https://unipa.mie-u.ac.jp/up/faces/login/Com00501A.jsp') ユニパ(履修登録)
        br
        span ・
        a(href='http://k.cc.mie-u.ac.jp/a/?table=1') モバイル情報案内 (休講案内等)
        br
        span ・
        a(href='http://syllabus.mie-u.ac.jp/') WEBシラバス
        br
    a.footer-sell-button(href="/")
      div 出品
      i.fa.fa-camera
  Footer
</template>

<style lang="scss">
.hero-body {
  padding: 1.5rem 1.5rem;
}

.footer-sell-button {
  bottom: 32px;
  right: 32px;
  width: 80px;
  height: 80px;
  font-size: 22px;
  position: fixed;
  z-index: 1002;
  border-radius: 50%;
  background: #25b425;
  color: white;
  text-align: center;

  div {
    position: relative;
    top: 0.5rem;
  }

  i {
    position: relative;
    top: 0.2rem;
  }
}
</style>

<script>
import Header from '../../components/header'
import Footer from '../../components/footer'
import { Timeline } from 'vue-tweet-embed'

export default {
  components: {
    Header,
    Footer,
    Timeline
  },
  data() {
    return {
      twitterId: 'miecoop',
      twitterHeight: '450'
    }
  }
}
</script>
