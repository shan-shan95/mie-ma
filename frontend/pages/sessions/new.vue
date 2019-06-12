<template lang="pug">
#new
  h2 ログイン
  form#new_user.new_user(
    action="/users/sign_in"
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
      label(for="user_email") メールアドレス
      br
      input#user_email(
        autofocus="autofocus"
        autocomplete="email"
        type="email"
        name="user[email]"
      )
    .field
      label(for="user_password") パスワード
      br
      input#user_password(
        autocomplete="current-password"
        type="password"
        name="user[password]"
      )
    .field
      input(
        name="user[remember_me]"
        type="hidden"
        value="0"
      )
      input#user_remember_me(
        type="checkbox"
        value="1"
        name="user[remember_me]"
      )
      label(for="user_remember_me") 次回から自動的にログイン
    .actions
      input(
        type="submit"
        name="commit"
        value="ログイン"
        data-disable-with="送信中"
      )
  a(href="/users/sign_up") 新規登録
  br
  a(href="/users/password/new") パスワードを忘れましたか？
  br
  a(href="/users/confirmation/new") アカウント認証のメールは届きましたか？
  br
</template>

<style lang="scss">
</style>

<script>
</script>
