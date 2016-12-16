<template>
  <div class="card-wrap">
    <transition name="fade">
      <div class="card-item card-start" v-if='m_card==1'>
        <div class="slogan-wrap">
          <img src="../../assets/icon2.png" class="logo" alt="咨询">
          <h2 class="card-title">预约咨询</h2>
        </div>
        <div class="section">
          <div class="card-content">
            <p>预约咨询功能将有专业的技术人员根据您的地域、土地、投资、交通等基本情况，提供详实的赛道可行性分析结果。</p>
            <p>请您填写下您的个人信息，方便我们之后与您联系。</p>
          </div>
        </div>
        <div class="card-footer">
          <span class="button" v-on:click='f_start'>开始预约</span>
        </div>
      </div>
    </transition>
    <transition name="fade-2">
      <div class="card-item card-ing animated" v-if="m_card==2">
        <div class="progress-wrap">
          <div class="progress-bar" v-bind:style="{ width: m_percent }"></div>
        </div>
        <div class="section" v-show="m_step==1">
          <h3 class="section-title">一、个人信息 <span class="title-tip">基本信息</span></h3>
          <div class="question input">
            <div class="answer-item">
              <p class='item-title'>您的姓名</p>
              <input type="text" v-model="m_name">
            </div>
            <div class="answer-item">
              <p class='item-title'>联系电话</p>
              <input type="text" v-model="m_phone">
            </div>
            <div class="answer-item">
              <p class='item-title'>常用邮箱</p>
              <input type="text" v-model="m_email">
            </div>
          </div>
        </div>
        <div class="section" v-show="m_step==2">
          <h3 class="section-title">二、个人信息 <span class="title-tip">工作信息</span></h3>
          <div class="question input">
            <div class="answer-item">
              <p class='item-title'>工作单位</p>
              <input type="text" v-model="m_workplace">
            </div>
            <div class="answer-item">
              <p class='item-title'>职务</p>
              <input type="text" v-model="m_job">
            </div>
            <div class="answer-item">
              <p class='item-title'>所属性质</p>
              <div class="radio-input-wrap">
                <input type="radio" name='radio-1' id='radio-1-1' value='机关政府' v-model="m_radio_1">
                <label class="radio-label" for="radio-1-1">机关政府</label>
              </div>
              <div class="radio-input-wrap">
                <input type="radio" name='radio-1' id='radio-1-2' value='国有企业' v-model="m_radio_1">
                <label class="radio-label" for="radio-1-2">国有企业</label>
              </div>
              <div class="radio-input-wrap">
                <input type="radio" name='radio-1' id='radio-1-3' value='民营企业' v-model="m_radio_1">
                <label class="radio-label" for="radio-1-3">民营企业</label>
              </div>
              <div class="radio-input-wrap">
                <input type="radio" name='radio-1' id='radio-1-4' value='其他' v-model="m_radio_1">
                <label class="radio-label" for="radio-1-4">其他</label>
              </div>
            </div>
          </div>
        </div>
        <div class="section" v-show="m_step==3">
          <h3 class="section-title">三、项目信息 <span class="title-tip">基本信息</span></h3>
          <div class="question input">
            <div class="answer-item">
              <p class='item-title'>现有建设用地</p>
              <input type="text" v-model="m_area">
              <span class="input-tip">亩</span>
            </div>
            <div class="answer-item">
              <p class='item-title'>项目所在城市</p>
              <input type="text" v-model="m_city">
            </div>
            <div class="answer-item">
              <p class='item-title'>预期投资金额</p>
              <input type="text" v-model="m_money">
              <span class="input-tip">亿元</span>
            </div>
            <div class="answer-item">
              <p class='item-title'>资金来源</p>
              <input type="text" v-model="m_money_from">
            </div>
          </div>
        </div>
        <div class="section" v-show="m_step==4">
          <h3 class="section-title">四、项目信息 <span class="title-tip">拟建设内容</span></h3>
          <div class="question padding-big" v-on:click='f_choose($event)'>
            <div class="answer-item" data-content='赛车场、赛道'>
              赛车场、赛道<i class="iconfont icon-duihao-copy"></i>
              <div class="radios-wrap">
                <div class="radio-input-wrap">
                  <input type="radio" name='radio-2' id='radio-2-1' value='一级' v-model="m_radio_2">
                  <label class="radio-label" for="radio-2-1">一级</label>
                </div>
                <div class="radio-input-wrap">
                  <input type="radio" name='radio-2' id='radio-2-2' value='二级' v-model="m_radio_2">
                  <label class="radio-label" for="radio-2-2">二级</label>
                </div>
                <div class="radio-input-wrap">
                  <input type="radio" name='radio-2' id='radio-2-3' value='三级' v-model="m_radio_2">
                  <label class="radio-label" for="radio-2-3">三级</label>
                </div>
                <div class="radio-input-wrap">
                  <input type="radio" name='radio-2' id='radio-2-3' value='四级' v-model="m_radio_2">
                  <label class="radio-label" for="radio-2-3">四级</label>
                </div>
                <div class="radio-input-wrap">
                  <input type="radio" name='radio-2' id='radio-2-3' value='体验赛道' v-model="m_radio_2">
                  <label class="radio-label" for="radio-2-3">体验赛道</label>
                </div>
              </div>
            </div>
            <div class="answer-item" data-content='卡丁车场'>
              卡丁车场<i class="iconfont icon-duihao-copy"></i>
              <div class="radios-wrap">
                <div class="radio-input-wrap">
                  <input type="radio" name='radio-2' id='radio-3-1' value='竞速型' v-model="m_radio_2">
                  <label class="radio-label" for="radio-3-1">竞速型</label>
                </div>
                <div class="radio-input-wrap">
                  <input type="radio" name='radio-2' id='radio-3-2' value='娱乐型' v-model="m_radio_2">
                  <label class="radio-label" for="radio-3-2">娱乐型</label>
                </div>
                <div class="radio-input-wrap">
                  <input type="radio" name='radio-2' id='radio-3-3' value='室内场馆' v-model="m_radio_2">
                  <label class="radio-label" for="radio-3-3">室内场馆</label>
                </div>
              </div>
            </div>
            <div class="answer-item" data-content='安全驾驶教育基地'>
              安全驾驶教育基地<i class="iconfont icon-duihao-copy"></i>
            </div>
            <div class="answer-item" data-content='汽车驾驶体验中心'>
              汽车驾驶体验中心<i class="iconfont icon-duihao-copy"></i>
            </div>
            <div class="answer-item" data-content='城市 SUV 体验赛道'>
              城市 SUV 体验赛道<i class="iconfont icon-duihao-copy"></i>
            </div>
            <div class="answer-item" data-content='拉力、越野、摩托车赛道'>
              拉力、越野、摩托车赛道<i class="iconfont icon-duihao-copy"></i>
            </div>
            <div class="answer-item" data-content='汽车文化公园、汽车营地公园、汽车雕塑公园等'>
              汽车文化公园、汽车营地公园、汽车雕塑公园等<i class="iconfont icon-duihao-copy"></i>
            </div>
          </div>
        </div>
        <div class="card-footer">
          <span class="button prev" v-on:click='f_prev'>上一项</span>
          <span class="button next" v-on:click='f_next'>下一项</span>
        </div>
      </div>
    </transition>
    <transition name="fade-3">
      <div class="card-item card-end" v-if='m_card==3'>
        <div class="section">
          <h3 class="section-title">五、其他需特殊注明情况</h3>
          <div class="question input">
            <div class="answer-item">
              <textarea name="name" v-model="m_feedback"></textarea>
            </div>
          </div>
        </div>
        <span class="button" v-on:click='f_submit($event)'>提交结果</span>
      </div>
    </transition>
    <transition name="fade-4">
      <div class="card-item card-start" v-if='m_card==4'>
        <div class="slogan-wrap">
          <img src="../../assets/icon2.png" class="logo" alt="咨询">
        </div>
        <div class="section">
          <div class="card-content">
            <p class="code">预约码👇👇</p>
            <p class="random">{{m_random}}</p>
          </div>
        </div>
        <div class="card-footer">
          <span class="tip">
            请妥善保管好您的预约码 <br>作为与 JENNYAO 联系的重要凭证
        </div>
      </div>
    </transition>
  </div>
