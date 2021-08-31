from contenter.apps.content.models import Content
from contenter.apps.content.utils import lock_transaction
from contenter.celery import app


@app.task(bind=True)
def counter_increment(self, content_id):
    """
    Инкрементируем counter в content'е
    """
    with lock_transaction('content_id.{}'.format(content_id), self.app.oid) as acquired:
        if not acquired:
            self.retry(countdown=1)
        content = Content.objects.get(id=content_id)
        content.counter += 1
        content.save()

