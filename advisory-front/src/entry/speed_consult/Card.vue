<template>
  <div class="card-wrap">
    <transition name="fade">
      <div class="card-item card-start" v-if='m_card==1'>
        <div class="slogan-wrap">
          <img src="../../assets/icon.png" class="logo" alt="咨询">
          <h2 class="card-title">快速咨询</h2>
        </div>
        <div class="section">
          <div class="card-content">
            <p>快速咨询功能可以根据地域、土地、投资、交通等基本情况，提供简单的赛道可行性分 析结果。</p>
            <p>分析结果来自于 JENNYAO 专业积累和工程经验，赛车场是一个非常复杂的系统工程， 快速咨询的基本资料有限，故分析结果仅供科普参考，不可作为实际工程依据，详细的工程 咨询请点击预约咨询，我们将有专业的技术人员为您提供咨询服务。</p>
          </div>
        </div>
        <div class="card-footer">
          <span class="button" v-on:click='f_start'>开始咨询</span>
        </div>
      </div>
    </transition>
    <transition name="fade-2">
      <div class="card-item card-ing animated" v-if="m_card==2">
        <div class="progress-wrap">
          <div class="progress-bar" v-bind:style="{ width: m_percent }"></div>
        </div>
        <div class="section has-title" v-show="m_step==1">
          <h3 class="section-title">一、地理位置</h3>
          <div class="question-title">
            <span>所在省份：</span><input type="text" v-model='m_province_text'>
          </div>
          <div class="question" v-bind:data-section='m_step' v-on:click='f_choose($event)'>
            <div class="answer-item" data-area='华东地区'>
              <label for="1-1">
                华东地区<br>
                <span class="label-tip">包括山东、江苏、安徽、浙江、福建、上海</span>
              </label>
              <i class="iconfont icon-duihao-copy"></i>
            </div>
            <div class="answer-item" data-area='华南地区'>
              <label for="1-2">
                华南地区<br>
                <span class="label-tip">包括广东、广西、海南</span>
              </label>
              <i class="iconfont icon-duihao-copy"></i>
            </div>
            <div class="answer-item" data-area='华中地区'>
              <label for="1-3">
                华中地区<br>
                <span class="label-tip">包括湖北、湖南、河南、江西</span>
              </label>
              <i class="iconfont icon-duihao-copy"></i>
            </div>
            <div class="answer-item" data-area='华北地区'>
              <label for="1-4">华北地区<br>
                <span class="label-tip">包括北京、天津、河北、山西、内蒙古</span>
              </label>
              <i class="iconfont icon-duihao-copy"></i>
            </div>
            <div class="answer-item" data-area='西北地区'>
              <label for="1-5">西北地区<br>
                <span class="label-tip">包括宁夏、新疆、青海、陕西、甘肃</span>
              </label>
              <i class="iconfont icon-duihao-copy"></i>
            </div>
            <div class="answer-item" data-area='西南地区'>
              <label for="1-6">西南地区<br>
                <span class="label-tip">包括四川、云南、贵州、西藏、重庆</span>
              </label>
              <i class="iconfont icon-duihao-copy"></i>
            </div>
            <div class="answer-item" data-area='东北地区'>
              <label for="1-7">东北地区<br>
                <span class="label-tip">包括辽宁、吉林、黑龙江</span>
              </label>
              <i class="iconfont icon-duihao-copy"></i>
            </div>
            <div class="answer-item" data-area='台港澳地区'>
              <label for="1-8">台港澳地区<br>
                <span class="label-tip">包括台湾、香港、澳门</span>
              </label>
              <i class="iconfont icon-duihao-copy"></i>
            </div>
          </div>
        </div>
        <div class="section has-title" v-show="m_step==2">
          <h3 class="section-title">二、地理位置</h3>
          <div class="question-title">
            <span>所在城市：</span><input type="text" v-model='m_city_text'>
          </div>
          <div class="question padding-big" v-bind:data-section='m_step' v-on:click='f_choose($event)'>
            <div class="answer-item" data-city='省会城市'>
              省会城市<i class="iconfont icon-duihao-copy"></i>
            </div>
            <div class="answer-item" data-city='副省级城市'>
              副省级城市<i class="iconfont icon-duihao-copy"></i>
            </div>
            <div class="answer-item" data-city='地级市'>
              地级市<i class="iconfont icon-duihao-copy"></i>
            </div>
            <div class="answer-item" data-city='县级市'>
              县级市<i class="iconfont icon-duihao-copy"></i>
            </div>
          </div>
        </div>
        <div class="section" v-show="m_step==3">
          <h3 class="section-title">三、用地条件 <span class="title-tip">占用面积</span></h3>
          <div class="question input" v-bind:data-section='m_step'>
            <div class="answer-item">
              <input type="text" autofocus='true' v-model="m_area">
              <span class='input-tip'>亩</span>
            </div>
          </div>
        </div>
        <div class="section" v-show="m_step==4">
          <h3 class="section-title">四、用地条件 <span class="title-tip">用地性质(多选)</span></h3>
          <div class="question padding-big" v-on:click='f_choose($event, 1)'>
            <label class="answer-item" for='checkbox-1-1'>
              建设用地<i class="iconfont icon-duihao-copy square"></i>
              <input type="checkbox" id="checkbox-1-1" value="建设用地" v-model="m_land">
            </label>
            <label class="answer-item" for='checkbox-1-2'>
              林地<i class="iconfont icon-duihao-copy square"></i>
              <input type="checkbox" id="checkbox-1-2" value="林地" v-model="m_land">
            </label>
            <label class="answer-item" for='checkbox-1-3'>
              荒地<i class="iconfont icon-duihao-copy square"></i>
              <input type="checkbox" id="checkbox-1-3" value="荒地" v-model="m_land">
            </label>
            <label class="answer-item" for='checkbox-1-4'>
              农田<i class="iconfont icon-duihao-copy square"></i>
              <input type="checkbox" id="checkbox-1-4" value="农田" v-model="m_land">
            </label>
          </div>
        </div>
        <div class="section" v-show="m_step==5">
          <h3 class="section-title">五、用地条件 <span class="title-tip">地物地貌(多选)</span></h3>
          <div class="question padding-big" v-on:click='f_choose($event, 1)'>
            <label class="answer-item" for='checkbox-2-1'>
              山地<i class="iconfont icon-duihao-copy square"></i>
              <input type="checkbox" id="checkbox-2-1" value="山地" v-model="m_type">
            </label>
            <label class="answer-item" for='checkbox-2-2'>
              平地<i class="iconfont icon-duihao-copy square"></i>
              <input type="checkbox" id="checkbox-2-2" value="平地" v-model="m_type">
            </label>
            <label class="answer-item" for='checkbox-2-3'>
              水塘<i class="iconfont icon-duihao-copy square"></i>
              <input type="checkbox" id="checkbox-2-3" value="水塘" v-model="m_type">
            </label>
          </div>
        </div>
        <div class="section" v-show="m_step==6">
          <h3 class="section-title">六、交通条件</h3>
          <div class="question input" v-bind:data-section='m_step'>
            <div class="answer-item">
              <p class='item-title'>距离高速出口</p>
              <input type="text" autofocus='true' v-model="m_dis_high">
              <span class='input-tip'>km</span>
            </div>
            <div class="answer-item">
              <p class='item-title'>距离机场</p>
              <input type="text" autofocus='true' v-model="m_dis_airplane">
              <span class='input-tip'>km</span>
            </div>
            <div class="answer-item">
              <p class='item-title'>距离市中心</p>
              <input type="text" autofocus='true' v-model="m_dis_center">
              <span class='input-tip'>km</span>
            </div>
          </div>
        </div>
        <div class="section" v-show="m_step==7">
          <h3 class="section-title">七、资金条件</h3>
          <div class="question input" v-bind:data-section='m_step'>
            <div class="answer-item">
              <p class='item-title'>用于赛车场核心功能的建设资金</p>
              <input type="text" autofocus='true' v-model="m_center_money">
              <span class='input-tip'>万元</span>
            </div>
            <div class="answer-item">
              <p class='item-title'>用于配套商业的资金</p>
              <input type="text" autofocus='true' v-model="m_business_money">
              <span class='input-tip'>亿元</span>
            </div>
          </div>
        </div>
        <div class="section" v-show="m_step==8">
          <h3 class="section-title">八、人文条件</h3>
          <div class="question input" v-bind:data-section='m_step'>
            <div class="answer-item">
              <p class='item-title'>城市人口</p>
              <input type="text" autofocus='true' v-model="m_people_num">
              <span class='input-tip'>万</span>
            </div>
            <div class="answer-item">
              <p class='item-title'>200km 范围辐射人口</p>
              <input type="text" autofocus='true' v-model="m_200_people_num">
              <span class='input-tip'>万</span>
            </div>
            <div class="answer-item">
              <p class='item-title'>100km 范围著名景区</p>
              <div class="radio-input-wrap">
                <input type="radio" name='radio-1' id='radio-1-1' value='5A' v-model="m_radio_1">
                <label class="radio-label" for="radio-1-1">5A</label>
              </div>
              <div class="radio-input-wrap">
                <input type="radio" name='radio-1' id='radio-1-2' value='4A' v-model="m_radio_1">
                <label class="radio-label" for="radio-1-2">4A</label>
              </div>
              <div class="radio-input-wrap">
                <input type="radio" name='radio-1' id='radio-1-3' value='3A' v-model="m_radio_1">
                <label class="radio-label" for="radio-1-3">3A</label>
              </div>
              <div class="radio-input-wrap">
                <input type="radio" name='radio-1' id='radio-1-4' value='2A' v-model="m_radio_1">
                <label class="radio-label" for="radio-1-4">2A</label>
              </div>
            </div>
          </div>
        </div>
        <div class="section" v-show="m_step==9">
          <h3 class="section-title">九、其他</h3>
          <div class="question input" v-bind:data-section='m_step'>
            <div class="answer-item">
              <p class='item-title'>300km 范围辐射城市(地级市)</p>
              <input type="text" autofocus='true' v-model="m_300_city_num">
              <span class='input-tip'>个</span>
            </div>
            <div class="answer-item">
              <p class='item-title'>500km 范围是否已有国际级赛车场</p>
              <div class="radio-input-wrap">
                <input type="radio" name='radio-2' id='radio-2-1' value='有' v-model="m_radio_2">
                <label class="radio-label" for="radio-1-1">有</label>
              </div>
              <div class="radio-input-wrap">
                <input type="radio" name='radio-2' id='radio-2-2' value='无' v-model="m_radio_2">
                <label class="radio-label" for="radio-2-2">无</label>
              </div>
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
      <div class="card-item card-end animated" v-if='m_card==3'>
        <div class="section">
          <h3 class="section-title"><span class="title-tip">请留下您的联系方式方便联系</span></h3>
          <div class="question input">
            <div class="answer-item">
              <p class='item-title'>姓名</p>
              <input type="text" v-model="m_name">
            </div>
            <div class="answer-item">
              <p class='item-title'>工作单位</p>
              <input type="text" v-model="m_workplace">
            </div>
            <div class="answer-item">
              <p class='item-title'>职位</p>
              <input type="text" v-model="m_job">
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
        <span class="button" v-on:click='f_submit($event)'>提交结果</span>
      </div>
    </transition>
    <transition name="fade-4">
      <div class="card-item card-start" v-if='m_card==4'>
        <div class="slogan-wrap">
          <img src="../../assets/icon3.png" class="logo" alt="咨询">
          <h2 class="card-title">咨询结果</h2>
        </div>
        <div class="section">
          <div class="card-content" v-html='m_result'></div>
        </div>
        <div class="card-footer">
          <span class="tip">想获取更详细的咨询，请 --> <a href="/meet_consult">预约咨询</a></span>
        </div>
      </div>
    </transition>
  </div>
