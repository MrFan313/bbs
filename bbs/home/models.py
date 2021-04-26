from django.db import models

# Create your models here.
'''

class ModelName(models.Model):
    field_name = models.字段类型(字段选项)
    
'''
#分类管理
class CategoryModel(models.Model):
    # id字段是django自动为我们添加的
    #我们可以不用添加
    #分类名
    #CharField字段类型
    #max_length最大长度
    #unique 唯一的分类名称 不能重复
    #verbose_name 主要是admin后台展示使用
    name = models.CharField(max_length=20,unique=True,verbose_name='分类名')

    #分类的父级id
    #Foreignkey 外键
    #self 设置自关联
    #on_delete 设置外键的级联操作
    #null 允许数据库数据为null
    #blank 主要是表单可以为空
    parent = models.ForeignKey('self',on_delete=models.SET_NULL,null=True,blank=True,verbose_name='父级分类id')

    #和admin相关
    def __str__(self):
        return self.name

    #修改表选项
    class Meta:
        #修改表名
        db_table = 'tb_category'
        #和admin后台相关
        verbose_name = '分类管理'
        verbose_name_plural = verbose_name

#文章管理
class ArticleModel(models.Model):

    StatusEnum = (
        (0,'未审核'),
        (1,'已审核'),
        (2,'已下架'),
    )

    title=models.CharField(max_length=50,verbose_name='标题')
    content=models.TextField(verbose_name='内容')
    category=models.ForeignKey(CategoryModel,on_delete=models.SET_NULL,null=True,verbose_name='分类')
    user=models.ForeignKey('users.User',on_delete=models.SET_NULL,null=True,verbose_name='用户')
    publish_time=models.DateTimeField(auto_now_add=True,verbose_name='发布日期')
    status=models.SmallIntegerField(choices=StatusEnum,default=0,verbose_name='状态')
    read_count=models.IntegerField(default=0,verbose_name='阅读量')
    comments = models.IntegerField(default=0,verbose_name='评论量')

    def __str__(self):
        return self.title

    class Meta:
        db_table='tb_article'
        verbose_name = '文章管理'
        verbose_name_plural = verbose_name

#评论管理
class CommentModel(models.Model):

    content=models.TextField(verbose_name='评论内容')
    article=models.ForeignKey(ArticleModel,on_delete=models.SET_NULL,null=True,verbose_name='评论文章id')
    user=models.ForeignKey('users.User',on_delete=models.SET_NULL,null=True,verbose_name='用户')
    create_time=models.DateTimeField(auto_now_add=True,verbose_name='评论时间')
    parent=models.ForeignKey('self',on_delete=models.SET_NULL,null=True,verbose_name='引用id')

    def __str__(self):
        return self.article.title

    class Meta:
        db_table='tb_comment'
        verbose_name = '评论管理'
        verbose_name_plural = verbose_name