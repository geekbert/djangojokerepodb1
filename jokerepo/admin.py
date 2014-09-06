from django.contrib import admin

# Register your models here.

from jokerepo.models import Joke

class JokeAdmin(admin.ModelAdmin): 
    fields = ['situation', 'joke', 'tag', 'pub_date', 'rank'] 
    list_display = ('situation', 'joke', 'pub_date', 'tag', 'rank')
    list_filter = ['tag'] 
    search_fields = ['joke', 'tag']

admin.site.register(Joke, JokeAdmin) 


