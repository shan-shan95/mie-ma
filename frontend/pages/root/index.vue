<template lang="pug">
#index
  Header
  .columns
    section.hero.column.is-two-third
      .hero-body
        h1.title.is-3 新着アイテム
        hr
        p {{ message }}
    section.hero.column.is-one-third
      .hero-body
        h3.title.is-5 Twitter
        Timeline(:id="twitterId" :source-type="'profile'" :options="{ 'height': twitterHeight }")
</template>

<style lang="scss">
@import '../../init/_variables';
</style>

<script>
import Header from '../../components/header'
import { Timeline } from 'vue-tweet-embed'

export default {
  components: {
    Header,
    Timeline
  },
  data() {
    return {
      twitterId: 'miecoop',
      twitterHeight: '400',
      message: gon.test
    }
  }
}
</script>
