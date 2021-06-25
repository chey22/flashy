<template>
  <!-- <div id="app">
    <p>{{ message }}</p>
  </div> -->
  <div id='flashy'>
    {{message}}
    <app></app>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      message: "Hello Vue!"
    }
    console.log(message)
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
