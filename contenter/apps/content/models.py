from django.contrib.contenttypes.models import ContentType
from django.db import models
from polymorphic.models import PolymorphicModel


class Content(PolymorphicModel):
    """
    Контент
    """
    counter = models.PositiveIntegerField(default=0, verbose_name="Количество просмотров")
    title = models.CharField(max_length=256, verbose_name="Заголовок")

    def __str__(self):
        return "{0} — {1}".format(self.content_type(), self.title)

    def content_type(self):
        return ""

    class Meta:
        verbose_name = "Контент"
        verbose_name_plural = "Контент"


class VideoContent(Content):
    """
    Видео контент
    """
    video_url = models.URLField(verbose_name="Ссылка на видео")
    subtitles_url = models.URLField(verbose_name="Ссылка на субтитры")

    def content_type(self):
        return "Видео"

    class Meta:
        verbose_name = "Видео"
        verbose_name_plural = "Видео"


class AudioContent(Content):
    """
    Аудио контент
    """
    bitrate = models.PositiveIntegerField(verbose_name="Битрейт", help_text="bits/second")

    def content_type(self):
        return "Аудио"

    class Meta:
        verbose_name = "Аудио"
        verbose_name_plural = "Аудио"


class TextContent(Content):
    """
    Текстовый контент
    """
    text = models.TextField(verbose_name="Текст")

    def content_type(self):
        return "Текст"

    class Meta:
        verbose_name = "Текст"
        verbose_name_plural = "Текста"


class Page(models.Model):
    """
    Страница
    """
    title = models.CharField(max_length=256, verbose_name="Заголовок")
    content = models.ManyToManyField(to=Content, through="ContentToPage")

    def __str__(self):
        return self.title

    class Meta:
        verbose_name = "Страница"
        verbose_name_plural = "Страницы"
        ordering = ['id']


class ContentToPage(models.Model):
    """
    Связь страница — контент
    """
    page = models.ForeignKey(Page, on_delete=models.CASCADE)
    content = models.ForeignKey(Content, on_delete=models.CASCADE, verbose_name="Контент")
    order = models.PositiveIntegerField(default=0)

    def __str__(self):
        return "Контент — {0}".format(self.content.content_type())

    class Meta:
        ordering = ('order',)
