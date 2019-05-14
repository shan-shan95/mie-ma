<template lang="pug">
.hero
  .hero-body
    h3 メニュー
    hr
    a.menu-item(
      href="/users/mypage"
    ) マイページトップ
    a.menu-item DM
    a.menu-item 評価
    a.menu-item 出品中商品
    a.menu-item 取引中商品
    a.menu-item 購入済み商品
</template>

<script>
export default {}
</script>

<style lang="scss" scoped>
.hero-body {
  padding: 3rem 0.5rem;
}
.menu-item {
  display: block;
  margin-bottom: 0.3rem;
}
</style>
