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
              .columns.is-multiline
                .column.is-3(
                  v-for="item in items"
                )
                  a(:href="itemShowPath(item)")
                    img.image.is-128x128.image-box(:src="item.sumbnail_url")
      SideBar
    a.sell-button(href="/items/new")
      div 出品
      i.fa.fa-camera
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
      items: gon.items
    }
  },
  methods: {
    itemShowPath(item) {
      return '/items/' + item.id
    }
  }
}
</script>

<style lang="scss">
.hero-body {
  padding: 1.5rem 1.5rem;
}
.items {
  padding: 1rem;
}
.sell-button {
  bottom: 3rem;
  right: 3rem;
  width: 7rem;
  height: 7rem;
  font-size: 22px;
  position: fixed;
  z-index: 1002;
  border-radius: 50%;
  background: #25b425;
  color: white;
  text-align: center;

  div {
    position: relative;
    top: 1rem;
    font-size: 1.5rem;
  }

  i {
    position: relative;
    top: 1.5rem;
    font-size: 2rem;
  }
}
.image-box {
  box-shadow: 2px 2px 4px gray;
}
</style>
