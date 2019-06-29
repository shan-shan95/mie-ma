<template lang="pug">
.modal(:class="{'is-active': isModalActive}")
  .modal-background(
    @click="toggleIsModalActive()"
  )
  .modal-content
    header.modal-card-head
      p.modal-card-title 購入確認
    section.modal-card-body
      p 1. 購入後、出品者と購入者間で非公開メッセージのやりとりができるようになります。お金を渡す場所と時間を決め、商品とお金を交換してください。
      p 2. 購入者は、取引が完了したら出品者の評価をしてください。
      .has-text-centered.purchase-note
        span 購入した場合、
        a(
          href="/terms_of_service"
          target="_blank"
        ) 利用規約
        span に同意したものとみなします
    footer.modal-card-foot
      a.button.is-success(
        :href="purchasePath()"
        data-method="patch"
      ) 購入
      button.button(
        @click="toggleIsModalActive()"
      ) キャンセル
  button.modal-close.is-large(
    aria-label="close"
    @click="toggleIsModalActive()"
    )
</template>

<script>
export default {
  data() {
    return {
      isActive: this.isModalActive
    }
  },
  methods: {
    purchasePath() {
      return '/items/' + this.item.id + '/purchase'
    },
    toggleIsModalActive() {
      this.isActive = !this.isActive
      this.$emit('toggle')
    }
  },
  props: {
    isModalActive: {
      type: Boolean,
      required: true
    },
    item: {
      type: Object,
      required: true
    }
  }
}
</script>

<style lang="scss" scoped>
@import '../init/_responsive';

.modal-content {
  @include sp {
    width: 80%;
    margin: 0 auto;
  }

  .modal-card-body {
    p {
      margin-top: 0.5rem;
      margin-bottom: 0.5rem;
    }

    .map {
      max-width: 70%;
    }
  }
  .purchase-note {
    margin-top: 2rem;
  }
}
</style>
