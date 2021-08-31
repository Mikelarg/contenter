import os

from celery import Celery

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'contenter.settings')

app = Celery('contenter')
app.config_from_object('django.conf:settings', namespace='CELERY')
app.autodiscover_tasks()
