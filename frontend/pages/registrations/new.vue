<template lang="pug">
#new
  h2 新規登録
  form#new_user.new_user(
    action="/users"
    accept-charset="UTF-8"
    method="post"
  )
    input(
      name="utf8"
      type="hidden"
      value="✓"
    )
    input(
      type="hidden"
      name="authenticity_token"
      value="csrf_token"
    )
    .field
      label(for="user_nickname") ニックネーム
      br
      input#user_nickname.user_nickname(
        autofocus="autofocus"
        autocomplete="nickname"
        type="text"
        name="user[nickname]"
      )
    .field
      label(for="user_email") メールアドレス
      br
      input#user_email(
        autocomplete="email"
        type="email"
        name="user[email]"
      )
    .field
      label(for="user_password") パスワード
      br
      small 最低6文字
      br
      input#user_password(
        autocomplete="new-password"
        type="password"
        name="user[password]"
      )
    .field
      label(for="user_password_confirmation") 確認用パスワード
      br
      input#user_password_confirmation(
        type="password"
        name="user[password_confirmation]"
      )
    .field
      input(
        type="submit"
        name="commit"
        value="アカウント登録"
        data-disable-with="アカウント登録"
      )
  a(href="/users/sign_in") ログイン
  br
  a(href="/users/confirmation/new") アカウント認証のメールは届きましたか？
  br
</template>

<style lang="scss">
</style>

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
