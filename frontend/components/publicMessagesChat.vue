<template lang="pug">
#public-messages-chat
  .chat-section
    .chat-content
      .chat-background
      .note
        p 購入前に商品の状態を出品者に聞くことができます。相手のことを考え丁寧なコメントを心がけましょう。
      form(
        action="/items"
        accept-charset="UTF-8"
        method="post"
      )
        input(
          name="utf8"
          type="hidden"
          value="✓"
        )
        input(
          name="authenticity_token"
          type="hidden"
          value="csrf_token"
        )
        .field
          textarea.textarea.is-primary.chat-textarea(
            name="trading_message[content]"
            autocomplete="off"
            rows="4"
            )
        input(
          type="hidden"
          name="trading_message[buyer_id]"
        )
        input(
          type="hidden"
          name="trading_message[seller_id]"
        )
        input(
          type="hidden"
          name="trading_message[item_id]"
        )
        input.none(
          type="number"
          name="trading_message[open_range]"
          value="0"
        )
        button.button.is-info.submit(
          type="submit"
          data-disable-with="送信中..."
          @click="onSubmit()"
        ) コメントする
</template>

<script>
import axios from 'axios'

export default {
  method: {
    onSubmit: () => {
      axios.post('/items', {})
    }
  }
}
</script>

<style lang="scss">
.chat-background {
  background-color: aquamarine;
  opacity: 0.2;
  width: 100%;
  margin: 1rem 0;
  min-height: 10rem;
}
.chat-section {
  background-color: white;
  margin-top: 1rem;
}
.chat-content {
  margin: 0rem 3rem;
  padding: 2rem 0rem;
}
.chat-textarea {
  width: 100%;
}
.note {
  background-color: rgba(255, 255, 110, 0.4);
  width: 100%;
  margin: 1rem 0 0.5rem;
  padding: 0.5rem 0;

  p {
    color: black;
    font-size: 0.8rem;
  }
}
.submit {
  display: block;
  margin: 0 auto;
}
</style>
