#coding = utf-8
'''
    标题
    @name:
    @function:
    @author: Mr.Fan
    @date:2020--  
'''
from django.urls import path
from home.views import IndexView,ListView,PublishView,DetailView,ReplyView,QuoteView

urlpatterns = [
    #参数1:路由
    #参数2:视图函数名
    # path('hello/',HelloView.as_view()),
    #首页
    path('',IndexView.as_view(),name = 'index'),
    #列表页面
    path('list/',ListView.as_view(),name = 'list'),
    #发帖页面
    path('publish/',PublishView.as_view(),name = 'publish'),
    # 详情页面
    path('detail/<int:id>/',DetailView.as_view(),name = 'detail'),
    #评论页面
    path('reply/',ReplyView.as_view(),name = 'reply'),
    #回复功能
    path('quote/',QuoteView.as_view(),name = 'quote'),
]