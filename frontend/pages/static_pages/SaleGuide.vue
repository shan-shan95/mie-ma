<template lang="pug">
#sale-guide
  Header
  main.columns
    article.hero.column.is-two-third
      .hero-body
        h1.title.is-3 出品ガイド
        hr
        .step
          h2.title.is-5 1. 出品ボタンをクリック
          p TOPページの右下にある出品ボタンをクリックしてください。
          .image
            img(src="https://d16vmihj9x3vj.cloudfront.net/assets/images/sale_guide/guide_1.png")
        .step
          h2.title.is-5 2. 商品の情報を入力
          p 名称、画像、説明、状態、値段を入力してください。
          | 画像は4枚まで選択できます。
          .image
            img(src="https://d16vmihj9x3vj.cloudfront.net/assets/images/sale_guide/guide_2.png")
        .step
          h2.title.is-5 3. 出品完了
          p TOPページに商品が追加されます。
          | サムネイルをクリックすると商品詳細ページが表示されます。
          .image
            img(src="https://d16vmihj9x3vj.cloudfront.net/assets/images/sale_guide/guide_3.png")
        .step
          h2.title.is-5 4. 購入希望者とやり取りが可能
          p 商品詳細ページで購入を希望している人から質問が来ることがあります。
          | 丁寧に答えましょう。
          .image
            img(src="https://d16vmihj9x3vj.cloudfront.net/assets/images/sale_guide/guide_4.png")
        .step
          h2.title.is-5 5. 購入をメールで確認
          p 商品が購入されるとメールが届きます。
          | メール内のリンクをクリックして商品取引ページに進みましょう。
          | 商品詳細ページが、出品者・購入者のみ商品取引ページに変わります。
          | TOPページのサムネイルをクリックすることでも表示できます。
          .image
            img(src="https://d16vmihj9x3vj.cloudfront.net/assets/images/sale_guide/guide_5.png")
        .step
          h2.title.is-5 6. チャットで時間と場所を決める
          p 商品取引ページでは出品者と購入者のみがやりとりをできます。
          | 他の人からは見えないので安心してチャットをできます。
          | 商品とお金を交換する時間と場所を決めましょう。
          .image
            img(src="https://d16vmihj9x3vj.cloudfront.net/assets/images/sale_guide/guide_6.png")
        .step
          h2.title.is-5 7. 商品とお金を交換する
          p 決めた場所で商品とお金を交換しましょう。
        .step
          h2.title.is-5 8. 取引相手を評価する
          p 商品取引ページの「取引完了」ボタンを押して相手の評価をしましょう。
          | これで取引が完了です。
          | お疲れ様でした。
          .image
            img(src="https://d16vmihj9x3vj.cloudfront.net/assets/images/sale_guide/guide_7.png")
          .image
            img(src="https://d16vmihj9x3vj.cloudfront.net/assets/images/sale_guide/guide_8.png")
  Footer
</template>

<script>
import Header from '../../components/AppHeader'
import Footer from '../../components/AppFooter'

export default {
  components: {
    Header,
    Footer
  }
}
</script>

<style lang="scss" scoped>
.hero-body {
  .step {
    margin-bottom: 2rem;

    .image {
      max-width: 640px;
      border: 1px solid #9c9c9c;
      margin: 1rem 0;
    }
  }
}
</style>
