<template lang="pug">
#evaluation-comments
  Header
  main
    .columns
      .column.is-2
        Menu
      .column.is-10
        .hero
          .hero-body
            h1.title.is-3 評価
            hr
            .content
              .evaluations.columns.is-centered
                a.evaluation.good.has-text-centered(
                  :class="{'selected': isSelectedEval('good')}"
                  @click="selectEval('good')"
                )
                  template
                    i.far.fa-laugh.icon.is-medium.fa-lg.i-center
                    span.is-size-5 良い
                  template
                    p {{ selectedEvalComments('good').length }}
                a.evaluation.normal.has-text-centered(
                  :class="{'selected': isSelectedEval('normal')}"
                  @click="selectEval('normal')"
                )
                  template
                    i.far.fa-meh.icon.is-medium.fa-lg.i-center
                    span.is-size-5 普通
                  template
                    p {{ selectedEvalComments('normal').length }}
                a.evaluation.bad.has-text-centered(
                  :class="{'selected': isSelectedEval('bad')}"
                  @click="selectEval('bad')"
                )
                  template
                    i.far.fa-frown.icon.is-medium.fa-lg
                    span.is-size-5 イマイチ
                  template
                    p {{ selectedEvalComments('bad').length }}
              hr.hr
              .evaluation-comments__background(v-if="isExistComments")
                .evaluation-comment__column(
                  v-for="evaluation in selectedEvalComments(selectedEval)"
                  :key="evaluation.id"
                )
                  .profile
                    img.profile__img.is-rounded(
                      src="https://d16vmihj9x3vj.cloudfront.net/assets/images/dummy-profile.png"
                      alt="プロフィール画像"
                    )
                  .evaluation-comment__main
                    .evaluator-info
                      i.evaluator-info__icon.far.fa-lg(
                        :class="selectEvalIconClass"
                      )
                      p.evaluator-info__role {{ displayEvaluatorRole(evaluation.evaluator_type) }}
                    .evaluator-info__name {{ evaluation.evaluator_name }}
                    .comment {{ evaluation.comment }}
              p(v-else) この項目には表示できるコメントがありません
  Footer
</template>

<script>
import Header from '../../components/AppHeader'
import Footer from '../../components/AppFooter'
import Menu from '../../components/MypageMenu'

export default {
  components: {
    Header,
    Footer,
    Menu
  },
  data() {
    return {
      selectedEval: 'good',
      evalComments: gon.eval_comments
    }
  },
  methods: {
    isSelectedEval(evaluation) {
      return evaluation === this.selectedEval
    },
    selectEval(evaluation) {
      this.selectedEval = evaluation
    },
    selectedEvalComments(evaluation) {
      return this.evalComments.filter(x => x.status === evaluation)
    },
    displayEvaluatorRole(role) {
      switch (role) {
        case 'seller':
          return '販売者'
          break
        case 'buyer':
          return '購入者'
          break
        default:
          return ''
          break
      }
    }
  },
  computed: {
    isExistComments() {
      return this.selectedEvalComments(this.selectedEval).length !== 0
    },
    selectEvalIconClass() {
      switch (this.selectedEval) {
        case 'good':
          return 'fa-laugh good'
          break
        case 'normal':
          return 'fa-meh normal'
          break
        case 'bad':
          return 'fa-frown bad'
          break
        default:
          return ''
          break
      }
    }
  }
}
</script>

<style lang="scss" scoped>
.content {
  width: 90%;

  .evaluations {
    justify-content: space-around;

    .evaluation {
      width: 33%;
      color: #4a4a4a;
    }

    .good {
      color: rgb(221, 126, 221);
    }

    .normal {
      color: rgb(219, 219, 98);
    }

    .bad {
      color: rgb(113, 172, 226);
    }

    .selected {
      box-shadow: 0px 6px 4px -4px lightblue;
    }
  }

  .hr {
    margin: 0.5rem auto;
    margin-bottom: 1rem;
    background-color: #aaaaaa;
  }

  .evaluation-comments__background {
    background-color: white;
    width: 100%;
    border-radius: 5px;
    padding: 2rem;

    .evaluation-comment__column {
      display: flex;
      margin-bottom: 1.5rem;
    }

    .profile {
      max-width: 48px;
      max-height: 48px;
      margin: 0 1rem;

      &__img {
        border-radius: 50px;
      }
    }

    .evaluation-comment__main {
      max-width: 492px;

      .evaluator-info {
        display: flex;

        &__icon {
          line-height: 1.5rem;
          margin-right: 0.5rem;
        }

        &__role {
          color: grey;
        }

        .good {
          color: rgb(221, 126, 221);
        }

        .normal {
          color: rgb(219, 219, 98);
        }

        .bad {
          color: rgb(113, 172, 226);
        }
      }

      .evaluator-info__name {
        display: block;
        color: grey;
      }

      .comment {
        white-space: pre-wrap;
        word-wrap: break-word;
      }
    }
  }
}
</style>
