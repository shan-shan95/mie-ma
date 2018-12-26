<template>
  <div id="app">
    <p>{{ message }}</p>
  </div>
</template>

<script>
export default {
  data() {
    return {
      message: 'Hello Vue!'
    }
  }
}
</script>

<style lang="scss" scoped>
p {
  font-size: 2em;
  text-align: center;
  background-color: aquamarine;
}
</style>
