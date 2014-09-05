from django.contrib import admin

# Register your models here.

from jokerepo.models import Joke

class JokeAdmin(admin.ModelAdmin): 
    fields = ['joke', 'tag', 'pub_date', 'rank'] 
    list_display = ('joke', 'pub_date', 'tag', 'rank')
    list_filter = ['tag'] 
    search_fields = ['joke', 'tag']

admin.site.register(Joke, JokeAdmin) 


