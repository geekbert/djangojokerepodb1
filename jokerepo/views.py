from django.shortcuts import render, get_object_or_404

# Create your views here.

from django.http import HttpResponse

from jokerepo.models import Joke

def index(request):
    latest_joke_list = Joke.objects.order_by('-pub_date')[:5]
    output = ', '.join([j.joke for j in latest_joke_list])
    return HttpResponse(output)

#    context = {'latest_joke_list': latest_joke_list}
#    return render(request, 'jokerepo/index.html', context)
#   return HttpResponse("Hello, world. You're at the joke index.")

