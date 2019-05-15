<template lang="pug">
#trading
  Header
  main
    article.hero
      .hero-body.page-contents
        Chat(
          :message="message"
          :item="item"
          :userId="userId"
          :userName="userName"
          :privateMessages="privateMessages"
          @postSuccess="getPrivateMessages()"
        )
        EvalSection(
          :isBuyer="isBuyer",
          :isModalActive="isModalActive"
          @toggle="toggleIsModalActive()"
        )
        ItemInfo(
          :item="item"
          :isSeller="isSeller"
          :sellerName="sellerName"
          :isAblePurchase="false"
          :isModalActive="isModalActive"
        )
  Footer
  Modal(
    :isModalActive="isModalActive"
    @toggle="toggleIsModalActive()"
    :userId="userId"
    :item="item"
  )
</template>

<script>
import Header from '../../components/AppHeader'
import Footer from '../../components/AppFooter'
import Chat from '../../components/PrivateMessagesChat'
import Modal from '../../components/TradingEvalModal'
import EvalSection from '../../components/TradingEvalSection'
import ItemInfo from '../../components/ItemInfo'
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
    Chat,
    Modal,
    EvalSection,
    ItemInfo
  },
  data() {
    return {
      item: gon.item,
      message: gon.message,
      sellerName: gon.seller_name,
      isSeller: gon.is_seller,
      isBuyer: gon.is_buyer,
      userId: gon.user_id,
      userName: gon.user_name,
      privateMessages: gon.private_messages,
      isModalActive: false
    }
  },
  methods: {
    toggleIsModalActive() {
      this.isModalActive = !this.isModalActive
    },
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
    itemStatus() {
      switch (this.item.status) {
        case 'brand_new':
          return '新品'
        case 'excellent':
          return '良品'
        case 'poor':
          return '傷あり'
        case 'junk':
          return 'ジャンク'
      }
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
