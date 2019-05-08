<template lang="pug">
#edit
  Header
  Form(
    :formItem="formItem"
    :actionPath="updateItemPath()"
    httpMethod="patch"
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
    updateItemPath() {
      return '/items/' + this.formItem.id
    }
  }
}
</script>
