<template lang="html">
  <div class="menu-wrap">
    <dl class="menu">
      <dt class="menu-title">咨询管理</dt>
      <dd class="menu-item"><router-link :to="{path: '/speed'}">快速咨询名单</router-link></dd>
      <dd class="menu-item"><router-link :to="{path: '/meet'}">预约咨询名单</router-link></dd>
    </dl>
  </div>
</template>

<script>
export default {
  data () {
    return {
    }
  },
  mounted () {},
  methods: {}
}
</script>

<style lang="scss" scoped>
@import "../../scss/_variliables.scss";
.menu-wrap{
  padding-right:20px;
}
.menu{
  .menu-title{
    height: 40px;
    line-height: 40px;
    color:#999;
  }
  .menu-item{
    position: relative;
    padding-left: 25px;
    height: 40px;
    line-height: 40px;
    &.new:after{
      position: absolute;
      content: " ";
      top:17px;
      right:3px;
      height:6px;
      width:6px;
      border-radius: 50%;
      background-color:$main-color;
    }
    a{
      &:hover,&.router-link-active{
        color:$main-color;
      }
    }
  }
  border-bottom: 1px solid #ddd;
  &:last-child{
    border-bottom: none;
  }
}
</style>