</template>

<script>
export default {
  data () {
    return {
      m_total: 4,
      m_card: 1,
      m_random: 'wer4T',
      m_name: '',
      m_phone: '',
      m_email: '',
      m_job: '',
      m_workplace: '',
      m_radio_1: '',
      m_area: '',
      m_city: '',
      m_money_from: '',
      m_money: '',
      m_construct_content: '',
      m_radio_2: '',
      m_radio_3: '',
      m_feedback: '',
      m_step: 1
    }
  },
  computed: {
    m_percent: function () {
      if (this.m_step > this.m_total) {
        return '100%'
      }
      return (this.m_step / this.m_total) * 100 + '%'
    }
  },
  methods: {
    f_submit: function (e) {
      let currentTarget = e.currentTarget
      if (currentTarget.classList.contains('disable')) {
        return
      }
      currentTarget.classList.add('disable')
      currentTarget.innerHTML = '正在提交结果...'
      this.$http.post('/api/add_meet', {
        city : this.m_city,
        area : this.m_area,
        job_type : this.m_radio_1,
        money : this.m_money,
        money_from : this.m_money_from,
        name : this.m_name,
        phone : this.m_phone,
        job : this.m_job,
        workplace : this.m_workplace,
        email : this.m_email,
        info: this.m_construct_content,
        info_more: this.m_radio_2,
        feedback: this.m_feedback
      }).then(function (response) {
        if (response.body.status === 1) {
          currentTarget.innerHTML = '预约成功'
          this.m_card = 4
          this.m_random = response.body.data
        } else {
          currentTarget.classList.remove('disable')
          currentTarget.innerHTML = '生成结果错误，请重试'
        }
      })
    },
    f_start: function () {
      this.m_card++
    },
    f_check: function () {
      switch (this.m_step) {
        case 1:
          return this.m_phone !== '' && this.m_name !== '' && this.m_email !== ''
          break
        case 2:
          return this.m_job !== '' && this.m_workplace !== '' && this.m_radio_1 !== ''
          break
        case 3:
          return this.m_area !== '' && this.m_city !== '' && this.m_money !== '' && this.m_money_from !== ''
          break
        case 4:
          if (this.m_construct_content === '赛车场、赛道' || this.m_construct_content === '卡丁车场') {
            return this.m_radio_2 !== ''
          } else {
            return this.m_construct_content !== ''
          }
          break
        }
      return true
    },
    f_next: function () {
      if (!this.f_check()) {
        let card = document.querySelector('.card-item')
        card.classList.add('shake')
        setTimeout(function () {
          card.classList.remove('shake')
        }, 800)
        return
      }
      if (this.m_step === this.m_total) {
        this.m_card++
        return
      }
      this.m_step++
    },
    f_prev: function () {
      if (this.m_step === 1) {
        return
      }
      this.m_step--
    },
    f_choose: function (e) {
      e.stopPropagation()
      let currentTarget = e.currentTarget
      let target = e.target
      while (target !== currentTarget) {
        if (target.classList.contains('answer-item')) {
          let activeTarget = currentTarget.querySelector('div.active')
          if (activeTarget) {
            activeTarget.classList.remove('active')
          }
          if (this.m_step === 4) {
            this.m_construct_content = target.dataset.content
          }
          target.classList.add('active')
          return
        }
        target = target.parentNode
      }
    }
  }
}
</script>

