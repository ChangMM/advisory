# -*-coding: utf8 -*-
from flask import Flask, session, redirect, url_for, escape, request, render_template, jsonify
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy.exc import IntegrityError, OperationalError
import re
from random import Random


app = Flask(__name__)
db = SQLAlchemy(app)

password = 'admin123456'
username = 'username'

# 处理数据库连接
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:Hustonline87542701@localhost/advisory'
app.config['SQLALCHEMY_COMMIT_ON_TEARDOWN'] = True


class Speed_advisory(db.Model):
    __tablename__ = 'speed_advisory'
    id = db.Column(db.Integer, primary_key=True)
    province = db.Column(db.String(25), default='')
    district = db.Column(db.String(25), default='')
    city = db.Column(db.String(25), default='')
    city_type = db.Column(db.String(25), default='')
    area = db.Column(db.String(25), default='')
    land = db.Column(db.String(25), default='')
    land_type = db.Column(db.String(25), default='')
    dis_high = db.Column(db.String(25), default='')
    dis_center = db.Column(db.String(25), default='')
    dis_airplane = db.Column(db.String(25), default='')
    center_money = db.Column(db.String(25), default='')
    business_money = db.Column(db.String(25), default='')
    people_num = db.Column(db.String(25), default='')
    people_200_num = db.Column(db.String(25), default='')
    view_type = db.Column(db.String(25), default='')
    city_num = db.Column(db.String(25), default='')
    has_place = db.Column(db.String(25), default='')
    name = db.Column(db.String(25), default='')
    phone = db.Column(db.String(25), default='')
    job = db.Column(db.String(25), default='')
    workplace = db.Column(db.String(25), default='')
    email = db.Column(db.String(25), default='')


class Meet_advisory(db.Model):
    __tablename__ = 'meet_advisory'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(25), default='')
    phone = db.Column(db.String(25), default='')
    job = db.Column(db.String(64), default='')
    workplace = db.Column(db.String(64), default='')
    email = db.Column(db.String(25), default='')
    job_type = db.Column(db.String(25), default='')
    city = db.Column(db.String(25), default='')
    area = db.Column(db.String(25), default='')
    money = db.Column(db.String(25), default='')
    money_from = db.Column(db.String(25), default='')
    info = db.Column(db.String(64), default='')
    info_more = db.Column(db.String(25), default='')
    feedback = db.Column(db.String(300), default='')
    random = db.Column(db.String(25), default='')



@app.route('/')
def index():  # 首页
    return redirect('/login')

@app.route('/login', methods=['GET'])
def login():
    if 'isLogin' in session:
        return redirect('/admin')
    else:
        return render_template('login.html')


@app.route('/admin', methods=['GET'])
def admin():
    if 'isLogin' in session:
        return render_template('admin.html')
    else:
        return redirect('/login')

@app.route('/meet_consult', methods=['GET'])
def meet_consult():
    return render_template('meet_consult.html')


@app.route('/speed_consult', methods=['GET'])
def speed_consult():
    return render_template('speed_consult.html')


@app.route('/api/login', methods=['GET', 'POST'])
def is_login():
    if request.method == 'GET':
        if session['isLogin']:
            return data2json('1')
        else:
            return data2json('2', msg = '尚未登陆')
    if request.method == 'POST':
        if (username == request.form['username']) and (password == request.form['password']):
            session['isLogin'] = True
            return data2json('1')
        else:
            return data2json('2', msg = '密码或者用户名错误')

@app.route('/api/logout')
def logout():  # 登出页
    session.pop('isLogin', None)
    return redirect('/login')


@app.route('/loginout')
def loginout():  # 登出页
    session.pop('isLogin', None)
    return redirect('/login')


@app.route('/api/add_speed', methods=['POST'])
def add_speed():  # 新增信息
    if request.method == 'POST':
        province = request.form['province']
        district = request.form['district']
        city = request.form['city']
        city_type = request.form['city_type']
        area = request.form['area']
        land = request.form['land']
        land_type = request.form['land_type']
        dis_high = request.form['dis_high']
        dis_center = request.form['dis_center']
        dis_airplane = request.form['dis_airplane']
        center_money = request.form['center_money']
        business_money = request.form['business_money']
        people_num = request.form['people_num']
        people_200_num = request.form['people_200_num']
        view_type = request.form['view_type']
        city_num = request.form['city_num']
        has_place = request.form['has_place']
        name =  request.form['name']
        phone = request.form['phone']
        job = request.form['job']
        workplace = request.form['workplace']
        email = request.form['email']

        user = Speed_advisory(province = province, district = district, city = city, city_type = city_type, area = area, land = land, land_type = land_type,
            dis_high = dis_high, dis_center = dis_center, dis_airplane = dis_airplane, center_money = center_money, business_money = business_money,
            people_num = people_num, people_200_num = people_200_num, view_type = view_type, city_num = city_num, has_place = has_place,name = name, email = email,phone = phone, job = job, workplace = workplace)
        try:
            db.session.add(user)
            db.session.commit()
        except OperationalError, e:
            print e.message
            db.session.rollback()
            return data2json('2', msg = '信息添加错误')
        return data2json('1')


@app.route('/api/delete_speed', methods=['POST'])
def delete_speed():  # 删除信息
    if request.method == 'POST':
        id = request.form['id']
        print id
        user = Speed_advisory.query.filter_by(id = id).first()
        try:
            db.session.delete(user)
            db.session.commit()
        except OperationalError, e:
            print e.message
            db.session.rollback()
            return data2json('2', msg = '信息删除错误，请重试')
        return data2json('1')

