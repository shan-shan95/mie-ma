<template lang="pug">
#new
  Header
  Form(:newItem="newItem")
  Footer
</template>

<style lang="scss">
</style>

<script>
import Header from '../../components/header'
import Footer from '../../components/footer'
import Form from '../../components/ItemForm'

export default {
  components: {
    Header,
    Footer,
    Form
  },
  data() {
    return {
      newItem: gon.item
    }
  }
}
</script>
