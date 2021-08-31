from django.core.cache import cache
from django.test import TestCase
from rest_framework.test import APIClient

from contenter.apps.content.models import Page, VideoContent, TextContent, AudioContent, ContentToPage
from contenter.celery import app


class PageTest(TestCase):
    def setUp(self):
        """
        Приготавливаем данные для тестов страницы / контент
        """
        cache._cache.flush_all()
        objs = []
        app.conf.update(CELERY_ALWAYS_EAGER=True)
        app.conf.update(CACHES=None)
        for i in range(7):
            objs.append(Page(title="Page {0}".format(i)))
        Page.objects.bulk_create(objs)
        video = VideoContent(title='Video', video_url='https://test.com', subtitles_url='https://test.com/subtitle')
        video.save()
        text = TextContent(title='Text', text='Some text')
        text.save()
        audio = AudioContent(title='Audio', bitrate=40960)
        audio.save()
        ContentToPage.objects.create(page=objs[0], content=video, order=2)
        ContentToPage.objects.create(page=objs[0], content=audio, order=0)
        ContentToPage.objects.create(page=objs[0], content=text, order=1)
        self.objs = objs
        self.client = APIClient()

    def tearDown(self) -> None:
        """
        Чистим кэш который лочит прибавление counter'а
        """
        cache._cache.flush_all()

    def test_list(self):
        """
        Проверяем что в списке нужные данные и правильный урл на детальный просмотр
        """
        response = self.client.get('/api/pages/')
        assert response.data['results'][0]['title'] == 'Page 0'
        assert response.data['results'][0]['detail_url'], '/api/pages/{0}/' == self.objs[0].pk

    def test_detail(self):
        """
        Проверям, что отдается контент с правильными данными и добавляется counter
        """
        response = self.client.get('/api/pages/{0}/'.format(self.objs[0].pk))
        assert response.data['title'] == 'Page 0'

        audio_content = response.data['contents'][0]['content']
        assert audio_content['title'] == 'Audio'
        assert audio_content['bitrate'] == 40960
        assert audio_content['resourcetype'] == 'AudioContent'
        assert audio_content['counter'] == 1

        text_content = response.data['contents'][1]['content']
        assert text_content['title'] == 'Text'
        assert text_content['text'] == 'Some text'
        assert text_content['resourcetype'] == 'TextContent'
        assert text_content['counter'] == 1

        video_content = response.data['contents'][2]['content']
        assert video_content['title'] == 'Video'
        assert video_content['video_url'] == 'https://test.com'
        assert video_content['subtitles_url'] == 'https://test.com/subtitle'
        assert video_content['resourcetype'] == 'VideoContent'
        assert video_content['counter'] == 1
