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
          data-method="delete"
          v-if="isSeller && isNowOnSale()"
        )
          i.fas.fa-trash
          span  削除する
    h1.title.is-3.has-text-centered {{ item.name }}
    .carousel
      a.control-prev(
        @click="back()"
        :class="{ 'is-nonactive': isFirstImage() }"
      )
        span.arrow-icon <
      transition(:name="transitionName")
        img.image(
          :src="image"
          :key="index"
          v-if="visibleImage === index"
          v-for="(image, index) in itemImages"
        )
      a.control-next(
        @click="next()"
        :class="{ 'is-nonactive': isLastImage() }"
      )
        span.arrow-icon >
    .dots
      .dot(
        v-for="(image, index) in itemImages"
        :class="{'is-visible' : visibleImage === index}"
      )
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
  data() {
    return {
      isActive: this.isModalActive,
      images: this.itemImages,
      visibleImage: 0,
      transitionName: 'next-image'
    }
  },
  methods: {
    isNowOnSale() {
      return this.item.trading_status === 'now_on_sale'
    },
    toggleIsModalActive() {
      this.isActive = !this.isActive
      this.$emit('toggle')
    },
    editItemPath() {
      return '/items/' + this.item.id + '/edit'
    },
    destroyItemPath() {
      if (this.isConfirm) {
        return '/items/' + this.item.id
      } else {
        return ''
      }
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
    back() {
      if (this.isFirstImage()) {
        return
      } else {
        this.transitionName = 'prev-image'
        this.visibleImage--
      }
    },
    next() {
      if (this.isLastImage()) {
        return
      } else {
        this.transitionName = 'next-image'
        this.visibleImage++
      }
    },
    isFirstImage() {
      return this.visibleImage === 0
    },
    isLastImage() {
      return this.visibleImage === this.itemImages.length - 1
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
    },
    isModalActive: {
      type: Boolean,
      required: true
    },
    itemImages: {
      type: Array,
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
.carousel {
  height: 300px;
  width: 500px;
  overflow: hidden;
  position: relative;
  background-color: lightgray;
  margin: 0 auto;

  .image {
    margin: 0 auto;
    height: 300px;
  }

  .control-prev {
    position: absolute;
    top: 0;
    bottom: 0;
    left: 0;
    display: flex;
    align-items: center;
    justify-content: center;
    width: 15%;
    color: white;
    z-index: 2;
  }

  .control-next {
    position: absolute;
    top: 0;
    bottom: 0;
    right: 0;
    display: flex;
    align-items: center;
    justify-content: center;
    width: 15%;
    color: white;
    z-index: 2;
  }

  .is-nonactive {
    opacity: 0.5;
  }

  .arrow-icon {
    font-size: 2.5rem;
    -webkit-text-stroke: 1px black;
  }
}
.dots {
  height: 50px;
  width: 30%;
  display: flex;
  justify-content: space-between;
  align-items: center;
  align-items: center;
  margin: 0 auto;

  .dot {
    background-color: lightgray;
    border-radius: 50%;
    height: 6px;
    width: 6px;
  }

  .is-visible {
    background-color: #7490fd;
  }
}
.next-image-enter-active,
.next-image-leave-active,
.prev-image-enter-active,
.prev-image-leave-active {
  transition: all 0.4s ease;
}
.next-image-enter,
.prev-image-leave-to {
  transform: translateX(100%);
}
.next-image-leave-to,
.prev-image-enter {
  transform: translateX(-100%);
}
</style>
