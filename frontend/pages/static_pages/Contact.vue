<template lang="pug">
#contact
  Header
  main
    .hero
      .hero-body
        h1.title.is-3 お問い合わせ
        hr
        p お問い合わせは
        strong mie.university.market@gmail.com
        p にメールしていただくか
        a(
          href="https://twitter.com/mie_univ_market"
          target="_blank"
        ) Twitter(@mie_univ_market)
        p にリプライ、DM等をよろしくお願いいたします。
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
