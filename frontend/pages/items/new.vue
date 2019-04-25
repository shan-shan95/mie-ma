<template lang="pug">
#new
  Header
  main
    form(
      action="/items",
      accept-charset="UTF-8",
      method="post"
    )
      input(
        name="utf8",
        type="hidden",
        value="✓"
      )
      input(
        name="authenticity_token",
        type="hidden",
        value="csrf_token"
      )
      .field
        label(for="item_name") 名称
        br
        input#item_name(
          autofocus="autofocus",
          autocomplete="off",
          type="text",
          name="item[name]",
          v-model="this.item.name"
        )
      .field
        label(for="item_description") 説明
        br
        textarea#item_description(
          name="item[description]",
          autocomplete="off",
          cols="24",
          rows="12",
          v-model="this.item.description"
        )
      .field
        label(for="item_status") 状態
        br
        select#item_status(
          name="item[status]",
          v-model="this.item.status"
        )
          option(value="0") 新品
          option(value="1") 良品
          option(value="2") 傷あり
          option(value="3") ジャンク品
      .field
        label(for="item_price") 値段
        br
        input(
          autocomplete="off",
          type="number",
          name="item[price]",
          v-model="this.item.price"
        )
      input#item_seller_id(
        type="hidden",
        name="item[seller_id]",
        v-model="this.item.seller_id"
      )
      .submit
        button(
          type="submit",
          data-disable-with="送信中...",
          @click="onSubmit()"
        ) 投稿
  Footer
</template>

<style lang="scss">
</style>

<script>
import axios from 'axios'
import Header from '../../components/header'
import Footer from '../../components/footer'

export default {
  components: {
    Header,
    Footer
  },
  data() {
    return {
      item: gon.item
    }
  },
  method: {
    onSubmit: () => {
      axios.post('/items', {
        params: this.item
      })
    }
  }
}
</script>
