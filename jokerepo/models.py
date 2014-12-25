from django.db import models

# Create your models here.

import datetime


class Joke(models.Model):
    situation = models.CharField(max_length=150)
    joke = models.CharField(max_length=900)
    #pub_date = models.DateTimeField('date published')
    pub_date = models.DateField(blank=True, default=datetime.date.today)
    tag = models.CharField(max_length=4)
    rank = models.CharField(max_length=4, blank=True, null=True) 	
    
    def __unicode__(self):  # Python 3: def __str__(self):
        return self.situation
    def __unicode__(self):  # Python 3: def __str__(self):
        return self.joke
    def was_published_recently(self):
        return self.pub_date >= timezone.now() - datetime.timedelta(days=1)
    def __unicode__(self):  # Python 3: def __str__(self):
        return self.tag
    def __unicode__(self):  # Python 3: def __str__(self):
        return self.rank
	
