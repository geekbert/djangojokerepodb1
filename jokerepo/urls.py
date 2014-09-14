

from django.conf.urls import patterns, url

from jokerepo import views

urlpatterns = patterns('',
    url(r'^$', views.index, name='index'),
    url(r'^add_joke/$', views.add_joke, name='add_joke'), # NEW MAPPING!
    url(r'^quiz/$', views.quiz, name='quiz'), # NEW MAPPING!    

)
