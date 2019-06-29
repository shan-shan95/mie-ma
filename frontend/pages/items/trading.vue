<template lang="pug">
#trading
  Header
  main
    article.hero
      .hero-body.page-contents
        Chat(
          :currentUserId="currentUserId"
          :currentUserName="currentUserName"
          :item="item"
          :message="message"
          :privateMessages="privateMessages"
          @postSuccess="getPrivateMessages()"
        )
        EvalSection(
          :isCompletedEvaluation="isCompletedEvaluation"
          :eventHub="eventHub"
        )
        ItemInfo(
          :isAblePurchase="false"
          :isSeller="isSeller()"
          :item="item"
          :sellerName="sellerName"
          :sellerId="sellerId"
        )
  Footer
  Modal(
    :beEvaluatedId="beEvaluatedId"
    :evaluatorId="currentUserId"
    :evaluatorType="currentUserRole"
    :item="item"
    :isModalActive="isModalActive"
    :eventHub="eventHub"
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
import Vue from 'vue'

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
      beEvaluatedId: gon.be_evaluated_id,
      currentUserId: gon.current_user.id,
      currentUserName: gon.current_user.nickname,
      currentUserRole: gon.role,
      eventHub: this,
      isCompletedEvaluation: gon.is_completed_evaluation,
      isModalActive: false,
      item: gon.item,
      message: gon.message,
      privateMessages: gon.private_messages,
      sellerName: gon.seller_name,
      sellerId: gon.seller_id
    }
  },
  methods: {
    toggleModal() {
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
    },
    isSeller() {
      return this.currentUserRole === 'seller'
    },
    isBuyer() {
      return this.currentUserRole === 'buyer'
    }
  },
  mounted() {
    this.eventHub.$on('toggle', function() {
      this.toggleModal()
    })
  }
}
</script>

<style lang="scss" scoped>
</style>
