<template lang="pug">
#private-messages-chat
  .message-section
    .message-content
      .message-background
        .message-column.is-clearfix(
          v-for="(privateMessage, index) in privateMessages"
          :key="index"
        )
          .user-info.is-pulled-left
            .profile
              img.profile__img.is-rounded(
                src="https://d16vmihj9x3vj.cloudfront.net/assets/images/profile/dummy-profile.png"
                alt="プロフィール画像"
              )
            .user-name
              p {{ privateMessage.sender.nickname }}さん
          .message.is-pulled-left(:class="messageBackColor(privateMessage)")
            pre(:key="index") {{ privateMessage.content }}
            .send-time
              small {{ postedDateOrTime(privateMessage) }}
      .note
        p 商品の受け渡しをする場所と日時を決めましょう。相手のことを考え丁寧なコメントを心がけましょう。
        p 取引後は速やかに評価をしてください。
      form
        textarea.textarea.is-primary.message-textarea(
          v-model="postMessage.content"
          autocomplete="off"
          rows="4"
        )
        .notification.is-danger(
          v-if="checkMessageLength()"
        ) {{ checkMessageLength() }}
        button.button.is-info.submit(
          @click.prevent="postPrivateMessage()"
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
    postPrivateMessage() {
      this.postMessage.sender_id = this.currentUserId
      if (this.currentUserId === this.item.seller_id) {
        this.postMessage.recepient_id = this.item.buyer_id
      } else if (this.currentUserId === this.item.buyer_id) {
        this.postMessage.recepient_id = this.item.seller_id
      }
      this.postMessage.item_id = this.item.id
      if (this.postMessage.content) {
        axios
          .post('/private_messages', {
            private_message: this.postMessage,
            item: this.item
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
    },
    messageBackColor(message) {
      return message.sender_id === this.currentUserId ? 'principal' : 'others'
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
    currentUserId: {
      type: String,
      required: true
    },
    currentUserName: {
      type: String,
      required: true
    },
    privateMessages: {
      type: Array,
      required: false
    }
  }
}
</script>

<style lang="scss">
@import '../init/_responsive';

.message-section {
  background-color: white;
  margin-bottom: 1rem;

  .message-content {
    margin: 0rem 3rem;
    padding: 2rem 0rem;
    @include sp {
      margin: 0 1.5rem;
      padding: 1rem 0;
    }

    .message-background {
      background-color: rgba(120, 255, 200, 0.3);
      width: 100%;
      border-radius: 5px;

      .message-column {
        margin: 0.5rem auto;
        padding: 0.5rem 0;

        .user-info {
          padding-top: 1rem;
          padding-bottom: 0.5rem;

          .profile {
            max-width: 48px;
            max-height: 48px;
            margin: 0 1rem;

            &__img {
              border-radius: 50px;
            }
          }
        }

        .message {
          background-color: transparent;
          display: inline-block;
          margin: 0.5rem 1.5rem;
          padding: 1rem;
          border-radius: 12px;
          @include sp {
            display: block;
          }
          @include tab {
            max-width: 75%;
            min-width: 40%;
          }
          @include pc {
            max-width: 75%;
            min-width: 40%;
          }
        }

        .principal {
          background: #def5de;
          border: 1px solid #62c970;

          pre {
            background-color: #def5de;
          }
        }

        .others {
          background: #eff0f4;
          border: 1px solid #9c9c9c;

          pre {
            background-color: #eff0f4;
          }
        }
      }
    }

    .note {
      background-color: rgba(255, 255, 110, 0.4);
      width: 100%;
      margin: 0.5rem 0;
      padding: 0.5rem;

      p {
        color: black;
        font-size: 0.8rem;
      }
    }

    .message-textarea {
      width: 100%;
      margin: 0.5rem 0;
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
  }
}
</style>
