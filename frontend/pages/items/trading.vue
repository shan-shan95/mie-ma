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
      privateMessages: gon.private_messages
    }
  },
  methods: {
    privateMessagesPath() {
      return '/items/' + this.item.id + '/private_messages'
    },
    getPrivateMessages() {
      axios
        .get(this.privateMessagesPath())
        .then(res => {
          this.privateMessages = res.data
        })
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
</style>
