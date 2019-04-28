<template lang="pug">
#public-messages-chat
  .chat-section
    .chat-content
      .chat-background
        .message-box(v-for="trading_message in trading_messages")
          .message
            p {{ trading_message.content }}
      .note
        p 購入前に商品の状態を出品者に聞くことができます。相手のことを考え丁寧なコメントを心がけましょう。
      form
        textarea.textarea.is-primary.chat-textarea(
          v-model="postMessage.content"
          autocomplete="off"
          rows="4"
          )
        button.button.is-info.submit(
          @click.prevent="onSubmit(postMessage, item, userId)"
        ) コメントする
</template>

<script>
import axios from 'axios'
axios.defaults.headers.common = {
  'X-Requested-With': 'XMLHttpRequest',
  'X-CSRF-TOKEN': document
    .querySelector('meta[name="csrf-token"]')
    .getAttribute('content')
}

export default {
  data() {
    return {
      postMessage: this.message,
      errorMessage: ''
    }
  },
  methods: {
    onSubmit: (postMessage, item, userId) => {
      postMessage.buyer_id = item.buyer_id
      postMessage.seller_id = userId
      postMessage.item_id = item.id
      postMessage.open_range = 0
      axios.post('/trading_messages', {
        trading_message: postMessage
      })
    }
  },
  props: {
    message: {
      type: Object,
      required: true
    },
    item: {
      type: Object,
      required: true
    },
    userId: {
      type: String,
      required: true
    },
    trading_messages: {
      type: Array,
      required: true
    }
  }
}
</script>

<style lang="scss">
.chat-background {
  background-color: rgba(120, 255, 200, 0.35);
  width: 100%;
  margin: 1rem 0;
  padding: 0.5rem 0;

  .message-box {
    margin: 0.5rem 0;

    .message {
      background-color: transparent;
      display: inline-block;
      position: relative;
      margin: 0 0 0 1rem;
      padding: 10px;
      max-width: 250px;
      border-radius: 12px;
      background: #eff0f4;
    }
  }
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
  margin: 0.5rem 0;
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
