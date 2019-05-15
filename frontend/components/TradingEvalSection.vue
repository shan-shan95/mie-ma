<template lang="pug">
.trading-eval-section
  .trading-eval-content(v-if="isBuyer")
    .note
      p 商品の取引きが完了したら以下のボタンを押してください。
    .trading-completed-button
      button.button.is-success.submit(
        @click="toggleIsModalActive()"
      ) 取引完了
</template>

<script>
export default {
  data() {
    return {
      isActive: this.isModalActive
    }
  },
  methods: {
    toggleIsModalActive() {
      this.isActive = !this.isActive
      this.$emit('toggle')
    }
  },
  props: {
    isBuyer: {
      type: Boolean,
      required: true
    },
    isModalActive: {
      type: Boolean,
      required: true
    }
  }
}
</script>

<style lang="scss" scoped>
.trading-eval-section {
  background-color: white;
  margin-bottom: 1rem;
}
.trading-eval-content {
  margin: 0rem 3rem;
  padding: 1rem 0rem;
}
</style>
