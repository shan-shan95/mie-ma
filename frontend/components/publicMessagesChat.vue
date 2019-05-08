<template lang="pug">
#public-messages-chat
  .chat-section
    .chat-content
      .chat-background
        .message-column.is-clearfix(v-for="(publicMessage, index) in publicMessages")
          .user-info.is-pulled-left
            .user-name
              p {{ userNickName() }}さん
          .message.is-pulled-left
            p(:key="index") {{ publicMessage.content }}
            .send-time
              small {{ postedDateOrTime(publicMessage) }}
      .note
        p 購入前に商品の状態を出品者に聞くことができます。相手のことを考え丁寧なコメントを心がけましょう。
      form
        textarea.textarea.is-primary.chat-textarea(
          v-model="postMessage.content"
          autocomplete="off"
          rows="4"
        )
        .notification.is-danger(
          v-if="checkMessageLength()"
        ) {{ checkMessageLength() }}
        button.button.is-info.submit(
          @click.prevent="postPublicMessage()"
          v-if="!checkMessageLength()"
        ) コメントする
        button.button.is-info.submit.disabled(
          v-else
          disabled
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
      postMessage: this.message
    }
  },
  methods: {
    postPublicMessage() {
      this.postMessage.sender_id = this.userId
      this.postMessage.item_id = this.item.id
      if (this.postMessage.content) {
        axios
          .post('/public_messages', {
            public_message: this.postMessage
          })
          .then(res => {
            this.postMessage.content = null
            this.$emit('postSuccess')
          })
          .catch(err => {})
      }
    },
    checkMessageLength() {
      if (
        this.postMessage.content !== null &&
        this.postMessage.content.length > 255
      ) {
        return '文字数が多すぎます'
      } else {
        return ''
      }
    },
    userNickName() {
      if (this.userName) {
        return this.userName
      } else {
        return '名無し'
      }
    },
    postedDateOrTime(message) {
      let diff = new Date(
        new Date().getTime() - new Date(message.created_at).getTime()
      )
      if (diff.getUTCFullYear() - 1970) {
        return diff.getUTCFullYear() - 1970 + '年前'
      } else if (diff.getUTCMonth()) {
        return diff.getUTCMonth() + 'ヶ月前'
      } else if (diff.getUTCDate() - 1) {
        return diff.getUTCDate() - 1 + '日前'
      } else if (diff.getUTCHours()) {
        return diff.getUTCHours() + '時間前'
      } else if (diff.getUTCMinutes()) {
        return diff.getUTCMinutes() + '分前'
      } else {
        return 'たった今'
      }
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
      required: false
    },
    userName: {
      type: String,
      required: false
    },
    publicMessages: {
      type: Array,
      required: false
    }
  }
}
</script>

<style lang="scss">
.chat-background {
  background-color: rgba(120, 255, 200, 0.3);
  width: 100%;

  .message-column {
    margin: 0.5rem 0;
    padding: 0.5rem 0;

    .message {
      background-color: transparent;
      display: inline-block;
      position: relative;
      margin: 0 0 0 4rem;
      padding: 10px;
      border-radius: 12px;
      background: #eff0f4;
      border: 1px solid #9c9c9c;
      max-width: 75%;
      min-width: 40%;
      word-wrap: break-word;
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
.disabled {
  pointer-events: none;
}
.user-info {
  padding: 10px;
}
</style>
