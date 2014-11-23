from django.contrib import admin

# Register your models here.

from jokerepo.models import Joke

# Moved this to end to allow newly defined actions to be read in
#class JokeAdmin(admin.ModelAdmin):
#    fields = ['situation', 'joke', 'tag', 'pub_date', 'rank']
#    list_display = ('situation', 'joke', 'pub_date', 'tag', 'rank')
#    list_filter = ['tag']
#    search_fields = ['joke', 'tag']
#    actions = [export_csv, backup]

from django.http import HttpResponse

# ... export functions will go here ...
def export_csv(modeladmin, request, queryset):
    import csv
    from django.utils.encoding import smart_str
    response = HttpResponse(mimetype='text/csv')
    response['Content-Disposition'] = 'attachment; filename=mymodel.csv'
    writer = csv.writer(response, csv.excel)
    response.write(u'\ufeff'.encode('utf8')) # optional...Excel needs it to ope$
    writer.writerow([
        smart_str(u"ID"),
        smart_str(u"situation"),
        smart_str(u"joke"),
    ])
    for obj in queryset:
        writer.writerow([
            smart_str(u"ID"),
            smart_str(u"situation"),
            smart_str(u"joke"),
    ])
    for obj in queryset:
        writer.writerow([
            smart_str(obj.pk),
            smart_str(obj.situation),
            smart_str(obj.joke),
        ])
    return response
export_csv.short_description = u"Export CSV"


class MyModelAdmin(admin.ModelAdmin):
    actions = [export_csv]    

from django.core.files import File

def backup(modeladmin, request, queryset):
    """Return Sqlite3 db file, if Sqlite3 db is used."""
    from django.conf import settings
    from django.core.files import File
    db_engine = settings.DATABASES['default']['ENGINE']

    if db_engine == 'django.db.backends.sqlite3':
        db_path = settings.DATABASES['default']['NAME']
        dbfile = File(open(db_path, "rb"))
        response = HttpResponse(dbfile, mimetype='application/x-sqlite3')
        response['Content-Disposition'] = 'attachment; filename=jokerepo.sqlite'
        response['Content-Length'] = dbfile.size

    return response
backup.short_description = u"Download as sqlite "


class Backup(admin.ModelAdmin):
    actions = [backup]

from jokerepo.models import Joke

class JokeAdmin(admin.ModelAdmin):
    fields = ['situation', 'joke', 'tag', 'pub_date', 'rank']
    list_display = ('situation', 'joke', 'pub_date', 'tag', 'rank')
    list_filter = ['tag']
    search_fields = ['joke', 'tag']
    actions = [export_csv, backup] # from django admin actions doc


admin.site.register(Joke, JokeAdmin) # can only register 2 at same time

