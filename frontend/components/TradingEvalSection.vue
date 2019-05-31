<template lang="pug">
.trading-eval-section
  .trading-eval-content
    template(v-if="!isCompletedEvaluation")
      .note
        p 商品の取引きが完了したら以下のボタンを押してください。
      .trading-completed-button
        button.button.is-success.trading-submit(
          @click="toggleModal()"
        ) 取引完了
    template(v-else)
      .note
        p 現在、取引相手の評価を待っています。
</template>

<script>
export default {
  methods: {
    toggleModal() {
      this.eventHub.$emit('toggle')
    }
  },
  props: {
    isCompletedEvaluation: {
      type: Boolean,
      required: true
    },
    eventHub: {
      type: Object,
      required: true
    }
  }
}
</script>

<style lang="scss" scoped>
.trading-eval-section {
  background-color: white;
  margin-bottom: 1rem;

  .trading-eval-content {
    margin: 0rem 3rem;
    padding: 1rem 0rem;

    .note {
      background-color: rgba(255, 255, 110, 0.4);
      width: 100%;
      margin: 0.5rem 0;
      padding: 0.5rem;

      p {
        color: black;
        font-size: 0.8rem;
      }
    }

    .trading-submit {
      display: block;
      margin: 0 auto;
    }
  }
}
</style>
