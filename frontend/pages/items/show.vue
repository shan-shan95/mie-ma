<template lang="pug">
#show
  Header
  main
    article.hero
      .hero-body.page-contents
        ItemInfo(
          :item="item"
          :isSeller="isSeller"
          :sellerName="sellerName"
          :isAblePurchase="true"
          :isModalActive="isModalActive"
          @toggle="toggleIsModalActive()"
        )
        Chat(
          :message="message"
          :item="item"
          :userId="userId"
          :userName="userName"
          :publicMessages="publicMessages"
          @postSuccess="getPublicMessages()"
          v-if="isNowOnSale()"
        )
  Footer
  Modal(
    :isModalActive="isModalActive"
    @toggle="toggleIsModalActive()"
    :item="item"
  )
</template>

<script>
import Header from '../../components/AppHeader'
import Footer from '../../components/AppFooter'
import SideBar from '../../components/AppSidebar'
import Chat from '../../components/PublicMessagesChat'
import Modal from '../../components/ItemPurchaseModal'
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
    SideBar,
    Chat,
    Modal,
    ItemInfo
  },
  data() {
    return {
      item: gon.item,
      message: gon.message,
      sellerName: gon.seller_name,
      isSeller: gon.is_seller,
      isSignedIn: gon.is_signed_in,
      userId: gon.current_user.id,
      userName: gon.current_user.nickname,
      publicMessages: gon.public_messages,
      isModalActive: false
    }
  },
  methods: {
    isNowOnSale() {
      return this.item.trading_status === 'now_on_sale'
    },
    getPublicMessages() {
      axios
        .get('/public_messages', {
          params: {
            item_id: this.item.id
          }
        })
        .then(res => {
          this.publicMessages = res.data
        })
        .catch(err => {})
    },
    toggleIsModalActive() {
      this.isModalActive = !this.isModalActive
    }
  }
}
</script>

<style lang="scss">
</style>