</template>

<script>
export default {
  data () {
    return {
      m_total: 9,
      m_card: 1,
      m_result: '',
      m_area: '', // 占地面积
      m_city: '', // 城市
      m_land: [], // 地形
      m_type: [],
      m_district: '', // 区域
      m_province_text: '',
      m_city_text: '',
      m_dis_high: '', // 距离高速路的距离
      m_dis_center: '', // 距市中心距离
      m_dis_airplane: '', //距机场距离
      m_center_money: '', //核心资金
      m_business_money: '', //配套商业资金
      m_people_num: '', //城市人口
      m_200_people_num: '', //200Km 辐射人口
      m_300_city_num: '', //300Km 辐射地级市
      m_name: '',
      m_job: '',
      m_workplace: '',
      m_phone: '',
      m_email: '',
      m_radio_1: '',
      m_radio_2: '',
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

      if (!this.f_check_card()) {
        let card = document.querySelector('.card-item')
        card.classList.add('shake')
        setTimeout(function () {
          card.classList.remove('shake')
        }, 800)
        return
      }
      currentTarget.classList.add('disable')
      currentTarget.innerHTML = '正在生成结果...'
      this.$http.post('/api/add_speed', {
        province : this.m_province_text,
        district : this.m_district,
        city : this.m_city,
        city_type : this.m_city_text,
        area : this.m_area,
        land : this.m_land.join('，'),
        land_type : this.m_type.join('，'),
        dis_high : this.m_dis_high,
        dis_center : this.m_dis_center,
        dis_airplane : this.m_dis_airplane,
        center_money : this.m_center_money,
        business_money : this.m_business_money,
        people_num : this.m_people_num,
        people_200_num : this.m_200_people_num,
        view_type : this.m_radio_1,
        city_num : this.m_300_city_num,
        has_place : this.m_radio_2,
        name : this.m_name,
        phone : this.m_phone,
        job : this.m_job,
        workplace : this.m_workplace,
        email : this.m_email
      }).then(function (response) {
        if (response.body.status === 1) {
          currentTarget.classList.remove('disable')
          currentTarget.innerHTML = '已生成结果'
          this.m_result = this.f_result()
          this.m_card = 4
        } else {
          currentTarget.classList.remove('disable')
          currentTarget.innerHTML = '生成结果错误，请重试'
        }
      }.bind(this))
    },
    f_start: function () {
      this.m_card++
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
      if (this.m_step == this.m_total) {
        this.m_card++
        return
      }
      this.m_step++
    },
    f_check_card: function () {
      switch (this.m_card) {
        case 3:
          return this.m_name !== '' && this.m_email !== '' && this.m_workplace !== ''  && this.m_phone !== '' && this.m_job !== ''
          break
      }
      return true
    },
    f_prev: function () {
      if (this.m_step === 1) {
        return
      }
      this.m_step--
    },
    f_check: function () {
      switch (this.m_step) {
        case 1:
          return this.m_district !== '' && this.m_province_text !== ''
          break
        case 2:
          return this.m_city !== '' && this.m_city_text !== ''
          break
        case 3:
          return this.m_area !== ''
          break
        case 4:
          return this.m_land.length !== 0
          break
        case 5:
          return this.m_type.length !== 0
          break
        case 6:
          return this.m_dis_high !== '' && this.m_dis_center !=='' && this.m_dis_center !== ''
          break
        case 7:
          return this.m_center_money !== '' && this.m_business_money !==''
          break
        case 8:
          return this.m_people_num !== '' && this.m_200_people_num !=='' && this.m_radio_1 !== ''
          break
        case 9:
          return this.m_300_city_num !== '' && this.m_radio_2 !== ''
          break
      }
    },
    f_result: function () {
      if (this.city_type === '省会城市' || this.city_type === '副省级城市') {
        this.m_result += '您的场地地理位置较好、'
      } else {
        this.m_result += '您的场地地理位置一般、'
      }

      if (parseInt(this.m_dis_high) < 50) {
        this.m_result += '交通便捷、'
      } else {
        this.m_result += '交通一般、'
      }

      if (parseInt(this.m_200_people_num) < 3000) {
        this.m_result += '周边人口密度一般、'
      } else {
        this.m_result += '周边人口密度较大、'
      }

      if (this.m_radio_2 === '有') {
        this.m_result += '周边已有赛车场。'
      } else {
        this.m_result += '周边已有赛车场。'
      }

      if (this.m_land.join('，').indexOf('农田') !== -1) {
        this.m_result += '建议解决耕地问题。\r\n 现有用地可以建设'
      } else {
        this.m_result += '\r\n 现有用地可以建设'
      }

      if (parseInt(this.m_area) < 100) {
        this.m_result += '卡丁车或城市 SUV 赛道。\r\n'
      } else if (parseInt(this.m_area) >= 100 && parseInt(this.m_area) <300) {
        this.m_result += '体验赛道。\r\n'
      } else if (parseInt(this.m_area) >= 300 && parseInt(this.m_area) <500) {
        this.m_result += '四级赛道。\r\n'
      } else if (parseInt(this.m_area) >= 500 && parseInt(this.m_area) <800) {
        this.m_result += '三级赛道。\r\n'
      } else if (parseInt(this.m_area) >= 800 && parseInt(this.m_area) <1000) {
        this.m_result += '三级或二级赛道。\r\n'
      } else if (parseInt(this.m_area) >= 1000 && parseInt(this.m_area) <2000) {
        this.m_result += '二级赛道。\r\n'
      } else if (parseInt(this.m_area) >= 2000) {
        this.m_result += '一级赛道。\r\n'
      }

      this.m_result +='现有资金适合建设'
      if (parseInt(this.m_center_money) < 2000) {
        this.m_result += '卡丁车或城市 SUV 赛道。\r\n'
      } else if (parseInt(this.m_center_money) >= 2000 && parseInt(this.m_area) <8000) {
        this.m_result += '体验赛道。\r\n'
      } else if (parseInt(this.m_center_money) >= 8000 && parseInt(this.m_area) <15000) {
        this.m_result += '四级赛道。\r\n'
      } else if (parseInt(this.m_center_money) >= 15000 && parseInt(this.m_area) <30000) {
        this.m_result += '三级赛道。\r\n'
      } else if (parseInt(this.m_center_money) >= 30000 && parseInt(this.m_area) <40000) {
        this.m_result += '三级或二级赛道。\r\n'
      } else if (parseInt(this.m_center_money) >= 40000 && parseInt(this.m_area) <60000) {
        this.m_result += '二级赛道。\r\n'
      } else if (parseInt(this.m_center_money) >= 60000) {
        this.m_result += '一级赛道。\r\n'
      }
      return this.m_result
    },
    f_choose: function (e, is_more) {
      e.stopPropagation()
      let currentTarget = e.currentTarget
      let target = e.target
      if (target.type === 'checkbox') {
        return
      }
      while (target !== currentTarget) {
        if (target.classList.contains('answer-item')) {
          if (!is_more) {
            let activeTarget = currentTarget.querySelector('div.active')
            if (activeTarget) {
              activeTarget.classList.remove('active')
            }
            if (this.m_step === 1) {
              this.m_district = target.dataset.district
            } else if (this.m_step === 2) {
              this.m_city = target.dataset.city
            } else if (this.m_step === 5) {
              this.m_type = target.dataset.type
            }
            target.classList.add('active')
            return
          } else {
            if (target.classList.contains('active')) {
              target.classList.remove('active')
            } else {
              target.classList.add('active')
            }
          }
        }
        target = target.parentNode
      }
    }
  }
}
</script>

