<template lang="pug">
.form
  form(
    :action="actionPath"
    accept-charset="UTF-8"
    method="post"
  )
    input(
      name="utf8"
      type="hidden"
      value="✓"
    )
    input(
      name="_method"
      type="hidden"
      :value="httpMethod"
    )
    input(
      name="authenticity_token"
      type="hidden"
      value="csrf_token"
    )
    .field.is-horizontal
      .field-label.is-normal
        label.label(for="item_name") 名称
      .field-body
        input.input#item_name(
          autofocus="autofocus"
          autocomplete="off"
          type="text"
          name="item[name]"
          v-model="item.name"
        )
    .field.is-horizontal
      .field-label.is-normal
        label.label(for="item_description") 説明
      .field-body
        .field
          .control
            textarea.textarea#item_description(
              name="item[description]"
              autocomplete="off"
              v-model="item.description"
            )
    .field.is-horizontal
      .field-label.is-normal
        label.label(for="item_status") 状態
      .field-body
        .field.is-narrow
          .control
            .select
              select#item_status(
                name="item[status]"
                v-model="item.status"
              )
                option(value="null" disabled) 選択して下さい
                option(value="brand_new") 新品
                option(value="excellent") 良品
                option(value="poor") 傷あり
                option(value="junk") ジャンク品
    .field.is-horizontal
      .field-label.is-normal
        label.label(for="item_price") 値段
      .field-body
        .field.is-narrow
          .control
            input.input(
              autocomplete="off"
              type="number"
              name="item[price]"
              v-model="item.price"
            )
    input(
      type="hidden",
      name="item[seller_id]"
      v-model="item.seller_id"
    )
    .field.is-horizontal
      .field-label
      .field-body
        .field
          .control
            button.button.is-info.submit(
              type="submit"
            ) 送信
</template>

<script>
export default {
  data() {
    return {
      item: this.formItem
    }
  },
  props: {
    formItem: {
      type: Object,
      required: true
    },
    actionPath: {
      type: String,
      required: true
    },
    httpMethod: {
      type: String,
      required: true
    }
  }
}
</script>

<style lang="scss" scoped>
.form {
  margin: 2rem 5rem;
}
</style>
