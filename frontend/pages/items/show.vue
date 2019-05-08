<template lang="pug">
#show
  Header
  main
    article.hero
      .hero-body.page-contents
        .item-info
          .info-content
            .is-clearfix
              .is-pulled-right
                a(
                  :href="editItemPath()"
                  v-show="isSeller && isNowOnSale()"
                )
                  i.fas.fa-edit
                  span  編集する
            .is-clearfix
              .is-pulled-right
                a(
                  :href="destroyItemPath()"
                  method="delete"
                  v-show="isSeller && isNowOnSale()"
                )
                  i.fas.fa-trash
                  span  削除する
            h1.title.is-3.has-text-centered {{ item.name }}
            .dummy
            strong.price ¥{{ item.price.toLocaleString() }}
            p.view {{ item.view }} views
            .purchase
              a.button.is-success(
                :class="{'disabled': isSeller}"
                :disabled="isSeller"
                v-if="isNowOnSale()"
                @click="toggleIsModalActive()"
              ) 購入する
              a.button.is-success.disabled(
                disabled
                v-else
              ) 売り切れ
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
        PublicMessagesChat(
          :message="message"
          :item="item"
          :userId="userId"
          :publicMessages="publicMessages"
          @postSuccess="getPublicMessages()"
          v-if="isNowOnSale()"
        )
  Footer
  Modal(
    :isModalActive="isModalActive",
    @toggle="toggleIsModalActive()",
    :item="item"
  )
</template>

<script>
import Header from '../../components/header'
import Footer from '../../components/footer'
import SideBar from '../../components/sidebar'
import PublicMessagesChat from '../../components/publicMessagesChat'
import Modal from '../../components/ShowPurchaseModal'
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
    PublicMessagesChat,
    Modal
  },
  data() {
    return {
      item: gon.item,
      message: gon.message,
      sellerName: gon.seller_name,
      isSeller: gon.is_seller,
      isSignedIn: gon.is_signed_in,
      userId: gon.user_id,
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
    },
    editItemPath() {
      return '/items/' + this.item.id + '/edit'
    },
    destroyItemPath() {
      return '/items/' + this.item.id
    }
  }
}
</script>

<style lang="scss">
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
.purchase {
  display: block;
  margin: 1rem auto;
  height: 3rem;
  width: 10rem;

  a {
    width: 100%;
    height: 100%;
    font-size: 1.2rem;
  }
}
.secret-chat {
  margin: 2rem auto 1rem;
  height: 3rem;
  width: 10rem;
  display: block;
  font-size: 0.8rem;
}
</style>
