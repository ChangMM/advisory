<template lang="html">
  <div class="preview-mask" @keyup.esc='f_close'>
    <img src="../../assets/close.png" v-on:click='f_close' class="close" />
    <div class='preview-wrap'>
      <h3>详细信息</h3>
      <table>
        <tr>
          <th>类别</th>
          <th>内容</th>
        </tr>
        <tr>
          <td>个人信息</td>
          <td>
            <p><span class="label">姓名：</span>{{item.name}}</p>
            <p><span class="label">工作单位：</span>{{item.workplace}}</p>
            <p><span class="label">所属性质</span>{{item.job_type}}</p>
            <p><span class="label">职务：</span>{{item.job}}</p>
            <p><span class="label">联系电话：</span>{{item.phone}}</p>
            <p><span class="label">常用邮箱：</span>{{item.email}}</p>
          </td>
        </tr>
        <tr>
          <td>项目信息</td>
          <td>
            <p><span class="label">现有建设用地：</span>{{item.area}}（亩）</p>
            <p><span class="label">项目所在城市：</span>{{item.city}}</p>
            <p><span class="label">预期投资金额：</span>{{item.money}}（亿元）</p>
            <p><span class="label">资金来源：</span>{{item.money_from}}</p>
            <p><span class="label">拟建设内容：</span>{{item.info}} {{item.info_more ? "(" + item.info_more + ")" : ""}}</p>
          </td>
        </tr>
        <tr>
          <td>备注</td>
          <td>
            <p>{{item.feedback}}</p>
          </td>
        </tr>
      </table>
    </div>
  </div>
</template>

<script>
export default {
  data () {
    return {
      m_pc: true
    }
  },
  props: ['item'],
  methods: {
    f_close: function () {
      this.$emit('close')
    }
  }
}
</script>

<style lang="scss" scoped>
@import '../../scss/_variliables.scss';
.preview-mask{
  position: fixed;
  top:0;
  left:0;
  width:100%;
  height:100%;
  z-index: 9997;
  transition: background ease .6s;
  background: rgba(255, 255, 255, 0.95);
  .close{
    height:20px;
    cursor: pointer;
    position: absolute;
    top:40px;
    right:60px;
  }
}
.preview-wrap{
  width:650px;
  padding: 0 40px 20px;
  margin:0 auto 0;
  top:100px;
  background-color: #fff;
  border-radius: 4px;
  box-shadow: 1px 1px 20px rgba(0,0,0,0.05),
              -1px -1px 20px rgba(0,0,0,0.05);
  position: relative;
  h3{
    font-size: 20px;
    text-align: center;
    color: $main-color;
    height: 50px;
    line-height: 50px;
  }
  table{
    td,th{
      padding: 10px 0;
      line-height: 1.5;
      border:1px solid #ddd;
    }
    td{
      &:first-child{
        min-width:120px;
      }
      p{
        padding-left: 130px;
        text-align: left;
        color:$main-color;
      }
      .label{
        min-width:80px;
        color: #000;
        display: inline-block;
        font-weight: bold;
      }
    }
  }
}

</style>
