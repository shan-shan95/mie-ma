<template lang="pug">
.item-info
  .info-content
    .is-clearfix
      .is-pulled-right
        a(
          :href="editItemPath()"
          v-if="isSeller && isNowOnSale()"
        )
          i.fas.fa-edit
          span  編集する
    .is-clearfix
      .is-pulled-right
        a(
          :href="destroyItemPath()"
          method="delete"
          v-if="isSeller && isNowOnSale()"
        )
          i.fas.fa-trash
          span  削除する
    h1.title.is-3.has-text-centered {{ item.name }}
    .dummy
    strong.price ¥{{ item.price.toLocaleString() }}
    p.view {{ item.view }} views
    .purchase(v-if="isAblePurchase")
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
          td {{ itemStatus() }}
    .description {{ item.description }}
</template>

<script>
export default {
  methods: {
    isNowOnSale() {
      return this.item.trading_status === 'now_on_sale'
    },
    toggleIsModalActive() {
      this.isModalActive = !this.isModalActive
    },
    editItemPath() {
      return '/items/' + this.item.id + '/edit'
    },
    destroyItemPath() {
      return '/items/' + this.item.id
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
  },
  props: {
    item: {
      type: Object,
      required: true
    },
    isSeller: {
      type: Boolean,
      required: true
    },
    sellerName: {
      type: String,
      required: true
    },
    isAblePurchase: {
      type: Boolean,
      required: true
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
</style>
