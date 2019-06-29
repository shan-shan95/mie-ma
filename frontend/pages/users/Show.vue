<template lang="pug">
#show
  Header
  main.hero
    .hero-body
      h1.title.is-3 プロフィール
      hr
      h2.is-size-5.has-text-black.title {{ user.nickname }}
      p.profile {{ user.profile }}
  Footer
</template>

<script>
import Header from '../../components/AppHeader'
import Footer from '../../components/AppFooter'

export default {
  components: {
    Header,
    Footer
  },
  data() {
    return {
      user: gon.user
    }
  }
}
</script>

<style lang="scss" scoped>
.profile {
  white-space: pre-wrap;
  word-wrap: break-word;
}
</style>
