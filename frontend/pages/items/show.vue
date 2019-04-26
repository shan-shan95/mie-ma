<template lang="pug">
#show
  Header
  main
    article.hero
      .hero-body
        .item-info
          .info-content
            h1.title.is-3.has-text-centered {{ item.name }}
            .dummy
            strong.price ¥{{ item.price.toLocaleString() }}
            p.view {{ item.view }} views
            a.button.is-success.purchase(
              :disabled="isSeller"
              v-if="nowOnSale()"
              :href="purchasePath()"
              data-method="patch"
            ) 購入する
            a.button.is-success.purchase(
              disabled
              v-else
            ) 売り切れ
            button.button.is-link.secret-chat(:disabled="isSeller || !isSignedIn") 非公開チャットする
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
import SideBar from '../../components/sidebar'

export default {
  components: {
    Header,
    Footer,
    SideBar
  },
  data() {
    return {
      item: gon.item,
      sellerName: gon.seller_name,
      isSeller: gon.is_seller,
      isSignedIn: gon.is_signed_in
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
.hero-body {
  padding: 3rem 10rem;
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
  margin: 0rem 6rem;
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
  margin: 2rem auto 0;
  height: 3rem;
  width: 10rem;
  font-size: 1.2rem;
}
.secret-chat {
  margin: 2rem auto 1rem;
  height: 3rem;
  width: 10rem;
  display: block;
  font-size: 0.8rem;
}
</style>
