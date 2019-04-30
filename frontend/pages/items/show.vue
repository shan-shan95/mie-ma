<template lang="pug">
#show
  Header
  main
    article.hero
      .hero-body.page-contents
        .item-info
          .info-content
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
  .modal(:class="{'is-active': isModalActive}")
    .modal-background(
      @click="toggleIsModalActive()"
    )
    .modal-content
      header.modal-card-head
        p.modal-card-title Modal title
      section.modal-card-body
      footer.modal-card-foot
        a.button.is-success(
          :href="purchasePath()"
          data-method="patch"
        ) 購入
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
import SideBar from '../../components/sidebar'
import PublicMessagesChat from '../../components/publicMessagesChat'
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
    PublicMessagesChat
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
    purchasePath() {
      return '/items/' + this.item.id + '/purchase'
    },
    publicMessagesPath() {
      return '/items/' + this.item.id + '/public_messages'
    },
    isNowOnSale() {
      return this.item.trading_status === 'now_on_sale'
    },
    getPublicMessages() {
      axios
        .get(this.publicMessagesPath())
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
