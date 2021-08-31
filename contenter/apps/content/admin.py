from adminsortable2.admin import SortableInlineAdminMixin
from django.contrib import admin
from polymorphic.admin import PolymorphicChildModelAdmin, PolymorphicChildModelFilter, PolymorphicParentModelAdmin

from contenter.apps.content.models import Page, VideoContent, Content, TextContent, AudioContent


class ContentInline(SortableInlineAdminMixin, admin.TabularInline):
    """
    Инлайн для связи страница — контент
    """
    model = Page.content.through


class ContentChildAdmin(PolymorphicChildModelAdmin):
    """
    Базовый класс для админок контента
    """
    base_model = Content
    readonly_fields = ['counter']
    show_in_index = True
    search_fields = ['title__startswith']


@admin.register(VideoContent)
class VideoContentAdmin(ContentChildAdmin):
    base_model = VideoContent
    list_display = ['title', 'video_url', 'subtitles_url']


@admin.register(TextContent)
class TextContentAdmin(ContentChildAdmin):
    base_model = TextContent
    list_display = ['title', 'text']


@admin.register(AudioContent)
class AudioContentAdmin(ContentChildAdmin):
    base_model = AudioContent
    list_display = ['title', 'bitrate']


@admin.register(Content)
class ContentAdmin(PolymorphicParentModelAdmin):
    """
    Админка контента с всеми его детьми
    """
    base_model = Content
    child_models = (VideoContent, TextContent, AudioContent)
    list_filter = (PolymorphicChildModelFilter,)
    search_fields = ['title__startswith']
    list_display = ['title', 'get_content_type']

    def get_content_type(self, obj):
        return obj.polymorphic_ctype.name
    get_content_type.short_description = "Тип контента"


@admin.register(Page)
class PageAdmin(admin.ModelAdmin):
    """
    Админка страниц
    """
    inlines = (ContentInline,)
    exclude = ['content']
    search_fields = ['title__startswith']
