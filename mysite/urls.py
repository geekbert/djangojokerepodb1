from django.conf.urls import patterns, include, url

from jokerepo import views 

from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'mysite.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),
    
    url(r'^jokerepo/', include('jokerepo.urls')),
    url(r'^admin/', include(admin.site.urls)),
   # url(r'^add_joke/$', views.add_joke, name='add_joke'), # NEW MAPPING!
)
