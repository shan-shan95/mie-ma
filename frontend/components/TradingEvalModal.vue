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
        .note
          p 出品者の取引までのやり取り、取引時の対応はどうでしたか？
          p 3つのうちから1つを選び、コメントがあれば入力してください。
        .evaluations.columns.is-centered
          .column
            .good(
              @click="toggleIsGood()"
              :class="{'selected-good': isGood}"
            )
              .eval-content
                p Good
                i.far.fa-laugh.fa-4x.i-center
          .column
            .normal(
              @click="toggleIsNormal()"
              :class="{'selected-normal': isNormal}"
            )
              .eval-content
                p Normal
                i.far.fa-meh.fa-4x.i-center
          .column
            .bad(
              @click="toggleIsBad()"
              :class="{'selected-bad': isBad}"
            )
              .eval-content
                p Bad
                i.far.fa-frown.fa-4x.i-center
          input.none(
            name="item_id"
            :value="item.id"
          )
          input.none(
            name="evaluation_comment[seller_id]"
            :value="sellerId"
          )
          input.none(
            name="evaluation_comment[buyer_id]"
            :value="buyerId"
          )
          input.none(
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
          v-if="isMessageTooLong()"
        ) 文字数が長すぎます
      footer.modal-card-foot
        button.button.is-success(
          type="submit"
          v-if="!isMessageTooLong() && isSelectedStatus()"
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
      @click.prevent="toggleIsModalActive()"
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
      this.evalStatus = 'good'
    },
    toggleIsNormal() {
      this.isNormal = true
      this.isGood = false
      this.isBad = false
      this.evalStatus = 'normal'
    },
    toggleIsBad() {
      this.isBad = true
      this.isGood = false
      this.isNormal = false
      this.evalStatus = 'bad'
    },
    isMessageTooLong() {
      return this.evalComment.length > 255
    },
    isSelectedStatus() {
      return this.evalStatus
    }
  },
  props: {
    isModalActive: {
      type: Boolean,
      required: true
    },
    sellerId: {
      type: String,
      required: true
    },
    buyerId: {
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
  min-height: 20vh;
}
.good:hover,
.selected-good {
  font-size: 1.2rem;
  color: rgb(221, 126, 221);
}
.normal:hover,
.selected-normal {
  font-size: 1.2rem;
  color: rgb(219, 219, 98);
}
.bad:hover,
.selected-bad {
  font-size: 1.2rem;
  color: rgb(113, 172, 226);
}
.eval-comment {
  max-width: 80%;
  margin: 0 auto;
}
.notification {
  margin-top: 1.5rem;
}
.eval-content {
  display: block;
  text-align: center;
}
.modal-card-body {
  padding-top: 0;

  .note {
    margin: 1rem auto 0rem;
    max-width: 80%;
  }

  .none {
    display: none;
  }
}
</style>
