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
            strong.price ¥2,700円
            p.view {{ item.view }} views
            button.button.is-success.purchase 購入する
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
      sellerName: gon.seller_name
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
  color: #ea323d;
}
.description {
  margin-top: 3rem;
}
.purchase {
  margin: 1rem auto;
  height: 4rem;
  min-width: 10rem;
  display: block;
  font-size: 1.5rem;
}
</style>
