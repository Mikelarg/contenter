from rest_framework.response import Response
from rest_framework.viewsets import ReadOnlyModelViewSet

from contenter.apps.api.serializers import PageListSerializer, PageDetailSerializer
from contenter.apps.content.models import Page
from contenter.apps.content.tasks import counter_increment


class PageViewSet(ReadOnlyModelViewSet):
    """
    API страниц
    """
    queryset = Page.objects.all()

    def get_serializer_class(self):
        if self.action == "list":
            return PageListSerializer
        else:
            return PageDetailSerializer

    def get_queryset(self):
        if self.action == "list":
            return Page.objects.all()
        else:
            return Page.objects.all().prefetch_related('contenttopage_set', 'contenttopage_set__content')

    def retrieve(self, request, *args, **kwargs):
        """
        При детальном просмотре страницы прибавляем counter всему контенту внутри
        """
        instance = self.get_object()
        content_ids = map(lambda obj: obj['content'], instance.contenttopage_set.values('content'))
        for content_id in content_ids:
            counter_increment.delay(content_id)
        serializer = self.get_serializer(instance)
        return Response(serializer.data)
