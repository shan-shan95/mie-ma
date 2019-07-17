<template lang="pug">
#purchase-guide
  Header
  main.columns
    article.hero.column.is-two-third
      .hero-body
        h1.title.is-3 購入ガイド
        hr
        .step
          h2.title.is-5 1. 気になる商品を見る
          p TOPページから気になる商品を探してクリックしましょう。
          | 商品詳細ページが表示されます。
          .image
            img(src="https://d16vmihj9x3vj.cloudfront.net/assets/images/purchase_guide/guide_1.png")
        .step
          h2.title.is-5 2. 商品に関する質問をする
          p 商品について質問があれば、出品者に聞くことができます。
          | 商品詳細ページ下部のチャット欄でメッセージを送ってみましょう。
          .image
            img(src="https://d16vmihj9x3vj.cloudfront.net/assets/images/purchase_guide/guide_2.png")
        .step
          h2.title.is-5 3. 商品を購入する
          p 商品詳細ページの「購入する」ボタンをクリックして商品を購入します。
          | 購入すると商品詳細ページが、出品者・購入者のみ商品取引ページに変わります。
          .image
            img(src="https://d16vmihj9x3vj.cloudfront.net/assets/images/purchase_guide/guide_3.png")
        .step
          h2.title.is-5 4. 確認メールが送られる
          p 購入すると確認のメールが送られます。
          | メール内のリンクをクリックすると商品取引ページが表示されます。
          | 商品取引ページはTOPページのサムネイルをクリックすることでも表示できます。
          .image
            img(src="https://d16vmihj9x3vj.cloudfront.net/assets/images/purchase_guide/guide_4.png")
        .step
          h2.title.is-5 5. チャットで時間と場所を決める
          p 商品取引ページでは出品者と購入者のみがやりとりをできます。
          | 他の人からは見えないので安心してチャットをできます。
          | 商品とお金を交換する時間と場所を決めましょう。
          .image
            img(src="https://d16vmihj9x3vj.cloudfront.net/assets/images/purchase_guide/guide_5.png")
        .step
          h2.title.is-5 6. 商品とお金を交換する
          p 決めた場所で商品とお金を交換しましょう。
        .step
          h2.title.is-5 7. 取引相手を評価する
          p 商品取引ページの「取引完了」ボタンを押して相手の評価をしましょう。
          | これで取引が完了です。
          | お疲れ様でした。
          .image
            img(src="https://d16vmihj9x3vj.cloudfront.net/assets/images/purchase_guide/guide_6.png")
          .image
            img(src="https://d16vmihj9x3vj.cloudfront.net/assets/images/purchase_guide/guide_7.png")
    SideBar
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
