<template lang="pug">
#template
  Header
  main.columns
    article.hero.column.is-two-third
      .hero-body
    SideBar
  Footer
</template>

<script>
import Header from '../../components/header'
import Footer from '../../components/footer'
import SideBar from '../../components/sidebar'

export default {
  components: {
    Header,
    Footer,
    SideBar
  }
}
</script>

<style lang="scss" scoped>
</style>
