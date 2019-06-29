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
      @click="toggleModal()"
    )
    .modal-content
      header.modal-card-head
        p.modal-card-title 評価
      section.modal-card-body
        .note
          p 相手の取引までのやり取り、取引時の対応はどうでしたか？
          p 3つのうちから1つを選び、コメントがあれば入力してください。
        .evaluations.columns.is-centered.is-mobile
          .column
            .good(
              @click="toggleIsGood()"
              :class="{'selected-good': isGood}"
            )
              .eval-content
                p 良い
                i.far.fa-laugh.fa-4x.i-center
          .column
            .normal(
              @click="toggleIsNormal()"
              :class="{'selected-normal': isNormal}"
            )
              .eval-content
                p 普通
                i.far.fa-meh.fa-4x.i-center
          .column
            .bad(
              @click="toggleIsBad()"
              :class="{'selected-bad': isBad}"
            )
              .eval-content
                p イマイチ
                i.far.fa-frown.fa-4x.i-center
          input.none(
            name="evaluation_comment[evaluator_id]"
            :value="evaluatorId"
          )
          input.none(
            name="evaluation_comment[be_evaluated_id]"
            :value="beEvaluatedId"
          )
          input.none(
            name="evaluation_comment[evaluator_type]"
            :value="evaluatorType"
          )
          input.none(
            name="evaluation_comment[item_id]"
            :value="item.id"
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
          @click.prevent="toggleModal()"
        ) キャンセル
    button.modal-close.is-large(
      aria-label="close"
      @click.prevent="toggleModal()"
      )
</template>

<script>
export default {
  data() {
    return {
      isGood: false,
      isNormal: false,
      isBad: false,
      evalStatus: null,
      evalComment: ''
    }
  },
  methods: {
    toggleModal() {
      this.eventHub.$emit('toggle')
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
    evaluatorId: {
      type: String,
      required: true
    },
    beEvaluatedId: {
      type: String,
      required: true
    },
    evaluatorType: {
      type: String,
      required: true
    },
    item: {
      type: Object,
      required: true
    },
    isModalActive: {
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
@import '../init/_responsive';

.modal-background {
  overflow: hidden;
}

.good,
.normal,
.bad {
  display: flex;
  justify-content: center;
  align-items: center;
  @include pc {
    min-height: 20vh;
  }

  p {
    @include sp {
      font-size: 0.8rem;
    }
  }

  i {
    @include sp {
      font-size: 2rem;
    }
  }
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
  @include sp {
    font-size: 0.8rem;
  }
}

.modal-content {
  @include sp {
    width: auto;
    max-height: 100%;
  }

  .modal-card-head {
    @include sp {
      padding: 1rem;
    }
  }

  .modal-card-body {
    padding-top: 0;
    @include sp {
      padding: 0 0 1rem 0;
    }

    .note {
      margin: 1rem auto 0rem;
      max-width: 80%;
      @include sp {
        font-size: 0.8rem;
      }
    }

    .none {
      display: none;
    }
  }

  .modal-card-foot {
    padding: 1rem;
  }
}
</style>
