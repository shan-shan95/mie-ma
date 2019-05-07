<template lang="pug">
form(
  action="/evaluation_comments"
  accept-charset="UTF-8"
  method="post"
)
  input(
    name="utf8"
    type="hidden"
    value="✓"
  )
  input(
    name="authenticity_token"
    type="hidden"
    value="csrf_token"
  )
  .modal(:class="{'is-active': isModalActive}")
    .modal-background(
      @click="toggleIsModalActive()"
    )
    .modal-content
      header.modal-card-head
        p.modal-card-title 評価
      section.modal-card-body
        .evaluations.columns.is-centered
          .column
            .good(
                @click="toggleIsGood()"
                :class="{'selected-good': isGood}"
              )
              i.far.fa-laugh.fa-4x.i-center
          .column
            .normal(
                @click="toggleIsNormal()"
                :class="{'selected-normal': isNormal}"
              )
              i.far.fa-meh.fa-4x.i-center
          .column
            .bad(
                @click="toggleIsBad()"
                :class="{'selected-bad': isBad}"
              )
              i.far.fa-frown.fa-4x.i-center
          input.none(
            name="item_id"
            :value="item.id"
          )
          input.none(
            name="evaluation_comment[user_id]"
            :value="userId"
          )
          input.none(
            type="number"
            name="evaluation_comment[status]"
            :value="evalStatus"
          )
        .eval-comment
          textarea.textarea.is-primary(
            autocomplete="off"
            rows="4"
            name="evaluation_comment[comment]"
            v-model="evalComment"
          )
        .notification.is-danger(
          v-if="checkMessageLength()"
        ) {{ checkMessageLength() }}
      footer.modal-card-foot
        button.button.is-success(
          type="submit"
          v-if="!checkMessageLength()"
        ) 評価する
        button.button.is-success.disabled(
          v-else
          disabled
        ) 評価する
        button.button(
          @click.prevent="toggleIsModalActive()"
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
      isActive: this.isModalActive,
      isGood: false,
      isNormal: false,
      isBad: false,
      evalStatus: null,
      evalComment: ''
    }
  },
  methods: {
    toggleIsModalActive() {
      this.isActive = !this.isActive
      this.$emit('toggle')
    },
    toggleIsGood() {
      this.isGood = true
      this.isNormal = false
      this.isBad = false
      this.evalStatus = 0
    },
    toggleIsNormal() {
      this.isNormal = true
      this.isGood = false
      this.isBad = false
      this.evalStatus = 1
    },
    toggleIsBad() {
      this.isBad = true
      this.isGood = false
      this.isNormal = false
      this.evalStatus = 2
    },
    checkMessageLength() {
      if (this.evalComment.length > 255) {
        return '文字数が多すぎます'
      } else {
        return ''
      }
    }
  },
  props: {
    isModalActive: {
      type: Boolean,
      required: true
    },
    userId: {
      type: String,
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
.good,
.normal,
.bad {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 6rem;
}
.good:hover,
.selected-good {
  font-size: 1.5rem;
  color: rgb(221, 126, 221);
}
.normal:hover,
.selected-normal {
  font-size: 1.5rem;
  color: rgb(219, 219, 98);
}
.bad:hover,
.selected-bad {
  font-size: 1.5rem;
  color: rgb(113, 172, 226);
}
.eval-comment {
  max-width: 80%;
  margin: 0 auto;
}
.notification {
  margin-top: 1.5rem;
}
</style>
