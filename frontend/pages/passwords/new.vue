<template lang="pug">
#new
  h2 パスワードを忘れましたか？
  form#new_user.new_user(
    action="/users/password"
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
    .actions
      input(
        type="submit"
        name="commit"
        value="送信する"
        data-disable-with="送信中"
      )
  a(href="/users/sign_in") ログイン
  br
  a(href="/users/sign_up") 新規登録
  br
  a(href="/users/confirmation/new") アカウント認証のメールは届きましたか？
  br
</template>

<script>
</script>

<style lang="scss" scoped>
</style>
