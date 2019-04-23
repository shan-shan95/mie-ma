<template lang="pug">
#index
  Header
  .columns
    section.hero.column.is-two-third
      .hero-body
        h1.title.is-3 新着アイテム
        hr
        p 説明
    section.hero.column.is-one-third
      .hero-body
        h3.title.is-5 Twitter
        Timeline(
          :id="twitterId",
          :source-type="'profile'",
          :options="{ 'height': twitterHeight }"
        )
  Footer
</template>

<style lang="scss">
@import '../../init/_variables';
p {
  color: $base-color;
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
      twitterHeight: '400'
    }
  }
}
</script>
