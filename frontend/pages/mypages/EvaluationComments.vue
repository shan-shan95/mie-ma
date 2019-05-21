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
            .columns.evaluations.is-centered
              .eval-column.is-4.good(
                :class="{'selected': isSelectedEval('good')}"
                @click="selectEval('good')"
              )
                i.far.fa-laugh.icon.is-medium.fa-lg.i-center
                span.is-size-5 Good
              .eval-column.is-4.normal(
                :class="{'selected': isSelectedEval('normal')}"
                @click="selectEval('normal')"
              )
                i.far.fa-meh.icon.is-medium.fa-lg.i-center
                span.is-size-5 Normal
              .eval-column.is-4.bad(
                :class="{'selected': isSelectedEval('bad')}"
                @click="selectEval('bad')"
              )
                i.far.fa-frown.icon.is-medium.fa-lg
                span.is-size-5 Bad
            hr.evals-hr
            .comment-background
              .comment-column(
                v-for="evaluation in selectedEvalComments(selectedEval)"
                :key="evaluation.id"
              )
                .user-info
                  p.user-name {{ evaluation.buyer_name }}
                .comment
                  p.comment-content {{ evaluation.comment }}
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
    }
  }
}
</script>

<style lang="scss" scoped>
.evaluations {
  .eval-column {
    display: flex;
    width: 150px;
    margin: 0 auto;
    align-items: center;
    justify-content: center;
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
.evals-hr {
  margin: 0.5rem auto;
  width: 90%;
  background-color: #aaaaaa;
}
.selected {
  box-shadow: 0px 0px 6px 1px rgba(113, 172, 226, 0.8);
  border-radius: 10px;
}
.comment-background {
  background-color: rgba(120, 255, 200, 0.3);
  width: 100%;
  border-radius: 12px;

  .comment-column {
    display: flex;
    max-width: 90%;
    margin: 0.5rem auto;
    padding: 0.5rem 0;

    .user-info {
      padding: 10px;
    }

    .comment {
      background-color: transparent;
      display: inline-block;
      position: relative;
      margin: 0 0 0 4rem;
      padding: 10px;
      max-width: 75%;
      min-width: 40%;
      border-radius: 12px;
      background: #eff0f4;
      border: 1px solid #9c9c9c;
      word-wrap: break-word;
    }
  }
}
</style>
