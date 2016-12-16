<template>
  <div class="main">
    <card></card>
  </div>
</template>

<script>
import Card from './Card.vue'
export default {
  name: 'app',
  components: {
    Card
  }
}
</script>

<style lang='scss'>
@import '../../scss/variliables.scss';
.main {
  position: relative;
  height:100%;
}
</style>
