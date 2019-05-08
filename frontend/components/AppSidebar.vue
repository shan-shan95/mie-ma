<template lang="pug">
#sidebar
  aside.hero.column.is-one-third
  .hero-body
    h3.title.is-5 Twitter
    hr
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
</template>

<script>
import { Timeline } from 'vue-tweet-embed'

export default {
  components: {
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
