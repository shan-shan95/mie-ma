<template lang="pug">
#index
  App
  p Index page
  img(src='../../images/image.jpg')
  a.button.is-primary.fas.fa-igloo Button
  i.fas.fa-igloo Item
  span.fas.fa-ad
  p.fas.fa-ad こんにちは
</template>

<style lang="scss"></style>

<script>
import App from '../../components/app'

export default {
  components: {
    App
  }
}
</script>
