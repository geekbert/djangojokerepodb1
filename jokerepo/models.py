from django.db import models

# Create your models here.


class Joke(models.Model):
    joke = models.CharField(max_length=400)
    pub_date = models.DateTimeField('date published')
    tag = models.CharField(max_length=3)
    rank = models.CharField(max_length=3, blank=True, null=True) 	

    def __unicode__(self):  # Python 3: def __str__(self):
        return self.joke
    def was_published_recently(self):
        return self.pub_date >= timezone.now() - datetime.timedelta(days=1)
    def __unicode__(self):  # Python 3: def __str__(self):
        return self.tag
    def __unicode__(self):  # Python 3: def __str__(self):
        return self.rank
	
