<template lang="pug">
.modal(:class="{'is-active': isModalActive}")
  .modal-background(
    @click="toggleIsModalActive()"
  )
  .modal-content
    header.modal-card-head
      p.modal-card-title Modal title
    section.modal-card-body
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
</style>
