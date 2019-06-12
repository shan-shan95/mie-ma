<template lang="pug">
#edit
  h2 ユーザー情報の変更
  form#edit_user.edit_user(
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
    input(
      type="hidden"
      name="_method"
      value="put"
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
      label(for="user_password") 新しいパスワード
      br
      small (変更したくない場合は空白のままにしてください)
      br
      input#user_password(
        autofocus="new-password"
        type="password"
        name="user[password]"
      )
      br
      em 最低6文字以上
    .field
      label(for="user_password_confirmation") もう一度入力してください
      br
      input#user_password_confirmation(
        autocomplete="new-password"
        type="password"
        name="user[password_confirmation]"
      )
    .field
      label(for="user_current_password") 現在のパスワード
      br
      small 変更を確認するために現在のパスワードが必要です
      br
      input#user_current_password(
        autocomplete="current-password"
        type="password"
        name="user[current_password]"
      )
    .field
      label(for="user_profile") プロフィール
      br
      textarea#user_profile(name="user[profile]")
    .actions
      input(
        type="submit"
        name="commit"
        value="Update"
        data-disable-with="Update"
      )
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
