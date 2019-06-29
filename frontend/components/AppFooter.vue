<template lang="pug">
footer.footer
  .content
    //- a 出品ガイド
    //- br
    //- a 購入ガイド
    //- br
    a(
      href="/contact"
    ) お問い合わせ
    br
    a(
      href="/privacy_policy"
    ) プライバシーポリシー
    br
    a(
      href="/terms_of_service"
    ) 利用規約
</template>

<script>
</script>

<style lang="scss" scoped>
@import '../init/_responsive';

footer {
  background-color: #777777;
}
.footer {
  padding: 1.5rem 5rem;
  @include sp {
    padding: 1rem 2rem;
  }

  a {
    color: #f9f9f9;
  }
}
</style>
