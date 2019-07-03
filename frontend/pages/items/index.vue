<template lang="pug">
#index
  Header
  main
    .columns
      article.column.is-8
        .hero
          .hero-body
            h1.title.is-3 新着アイテム
            hr
            .items
              .columns.is-multiline.is-mobile
                .column.is-3-desktop.is-3-tablet.is-6-mobile(
                  v-for="(item, index) in sliceItems()"
                  :key="index"
                )
                  a(
                    :href="itemShowPath(item)"
                  )
                    img.image.is-128x128.image-box(
                      :src="item.sumbnail_url"
                      decoding="async"
                    )
            .is-centered
              paginate(
                :page-count="pagenationNumber()"
                v-model="currentPage"
                container-class="pagination-list"
                page-class="pagination-link"
                next-class="pagination-link"
                prev-class="pagination-link"
                active-class="is-current"
              )
      SideBar
    a.sell-button(href="/items/new")
      div.sell-button__content 出品
      i.fa.fa-camera.sell-button__icon
  Footer
</template>

<script>
import Header from '../../components/AppHeader'
import Footer from '../../components/AppFooter'
import SideBar from '../../components/AppSidebar'

export default {
  components: {
    Header,
    Footer,
    SideBar
  },
  data() {
    return {
      items: gon.items,
      currentPage: 1
    }
  },
  methods: {
    itemShowPath(item) {
      return '/items/' + item.id
    },
    pagenationNumber() {
      return this.items.length / 20
    },
    sliceItems() {
      let start = (this.currentPage - 1) * 20
      let end = this.currentPage * 20
      if (this.items.length / 20 + 1 === this.currentPage) {
        let end = start + (this.items.length % 20)
      }
      return this.items.slice(start, end)
    }
  }
}
</script>

<style lang="scss">
@import '../../init/_responsive';

.hero-body {
  padding: 1.5rem;
  @include sp {
    padding: 1rem;
  }

  .items {
    padding: 1rem;

    .image-box {
      box-shadow: 2px 2px 4px gray;
    }
  }

  .pagination-list {
    display: block;
    margin: 0 auto;

    .is-current a {
      color: white;
    }
  }
}

.sell-button {
  @include pc {
    bottom: 3rem;
    right: 3rem;
    width: 7rem;
    height: 7rem;
  }
  @include sp {
    bottom: 0;
    right: 0;
    width: 96px;
    height: 96px;
    line-height: 1;
  }
  @include tab {
    bottom: 0;
    right: 0;
    width: 128px;
    height: 128px;
  }
  position: fixed;
  z-index: 1002;
  border-radius: 50%;
  background: #25b425;
  color: white;
  text-align: center;

  &__content {
    position: relative;
    top: 1rem;
    font-size: 1.2rem;
  }

  &__icon {
    position: relative;
    top: 2rem;
    font-size: 1.5rem;
  }
}
</style>