<style lang='scss'>
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
  .fade-4-leave-active
  {
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
        text-align: justify;
        height:280px;
        margin: auto;
        font-size: 14px;
        letter-spacing: 2px;
        line-height: 1.5;
        p{
          margin-bottom: 15px;
          text-align: left;
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
      .tip{
        font-size: 16px;
        a{
          color: $main-color;
        }
      }
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
    &.has-title{
      padding-top: 70px;
      .question-title{
        height:30px;
        line-height: 30px;
        position: absolute;
        top:30px;
        font-size: 16px;
        color: $main-color;
        padding-left: 4px;
        span{
          display: inline-block;
          height:30px;
          line-height: 30px;
          vertical-align: bottom;
        }
        input{
          border: none;
          outline: none;
          height:30px;
          width: 120px;
          font-size: 18px;
          margin-left: 4px;
          color: $main-color;
          box-sizing: border-box;
          border-bottom: 2px solid $main-color;
        }
      }
    }
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
  }
  .question{
    height:100%;
    overflow: auto;
    -webkit-overflow-scrolling: touch;
    box-sizing: border-box;
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
      .radio-input-wrap{
        margin-top: 10px;
        width: 45%;
        display: inline-block;
        position: relative;
        box-sizing: border-box;
        height:30px;
        line-height: 30px;
        font-size: 16px;
        color: #999;
        input[type=radio]{
          height:20px;
          width:20px;
          top:6px;
          margin-right: 5px;
          position: relative;
          -webkit-appearance: none;
          outline: none;
          background-color: transparent;
          &::before{
            left:0;
            top:0px;
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
        height:40px;
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
      display: block;
      .label-tip{
        font-size: 12px;
        color:#666;
      }
      .iconfont{
        font-size: 0;
      }
      input[type=checkbox]{
        opacity: 0;
      }
      &.active{
        background-color: $main-color;
        color: #fff;
        .label-tip{
          color: #fff;
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
          &.square{
            border-radius: 0;
          }
        }
      }
      &:last-child{
        border-bottom: 1px solid #eee;
      }
    }
  }
</style>
