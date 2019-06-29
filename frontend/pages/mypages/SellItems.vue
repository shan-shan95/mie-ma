<template lang="pug">
#SellItems
  Header
  main
    .columns
      .column.is-2
        Menu
      .column.is-10
        .hero
          .hero-body
            h1.title.is-3 出品した商品
            hr
            .content
              .statuses.columns.is-centered
                a.status.has-text-centered(
                  @click="selectStatus('now_on_sale')"
                  :class="{ 'selected': isSelectedStatus('now_on_sale') }"
                ) 出品中
                a.status.has-text-centered(
                  @click="selectStatus('trading')"
                  :class="{ 'selected': isSelectedStatus('trading') }"
                ) 取引中
                a.status.has-text-centered(
                  @click="selectStatus('completed')"
                  :class="{ 'selected': isSelectedStatus('completed') }"
                ) 売却済
              hr.hr
              .item-columns
                a.item-column(
                  v-for="item in selectedItems(selectedItemStatus)"
                  :key="item.id"
                  :href="itemPath(item.id)"
                )
                  img.image.is-96x96.item-img(
                    :src="item.sumbnail_url"
                    alt="販売商品のサムネイル"
                    decoding="async"
                  )
                  p.item-name {{ item.name }}
                p(v-if="selectedItems(selectedItemStatus).length === 0") この項目には表示できる商品がありません
  Footer
</template>

<script>
import Header from '../../components/AppHeader'
import Footer from '../../components/AppFooter'
import Menu from '../../components/MypageMenu'

export default {
  components: {
    Header,
    Footer,
    Menu
  },
  data() {
    return {
      selectedItemStatus: 'trading',
      sellItems: gon.sell_items
    }
  },
  methods: {
    isSelectedStatus(status) {
      return status === this.selectedItemStatus
    },
    selectStatus(status) {
      this.selectedItemStatus = status
    },
    selectedItems(status) {
      return this.sellItems.filter(x => x.trading_status === status)
    },
    itemPath(id) {
      return '/items/' + id
    }
  }
}
</script>

<style lang="scss" scoped>
.content {
  padding: 1rem 3rem;

  .statuses {
    justify-content: space-around;

    .status {
      width: 33%;
      color: #4a4a4a;
    }

    .selected {
      box-shadow: 0 6px 4px -4px lightblue;
    }
  }
  .hr {
    margin: 0.5rem auto;
    background-color: #aaaaaa;
  }
  .item-columns {
    margin: 1rem auto;

    .item-column {
      display: flex;
      margin: 1rem auto;
      max-width: 70%;
      border: solid thin rgba(gray, 0.6);
      border-radius: 10px;
      box-shadow: 2px 2px 4px gray;
      overflow: hidden;
    }

    .item-name {
      display: flex;
      justify-content: center;
      align-items: center;
      margin-left: 2rem;
      color: #4a4a4a;
    }
  }
}
</style>
