# Generated by Django 2.2.24 on 2021-08-29 17:14

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('contenttypes', '0002_remove_content_type_name'),
    ]

    operations = [
        migrations.CreateModel(
            name='Content',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('counter', models.PositiveIntegerField(default=0, verbose_name='Количество просмотров')),
                ('title', models.CharField(max_length=256, verbose_name='Заголовок')),
                ('polymorphic_ctype', models.ForeignKey(editable=False, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='polymorphic_content.content_set+', to='contenttypes.ContentType')),
            ],
            options={
                'abstract': False,
                'base_manager_name': 'objects',
            },
        ),
        migrations.CreateModel(
            name='ContentToPage',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('order', models.PositiveIntegerField(default=0)),
                ('content', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='content.Content')),
            ],
            options={
                'ordering': ('order',),
            },
        ),
        migrations.CreateModel(
            name='AudioContent',
            fields=[
                ('content_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='content.Content')),
                ('bitrate', models.PositiveIntegerField(verbose_name='Битрейт')),
            ],
            options={
                'abstract': False,
                'base_manager_name': 'objects',
            },
            bases=('content.content',),
        ),
        migrations.CreateModel(
            name='TextContent',
            fields=[
                ('content_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='content.Content')),
                ('text', models.TextField(verbose_name='Текст')),
            ],
            options={
                'abstract': False,
                'base_manager_name': 'objects',
            },
            bases=('content.content',),
        ),
        migrations.CreateModel(
            name='VideoContent',
            fields=[
                ('content_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='content.Content')),
                ('video_url', models.URLField(verbose_name='Ссылка на видео')),
                ('subtitles_url', models.URLField(verbose_name='Ссылка на субтитры')),
            ],
            options={
                'abstract': False,
                'base_manager_name': 'objects',
            },
            bases=('content.content',),
        ),
        migrations.CreateModel(
            name='Page',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=256, verbose_name='Заголовок')),
                ('content', models.ManyToManyField(through='content.ContentToPage', to='content.Content')),
            ],
        ),
        migrations.AddField(
            model_name='contenttopage',
            name='page',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='content.Page'),
        ),
    ]
