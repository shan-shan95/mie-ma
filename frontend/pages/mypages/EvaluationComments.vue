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
                  i.far.fa-laugh.icon.is-medium.fa-lg.i-center
                  span.is-size-5 Good
                a.evaluation.normal.has-text-centered(
                  :class="{'selected': isSelectedEval('normal')}"
                  @click="selectEval('normal')"
                )
                  i.far.fa-meh.icon.is-medium.fa-lg.i-center
                  span.is-size-5 Normal
                a.evaluation.bad.has-text-centered(
                  :class="{'selected': isSelectedEval('bad')}"
                  @click="selectEval('bad')"
                )
                  i.far.fa-frown.icon.is-medium.fa-lg
                  span.is-size-5 Bad
              hr.hr
              .message-background
                .message-column(
                  v-for="evaluation in selectedEvalComments(selectedEval)"
                  :key="evaluation.id"
                )
                  .user-info
                    p.user-name {{ evaluation.buyer_name }}
                  .message
                    p.message-content {{ evaluation.comment }}
              p(v-if="selectedEvalComments(selectedEval).length === 0") この項目には表示できるメッセージがありません
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
      return this.evalComments.filter(
        x => x.status === evaluation && x.comment !== ''
      )
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
}
</style>
