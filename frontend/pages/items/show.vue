<template lang="pug">
#show
  Header
  Footer
</template>

<script>
import Header from '../../components/header'
import Footer from '../../components/footer'

export default {
  components: {
    Header,
    Footer
  },
  data() {
    return {
      item: gon.item
    }
  }
}
</script>

<style lang="scss">
</style>
