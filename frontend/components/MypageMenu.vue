<template lang="pug">
.hero
  .hero-body
    h3 メニュー
    hr
    a.menu-item.link-button(href="/mypage/profile") プロフィール
    a.menu-item.link-button DM
    a.menu-item.link-button(href="/mypage/evaluation_comments") 評価
    a.menu-item.link-button(href="/mypage/sell_items") 出品した商品
    a.menu-item.link-button(href="/mypage/buy_items") 購入した商品
</template>

<script>
export default {}
</script>

<style lang="scss" scoped>
.hero-body {
  padding: 3rem 0;

  .menu-item {
    margin-bottom: 0.2rem;
  }

  .link-button {
    display: block;
    color: #4a4a4a;
    padding: 0.5rem 0;
    border: solid thin gray;
    border-radius: 3px;
    background-color: white;
    text-align: center;
    box-shadow: 1px 1px 2px gray;
  }
}
</style>
