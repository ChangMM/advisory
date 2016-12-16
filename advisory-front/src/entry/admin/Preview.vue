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
            <p><span class="label">工作地点：</span>{{item.workplace}}</p>
            <p><span class="label">职务：</span>{{item.job}}</p>
            <p><span class="label">联系电话：</span>{{item.phone}}</p>
            <p><span class="label">常用邮箱：</span>{{item.email}}</p>
          </td>
        </tr>
        <tr>
          <td>地理位置</td>
          <td>
            <p><span class="label">所在省份：</span>{{item.province}}（{{item.district}}）</p>
            <p><span class="label">所在城市：</span>{{item.city}}（{{item.city_type}}）</p>
          </td>
        </tr>
        <tr>
          <td>用地条件</td>
          <td>
            <p><span class="label">占地面积：</span>{{item.area}}（亩）</p>
            <p><span class="label">用地性质：</span>{{item.land}}</p>
            <p><span class="label">地形地貌：</span>{{item.land_type}}</p>
          </td>
        </tr>
        <tr>
          <td>交通条件</td>
          <td>
            <p><span class="label">距高速口：</span>{{item.dis_high}}（千米）</p>
            <p><span class="label">距市中心：</span>{{item.dis_center}}（千米）</p>
            <p><span class="label">距离机场：</span>{{item.dis_airplane}}（千米）</p>
          </td>
        </tr>
        <tr>
          <td>资金条件</td>
          <td>
            <p><span class="label">用于赛车场核心功能的建设资金：</span>{{item.center_money}} （万元）</p>
            <p><span class="label">用于配套的商业资金：</span>{{item.business_money}} （万元）</p>
          </td>
        </tr>
        <tr>
          <td>人文条件</td>
          <td>
            <p><span class="label">城市人口：</span> {{item.people_num}}（万）</p>
            <p><span class="label">200km 范围辐射人口：</span>{{item.people_200_num}}（万）</p>
            <p><span class="label">100km 范围著名景区：</span>{{item.view_type}}</p>
          </td>
        </tr>
        <tr>
          <td>其他信息</td>
          <td>
            <p><span class="label">300km 范围辐射城市(地级市)： </span>{{item.city_num}}（个）</p>
            <p><span class="label">500km 范围是否已有国际级赛车场：</span>{{item.has_place}}</p>
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
  top:60px;
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
