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
                v-if="nowOnSale()"
                :href="purchasePath()"
                data-method="patch"
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
          :trading_messages="trading_messages"
        )
  Footer
</template>

<script>
import Header from '../../components/header'
import Footer from '../../components/footer'
import SideBar from '../../components/sidebar'
import PublicMessagesChat from '../../components/publicMessagesChat'

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
      trading_messages: gon.trading_messages
    }
  },
  methods: {
    purchasePath: () => {
      return '/items/' + gon.item.id + '/purchase'
    },
    nowOnSale: () => {
      return gon.item.trading_status === 'now_on_sale'
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
.disabled {
  pointer-events: none;
}
</style>
