<template lang="pug">
#edit
  h2 パスワードを変更する
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
      name="_method"
      value="put"
    )
    input(
      type="hidden"
      name="authenticity_token"
      value="csrf_token"
    )
    input#user_reset_password_token(
      type="hidden"
      :value="reset_password_token"
      name="user[reset_password_token]"
    )
    .field
      label(for="user_password") 新しいパスワード
      br
      small 最低6文字
      br
      input#user_password(
        autofocus="autofocus"
        autocomplete="new-password"
        type="password"
        name="user[password]"
      )
    .field
      label(for="user_password_confirmation") 新しいパスワード(再入力)
      br
      input#user_password_confirmation(
        autocomplete="off"
        type="password"
        name="user[password_confirmation]"
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
  a(href="/users/confirmation/new") アカウント認証のメールは届きましたか？
  br
</template>

<script>
export default {
  data() {
    return {
      reset_password_token: gon.reset_password_token
    }
  }
}
</script>

<style lang="scss" scoped>
</style>
