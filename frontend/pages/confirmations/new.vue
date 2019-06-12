<template lang="pug">
#new
  h2 認証メールの再送信
  form#new_user.new_user(
    action="/users/confirmation"
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
        value="送信"
        data-disable-with="送信中"
      )
  a(href="/users/sign_in") ログイン
  br
  a(href="/users/sign_up") 新規登録
  br
  a(href="/users/password/new") パスワードを忘れましたか？
  br
</template>

<script>
</script>

<style lang="scss" scoped>
</style>
