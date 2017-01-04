<template lang="html">
  <div class="result">
    <table>
      <thead>
        <tr>
          <th>序号</th>
          <th>姓名</th>
          <th>工作单位</th>
          <th>职务</th>
          <th>联系电话</th>
          <th>常用邮箱</th>
          <th>预览</th>
          <th>操作</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(speed, index) in m_speeds">
          <td>{{ index+1 }}</td>
          <td>{{ speed.name }}</td>
          <td>{{ speed.workplace}}</td>
          <td>{{ speed.job }}</td>
          <td>{{ speed.phone }}</td>
          <td>{{ speed.email }}</td>
          <td><span class="preview" v-on:click = 'f_preview(speed)'>详细信息</span></td>
          <td><span class="delete" v-on:click = 'f_delete(speed.id)'>删除</span></td>
        </tr>
      </tbody>
    </table>
    <Preview v-show='m_preview' :item='m_item' v-on:close='f_close_preview'> </Preview>
  </div>
</template>

<script>
import Preview from './Preview.vue'
export default {
  data () {
    return {
      m_preview: false,
      m_item: {},
      m_speeds: []
    }
  },
  computed: {},
  mounted () {
    this.f_get_speed()
  },
  watch: {
    '$route': ['f_get_speed']
  },
  methods: {
    f_close_preview: function () {
      this.m_preview = false
    },
    f_preview: function (item) {
      this.m_item = item
      this.m_preview = true
    },
    f_get_speed: function () {
      this.$http.get('/api/all_speed').then(function (response) {
        let body = response.body
        if (body.status === 1) {
          this.m_speeds = body.data
        }
      })
    },
    f_delete: function (id) {
      this.$http.post('/api/delete_speed', {
        id: id
      }).then(function (response) {
        let body = response.body
        if (body.status === 1) {
          this.$warn('删除成功')
          this.f_get_speed()
        } else {
          this.$warn(body.msg)
        }
      })
    },
  },
  components: {
    Preview
  }
};
</script>

<style lang="scss">
  @import '../../scss/_variliables.scss';
  .result{
    table{
      margin-top: 16px;
      width:100%;
      text-align: center;
      border-collapse:collapse;
      th{
        font-size: 16px;
      }
      tr{
        height:50px;
      }
      td, th{
        border:1px solid #ddd;
      }
      .preview,.delete{
        color: $main-color;
        cursor: pointer;
        &:hover{
          text-decoration: underline;
        }
      }
    }
    tbody{

    }
  }
</style>
