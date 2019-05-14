<template lang="pug">
#news
  Header
  main
    .hero
      .hero-body
        h1.title.is-3 お知らせ
        hr
        strong ミエマ！開設しました🎉
  Footer
</template>

<script>
import Header from '../../components/AppHeader'
import Footer from '../../components/AppFooter'

export default {
  components: {
    Header,
    Footer
  }
}
</script>

<style lang="scss" scoped>
</style>
