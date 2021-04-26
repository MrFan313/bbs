"""
WSGI config for bbs project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/2.0/howto/deployment/wsgi/
"""

import os

from django.core.wsgi import get_wsgi_application

#import sys
#
#sys.path.append('E:\Python_Code\bbs\bbs')
#
## 加入本项目的虚拟环境(当两个django项目使用不同版本时，这可能非常有用)
#virtualenv_dir = 'E:\Python_Code\virtualenv\bbs\Lib\site-packages'  # 虚拟环境python包文件夹
#sys.path.insert(0, virtualenv_dir)  # 加入导包路径

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "bbs.settings")

application = get_wsgi_application()