@app.route('/api/all_speed', methods=['GET', 'POST'])
def all_speed():
    speeds = Speed_advisory.query.all()
    speed_dic = []
    for i in speeds:
        speed_dic.append(speed_instance2dic(i))
    return data2json(1, data = speed_dic)


@app.route('/api/add_meet', methods=['POST'])
def add_meet():  # 新增信息
    if request.method == 'POST':
        city = request.form['city']
        job_type = request.form['job_type']
        area = request.form['area']
        money = request.form['money']
        money_from = request.form['money_from']
        name =  request.form['name']
        phone = request.form['phone']
        email = request.form['email']
        job = request.form['job']
        workplace = request.form['workplace']
        info = request.form['info']
        info_more = request.form['info_more']
        feedback = request.form['feedback']
        random = random_str()

        user = Meet_advisory(city = city, job_type = job_type, area = area, money = money, money_from = money_from, name = name, email = email,phone = phone, job = job, workplace = workplace, info = info, info_more = info_more, feedback = feedback, random = random)
        try:
            db.session.add(user)
            db.session.commit()
        except OperationalError, e:
            print e.message
            db.session.rollback()
            return data2json('2', msg = '信息添加错误')
        return data2json('1', data = random)


@app.route('/api/delete_meet', methods=['POST'])
def delete_meet():  # 删除信息
    if request.method == 'POST':
        id = request.form['id']
        user = Meet_advisory.query.filter_by(id = id).first()
        try:
            db.session.delete(user)
            db.session.commit()
        except OperationalError, e:
            print e.message
            db.session.rollback()
            return data2json('2', msg = '信息删除错误，请重试')
        return data2json('1')


@app.route('/api/all_meet', methods=['GET', 'POST'])
def all_meet():
    speeds = Meet_advisory.query.all()
    meet_dic = []
    for i in speeds:
        meet_dic.append(meet_instance2dic(i))
    return data2json(1, data = meet_dic)


@app.errorhandler(404)
def page_not_found(error):
    return render_template('404.html'), 404


def data2json(status, **args):
    data_before_json = {}.fromkeys(("status", "msg", "data"))
    if int(status) == 1:
        if args:
            data = args["data"]
        else:
            data = ""
        msg = "success"
    elif int(status) == 2:
        if args:
            msg = args['msg']
        else:
            msg = "fail"
        data = ""
    else:
        msg = args["msg"]
        data = args["data"]
    data_before_json["status"] = int(status)
    data_before_json["msg"] = msg
    data_before_json["data"] = data
    return jsonify(data_before_json)


def speed_instance2dic(instance):
    comment_dic = {}.fromkeys(('id' ,'province', 'district', 'city', 'city_type', 'area', 'land', 'land_type',
            'dis_high', 'dis_center', 'dis_airplane', 'center_money', 'business_money', 'people_num',
            'people_200_num', 'view_type', 'city_num', 'has_place', 'name', 'email', 'phone', 'job', 'workplace'))
    comment_dic['id'] = instance.id
    comment_dic['province'] = instance.province
    comment_dic['district'] = instance.district
    comment_dic['city'] = instance.city
    comment_dic['area'] = instance.area
    comment_dic['city_type'] = instance.city_type
    comment_dic['land'] = instance.land
    comment_dic['land_type'] = instance.land_type
    comment_dic['dis_high'] = instance.dis_high
    comment_dic['dis_center'] = instance.dis_center
    comment_dic['city_type'] = instance.city_type
    comment_dic['dis_airplane'] = instance.dis_airplane
    comment_dic['center_money'] = instance.center_money
    comment_dic['business_money'] = instance.business_money
    comment_dic['people_num'] = instance.people_num
    comment_dic['people_200_num'] = instance.people_200_num
    comment_dic['view_type'] = instance.view_type
    comment_dic['city_num'] = instance.city_num
    comment_dic['has_place'] = instance.has_place
    comment_dic['name'] = instance.name
    comment_dic['email'] = instance.email
    comment_dic['phone'] = instance.phone
    comment_dic['job'] = instance.job
    comment_dic['workplace'] = instance.workplace
    return comment_dic


def meet_instance2dic(instance):
    comment_dic = {}.fromkeys(('id','city', 'job_type', 'area', 'money', 'money_from', 'name', 'email', 'phone', 'job', 'workplace',
        'info', 'info_more', 'feedback', 'random'))
    comment_dic['id'] = instance.id
    comment_dic['city'] = instance.city
    comment_dic['area'] = instance.area
    comment_dic['job_type'] = instance.job_type
    comment_dic['money'] = instance.money
    comment_dic['money_from'] = instance.money_from
    comment_dic['name'] = instance.name
    comment_dic['email'] = instance.email
    comment_dic['phone'] = instance.phone
    comment_dic['job'] = instance.job
    comment_dic['workplace'] = instance.workplace
    comment_dic['info'] = instance.info
    comment_dic['info_more'] = instance.info_more
    comment_dic['feedback'] = instance.feedback
    comment_dic['random'] = instance.random
    return comment_dic


def random_str(randomlength = 5):
    str = ''
    chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
    length = len(chars) - 1
    random = Random()
    for i in range(randomlength):
        str+=chars[random.randint(0, length)]
    return str


app.secret_key = 'A0Zr98j/3yX R~XHH!jmN]LWX/,?RT'

if __name__ == '__main__':
    app.run(debug=True)
