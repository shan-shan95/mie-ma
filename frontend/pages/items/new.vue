<template lang="pug">
#new
  Header
  Form(
    :formItem="formItem"
    :actionPath="createItemPath()"
    httpMethod="post"
  )
  Footer
</template>

<style lang="scss">
</style>

<script>
import Header from '../../components/AppHeader'
import Footer from '../../components/AppFooter'
import Form from '../../components/ItemForm'

export default {
  components: {
    Header,
    Footer,
    Form
  },
  data() {
    return {
      formItem: gon.item
    }
  },
  methods: {
    createItemPath() {
      return '/items'
    }
  }
}
</script>
