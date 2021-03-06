<template lang="pug">
.form
  form(
    :action="actionPath"
    accept-charset="UTF-8"
    method="post"
    enctype="multipart/form-data"
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
      :value="csrfToken()"
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
        label.label(for="item_images") 商品画像
      .field-body
        .field-block
          .field-body.columns.is-mobile.is-multiline
            template(v-if="item.images_url > 0")
              .images.column.is-6-mobile.is-3-tablet(
                v-for="url in item.images_url"
              )
                img.image(
                  :src="url"
                  decoding="async"
                )
            template(v-if="sumbnailUrls.length > 0")
              .selectedfiles.column.is-6-mobile.is-3-tablet(
                v-for="url in sumbnailUrls"
              )
                img.image(
                  :src="url"
                  decoding="async"
                )
            template(v-if="dummyNum() > 0")
              .dummies.column.is-6-mobile.is-3-tablet(
                v-for="num in dummyNum()"
              )
                .dummy
          .field-body
            input.input#item_images(
              type="file"
              name="item[images][]"
              accept="image/*"
              multiple
              @change="onFileChange"
              v-show="canUpload()"
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
      item: this.formItem,
      sumbnailUrls: [],
      errorMessage: ''
    }
  },
  methods: {
    dummyNum() {
      if (this.item.images_url) {
        return 4 - this.item.images_url.length - this.sumbnailUrls.length
      } else {
        return 4 - this.sumbnailUrls.length
      }
    },
    onFileChange(e) {
      this.sumbnailUrls = []

      if (!e.target) {
        this.errorMessage = ''
        return
      }

      let filesNum = e.target.files.length || e.dataTransfer.files.length
      if (filesNum > this.dummyNum()) {
        this.errorMessage = '選択した画像が多すぎます'
        return
      } else {
        this.errorMessage = ''
      }

      let files = e.target.files
      for (let i = 0, file; (file = files[i]); i++) {
        let reader = new FileReader()
        reader.readAsDataURL(file)
        reader.onload = e => {
          this.sumbnailUrls.push(e.target.result)
        }
      }
    },
    canUpload() {
      if (this.item.images_url) {
        return this.item.images_url.length < 4
      } else {
        return true
      }
    },
    csrfToken() {
      return document.getElementsByName('csrf-token').item(0).content
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
@import '../init/_responsive';

.form {
  margin: 2rem 5rem;
  @include sp {
    margin: 1rem 2rem;
  }
}

.dummy {
  background-color: lightgray;
  margin: 12px;
}

.image,
.dummy {
  @include pc {
    width: 128px;
    height: 128px;
  }
  @include tab {
    width: 128px;
    height: 128px;
  }
  @include sp {
    width: 64px;
    height: 64px;
  }
}

.field-block {
  display: block;
}
</style>
