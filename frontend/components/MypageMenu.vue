<template lang="pug">
.hero
  .hero-body
    h3 メニュー
    hr
    a.menu-item(href="/mypage/profile") プロフィール
    a.menu-item DM
    a.menu-item(href="/mypage/evaluation_comments") 評価
    a.menu-item(href="/mypage/sell_items") 出品した商品
    a.menu-item(href="/mypage/buy_items") 購入した商品
</template>

<script>
export default {}
</script>

<style lang="scss" scoped>
.hero-body {
  padding: 3rem 0;
}
.menu-item {
  display: block;
  margin-bottom: 0.3rem;
  color: #4a4a4a;
}
</style>
