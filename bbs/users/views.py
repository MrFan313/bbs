from django.shortcuts import render,redirect
from django.views import View
from django.http.response import HttpResponse
from users.models import User
from django.urls import reverse
import hashlib
# Create your views here.
class RegisterView(View):

    def get(self,request):
        """
          提供注册界面
          :param request: 请求对象
          :return: 注册界面
        """
        return render(request,'register.html')

    def post(self,request):
        '''
        1,接收参数
        2.验证参数
        3,密码加密
        4,数据入库
        5,返回响应
        :param request:
        :return:
        '''
        # 1, 接收参数
        username = request.POST.get('username')
        password1 = request.POST.get('password1')
        password2 = request.POST.get('password2')
        # 2. 验证参数
        if not all([username,password1,password2]):
            context = {
                'username':username,
                'password1':password1,
                'password2':password2,
                'errmsg':'参数不全'
            }
            return render(request,'register.html',context=context)
        # 3, 密码加密
        # from django.contrib.auth.hashers import make_password
        # hash_password = make_password(password1)
        # 4, 数据入库
        try:
            user = User.objects.create(
                username=username,
                password=hashlib.md5(password1.encode()).hexdigest()
            )
        except Exception as e:
            context = {
                'username':username,
                'password1':password1,
                'password2':password2,
                'errmsg':'创建失败'
            }
            return render(request,'register.html',context=context)
        #设置登录状态
        request.session['id'] = user.id
        request.session['name'] = user.username
        # 5, 返回响应
        return redirect(reverse('home:index'))
        return HttpResponse("注册成功")


class LoginView(View):

    def get(self,request):
        return render(request,'login.html')

    def post(self,request):
        '''
        1,接收数据
        2,验证数据
        3,根据用户名查询用户
        4,判断密码
        5,设置登录状态
        6,跳转到首页
        :param request:
        :return:
        1,接收参数
        2,验证参数
        3,判断用户信息
        4,设置登录信息
        5,返回相应
        '''
        # 1, 接收数据
        username = request.POST.get('username')
        password = request.POST.get('password1')
        # 2, 验证数据(省略)
        if not all([username, password]):
            context = {
                'username': username,
                'password1': password,
                'errmsg': '参数不全'
            }
            return render(request, 'login.html', context=context)
        # 3, 根据用户名查询用户
        try:
            user = User.objects.get(username=username,password=hashlib.md5(password.encode()).hexdigest())
        except User.DoesNotExist:
            context = {
                'errmsg': '账号或密码错误'
            }
            return render(request,'login.html',context = context)
        else:
            #设置登录信息
            request.session['id'] = user.id
            request.session['name'] = user.username
            # 6, 返回相应
            return redirect(reverse('home:index'))


class LogoutView(View):

    def get(self,request):
        #删除session
        del request.session['id']
        #跳转到首页
        return redirect(reverse('home:index'))