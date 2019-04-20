<template lang="pug">
#index
  Header
  .columns
    section.hero.column.is-two-third
      h1.title.is-3 新着アイテム
      hr
    section.hero.column.is-one-third
      h3.title.is-5 Twitter
</template>

<style lang="scss">
@import '../../init/_variables';
</style>

<script>
import Header from '../../components/header'

export default {
  components: {
    Header
  }
}
</script>
