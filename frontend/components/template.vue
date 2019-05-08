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
import Header from '../../components/AppHeader'
import Footer from '../../components/AppFooter'
import SideBar from '../../components/AppSidebar'

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
