from rest_framework import serializers
from rest_framework.reverse import reverse
from rest_polymorphic.serializers import PolymorphicSerializer

from contenter.apps.content.models import Page, VideoContent, AudioContent, TextContent, ContentToPage


class VideoContentSerializer(serializers.ModelSerializer):
    class Meta:
        model = VideoContent
        fields = ('id', 'title', 'video_url', 'subtitles_url', 'counter')


class AudioContentSerializer(serializers.ModelSerializer):
    class Meta:
        model = AudioContent
        fields = ('id', 'title', 'bitrate', 'counter')


class TextContentSerializer(serializers.ModelSerializer):
    class Meta:
        model = TextContent
        fields = ('id', 'title', 'text', 'counter')


class ContentSerializer(PolymorphicSerializer):
    """
    Общий сериализатор для контента
    """
    model_serializer_mapping = {
        VideoContent: VideoContentSerializer,
        AudioContent: AudioContentSerializer,
        TextContent: TextContentSerializer
    }


class ContentToPageSerializer(serializers.ModelSerializer):
    """
    Сериализатор связи страница — контент
    """
    content = ContentSerializer()

    class Meta:
        model = ContentToPage
        fields = ['content']


class PageDetailSerializer(serializers.ModelSerializer):
    """
    Сериализатор страниц
    """
    contents = serializers.SerializerMethodField()

    def get_contents(self, obj):
        """
        Сортируем контент по order'ам
        """
        qs = obj.contenttopage_set.order_by('order')
        return ContentToPageSerializer(qs, many=True).data

    class Meta:
        model = Page
        fields = ['id', 'title', 'contents']


class PageListSerializer(serializers.ModelSerializer):
    """
    Сериализатор списка страниц
    """
    detail_url = serializers.SerializerMethodField()

    def get_detail_url(self, obj):
        """
        Получаем ссылку на детальный просмотр страницы
        """
        return self.context['request'].build_absolute_uri(reverse('page-detail', args=[obj.pk]))

    class Meta:
        model = Page
        fields = ['id', 'title', 'detail_url']
