<template lang="pug">
#template
  Header
  main.columns
    article.hero.column.is-two-third
      .hero-body
        PrivateMessagesChat(
          :message="message"
          :item="item"
          :userId="userId"
          :privateMessages="privateMessages"
          @postSuccess="getPrivateMessages()"
        )
        .trading-completed-section
          .trading-completed-content
            .note
              p 商品の取引きが完了したら以下のボタンを押してください。
            .trading-completed-button
              button.button.is-success.submit(
                @click="toggleIsModalActive()"
              ) 取引完了
        .item-info
          .info-content
            h1.title.is-3.has-text-centered {{ item.name }}
            .dummy
            strong.price ¥{{ item.price.toLocaleString() }}
            table.table.is-fullwidth
              tbody
                tr
                  td
                    strong 出品者
                  td {{ sellerName }}
                tr
                  td
                    strong 商品状態
                  td {{ item.status }}
            .description {{ item.description }}
  Footer
  .modal(:class="{'is-active': isModalActive}")
    .modal-background(
      @click="toggleIsModalActive()"
    )
    .modal-content
      header.modal-card-head
        p.modal-card-title 評価
      section.modal-card-body
        .evaluations.columns.is-centered
          .good
            i.far.fa-laugh
          .normal
            i.far.fa-meh
          .bad
            i.far.fa-frown
      footer.modal-card-foot
        button.button.is-success(
          @click="postEvaluationComments()"
        ) 評価する
        button.button(
          @click="toggleIsModalActive()"
        ) キャンセル
    button.modal-close.is-large(
      aria-label="close"
      @click="toggleIsModalActive()"
      )
</template>

<script>
import Header from '../../components/header'
import Footer from '../../components/footer'
import PrivateMessagesChat from '../../components/privateMessagesChat.vue'
import axios from 'axios'
axios.defaults.headers.common = {
  'X-Requested-With': 'XMLHttpRequest',
  'X-CSRF-TOKEN': document
    .querySelector('meta[name="csrf-token"]')
    .getAttribute('content')
}

export default {
  components: {
    Header,
    Footer,
    PrivateMessagesChat
  },
  data() {
    return {
      item: gon.item,
      message: gon.message,
      sellerName: gon.seller_name,
      userId: gon.user_id,
      privateMessages: gon.private_messages,
      isModalActive: false
    }
  },
  methods: {
    getPrivateMessages() {
      axios
        .get('/private_messages', {
          params: {
            item_id: this.item.id
          }
        })
        .then(res => {
          this.privateMessages = res.data
        })
        .catch(err => {})
    },
    toggleIsModalActive() {
      this.isModalActive = !this.isModalActive
    },
    postEvaluationComments() {
      axios
        .post('evaluation_messages', {
          user_id: this.userId
        })
        .then(res => {})
        .catch(err => {})
    }
  }
}
</script>

<style lang="scss" scoped>
.page-contents {
  padding: 3rem 6rem;
}
.dummy {
  height: 16rem;
  width: 100%;
  background-color: grey;
  margin-bottom: 2rem;
}
.item-info {
  background-color: white;
}
.info-content {
  margin: 0rem 3rem;
  padding: 2rem 0rem;
}
.view {
  text-align: right;
}
.price {
  display: block;
  text-align: center;
  font-weight: bold;
  font-size: 2.5rem;
  color: #48bedb;
}
.trading-completed-section {
  background-color: white;
  margin-bottom: 1rem;
}
.trading-completed-content {
  margin: 0rem 3rem;
  padding: 1rem 0rem;
}
.note {
  background-color: rgba(255, 255, 110, 0.4);
  width: 100%;
  margin: 1rem 0 0.5rem;
  padding: 0.5rem 0;

  p {
    color: black;
    font-size: 0.8rem;
  }
}
</style>