<style lang='scss' scoped>
  @import '../../scss/_variliables.scss';
  .fade-leave-active,
  .fade-2-enter-active,
  .fade-2-leave-active,
  .fade-3-enter-active,
  .fade-3-leave-active,
  .fade-4-enter-active,
  .fade-4-leave-active{
    transition: transform 0.3s;
  }
  .fade-leave-active,
  .fade-2-enter,
  .fade-2-leave-active,
  .fade-3-enter,
  .fade-3-leave-active,
  .fade-4-enter,
  .fade-4-leave-active {
    transform: translateZ(0px) rotateY(-90deg);
    -webkit-transform: translateZ(0px) rotateY(-90deg);
  }
  .card-item{
    top:0;
    left:0;
    right:0;
    bottom:0;
    width:90%;
    height:85%;
    margin:auto;
    padding:40px 10px 60px;
    border-radius: 4px;
    position: absolute;
    box-sizing: border-box;
    background-color: #fff;
    &.card-start{
      height:80%;
      color:#999;
      padding: 120px 20px 60px;
      .slogan-wrap{
        width:100%;
        position: absolute;
        top:20px;
        right:0;
        left:0;
        margin: auto;
        text-align: center;
        .logo{
          width:40px;
        }
        .card-title{
          margin-top: 0px;
          font-size: 18px;
        }
      }
      .section{
        padding-top: 0;
      }
      .card-content{
        position: absolute;
        top:0;
        left:0;
        right:0;
        bottom:0;
        width:260px;
        height:300px;
        margin: auto;
        font-size: 14px;
        letter-spacing: 2px;
        line-height: 1.5;
        p{
          margin-bottom: 15px;
          text-align: left;
        }
        .code{
          margin-top: 20px;
          font-size: 24px;
          color: #000;
          text-align: center;
        }
        .random{
          text-align: center;
          font-size: 28px;
          color: $main-color;
        }
      }
      .card-footer{
        bottom:20px;
        .button{
          letter-spacing: 2px;
          width:230px;
        }
      }
    }
    .card-footer{
      bottom: 10px;
      width:90%;
      left:0;
      right:0;
      margin:auto;
      position: absolute;
      text-align: center;
      .button{
        height:40px;
        width:45%;
        line-height: 40px;
        display: inline-block;
        border-radius: 2px;
        background-color: $main-color;
        color: #fff;
        cursor: pointer;
        &.prev{
          margin-right: 10px;
        }
        &.disable{
          color:#999;
          background-color: #eee;
        }
        &:hover{
          background-color: darken($main-color, 5%);
        }
        &:active{
          background-color: darken($main-color, 10%);
        }
      }
    }
    &.card-end{
      padding-top: 20px;
      .button{
        color: #fff;
        height:40px;
        line-height: 40px;
        border-radius: 4px;
        background-color: $main-color;
        display: inline-block;
        position: absolute;
        bottom:20px;
        width:80%;
        left:0;
        right:0;
        margin:auto;
        text-align: center;
        &:active{
          background-color: darken($main-color, 10%);
        }
      }
      .answer-item{
        padding-top:6px !important;
        padding-right:10px !important;
        input{
          height:30px !important;
        }
      }
    }
    .progress-wrap{
      position: absolute;
      top:15px;
      left:0;
      right:0;
      margin:auto;
      width:90%;
      height:6px;
      margin-bottom: 10px;
      border-radius: 2px;
      background-color: #eee;
      .progress-bar{
        background-color: $main-color;
        height: 100%;
        border-radius: 2px;
        transition: width ease 0.3s;
      }
    }
  }
  .section{
    height:100%;
    padding-top: 30px;
    position: relative;
    box-sizing: border-box;
    .section-title{
      position: absolute;
      top:-6px;
      font-size: 20px;
      font-weight: bolder;
      line-height: 30px;
      height:30px;
      color: #666;
      .title-tip{
        font-size: 14px;
      }
    }
    .question{
      height:100%;
      overflow: auto;
      -webkit-overflow-scrolling: touch;
      &::-webkit-scrollbar {
        width: 4px;
      }
      &::-webkit-scrollbar-thumb {
        background-color: #ddd;
      }
      &::-webkit-scrollbar-track {
        border:1px solid #eee;
      }
      &.input{
        .answer-item{
          border:none !important;
          .item-title{
            color: #666;
          }
        }
      }
      &.padding-big{
        .answer-item{
          padding-top:20px;
          padding-bottom:20px;
        }
      }
      .answer-item{
        padding:12px 40px 12px 10px;
        border-top: 1px solid #eee;
        position: relative;
        border-radius: 4px;
        .label-tip{
          font-size: 12px;
          color:#666;
        }
        .iconfont{
          font-size: 0;
        }
        .radios-wrap{
          background-color: #fff;
          border: none;
          margin-top: 8px;
          padding:6px 40px 6px 10px;
          display: none;
          border-radius: 4px;
        }
        textarea{
          padding:8px;
          border-radius: 4px;
          box-sizing: border-box;
          height:100%;
          min-height: 200px;
          resize: none;
          width:100%;
          outline:none;
          border: 2px solid $main-color;
        }
        .radio-input-wrap{
          margin-top: 4px;
          width: 45%;
          display: inline-block;
          position: relative;
          box-sizing: border-box;
          height:30px;
          line-height: 30px;
          font-size: 16px;
          color: #999;
          input[type=radio]{
            height:16px;
            width:16px;
            top:2px;
            margin-right: 5px;
            position: relative;
            -webkit-appearance: none;
            outline: none;
            background-color: transparent;
            &::before{
              left:0;
              top:0;
              z-index: 2;
              content: '';
              width: 16px;
              height: 16px;
              position: absolute;
              box-sizing: border-box;
              border-radius: 50%;
              border: 2px solid $main-color;
            }
          }
          input[type=radio]:checked + label{
            color: $main-color;
          }
          input[type=radio]:checked{
            &::after{
              left:3px;
              top:3px;
              z-index: 2;
              content: '';
              width: 10px;
              height: 10px;
              position: absolute;
              box-sizing: border-box;
              border-radius: 50%;
              background-color: $main-color;
            }
          }
        }
        input[type=text]{
          height:30px;
          border: none;
          outline:none;
          width:100%;
          font-size: 20px;
          color: $main-color;
          border-bottom: 2px solid $main-color;
        }
        .input-tip{
          font-size: 20px;
          color: $main-color;
          position: absolute;
          bottom:12px;
          right:40px;
        }
        &.active{
          background-color: $main-color;
          color: #fff;
          .label-tip{
            color: #fff;
          }
          .radios-wrap{
            display: block;
          }
          i.iconfont{
            position: absolute;
            top:0;
            bottom:0;
            margin-top: auto;
            margin-bottom: auto;
            right:10px;
            font-size: 14px;
            text-align: center;
            line-height: 20px;
            height: 20px;
            width:20px;
            background-color: #fff;
            border-radius: 50%;
            color: $main-color;
          }
        }
        &:last-child{
          border-bottom: 1px solid #eee;
        }
      }
    }
  }
</style>
