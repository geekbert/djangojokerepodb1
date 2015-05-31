from django.shortcuts import render, get_object_or_404

# Create your views here.

from django.http import HttpResponse
from jokerepo.models import Joke
from jokerepo.forms import JokeForm 
from django.template import RequestContext
from django.shortcuts import render_to_response

def index(request):
    latest_joke_list = Joke.objects.order_by('-pub_date')[:10] # to access-protect data
    output = '<br/>'.join([j.situation+" - "+j.joke+" - "+j.tag for j in latest_joke_list])
    return HttpResponse(output)

#    context = {'latest_joke_list': latest_joke_list}
#    return render(request, 'jokerepo/index.html', context)
#   return HttpResponse("Hello, world. You're at the joke index.")

def add_joke(request):
    # Get the context from the request.
    context = RequestContext(request)

    # A HTTP POST?
    if request.method == 'POST':
        form = JokeForm(request.POST)

        # Have we been provided with a valid form?
        if form.is_valid():
            # Save the new category to the database.
            form.save(commit=True)

            # Now call the index() view.
            # The user will be shown the homepage.
            return index(request)
        else:
            # The supplied form contained errors - just print them to the terminal.
            print form.errors
    else:
        # If the request was not a POST, display the form to enter details.
        form = JokeForm()

    # Bad form (or form details), no form supplied...
    # Render the form with error messages (if any).
    return render_to_response('jokerepo/add_joke.html', {'form': form}, context)


import random

def quiz(request):
    max = len(Joke.objects.all()) 
    r = random.randint(0,max-1) 
   
    context = RequestContext(request)
   
    #latest_joke_list = Joke.objects.order_by('-pub_date')[:100]
    #output = '<br/>'.join([j.situation+" - "+j.joke+" - "+j.tag for j in latest$
    
    # NOTE: the below 2 are queried in quiz.html via key, value in output.items
    # Q: how to add third attribute TAG ? 
    output1 = Joke.objects.all()[r].situation
    output2 = Joke.objects.all()[r].joke
    output3 = Joke.objects.all()[r].tag
    output4 = Joke.objects.all()[r].rank
    # NEW 2015: I AM A DUMMY - BELOW IS BRACKET FOR DICTIONARY - ONLY KEY AND VALUE SENT TO QUIZ.HTML
    #output = {output1:output4}

    #NEW output using lists as stacks - SUCCESSFULLY SENT TO QUIZ.HTML
    # KEY WAS TO UNDERSTAND PYTHON DATA TYPES
    output = []
    output.append(output1)
    output.append(output2)
    output.append(output3)
    output.append(output4)
    
    #output = Joke.objects.all()[r].situation 
    #return HttpResponse(output)
    
    return render(request, 'jokerepo/quiz.html', {'output': output})
    
    # HOW TO REFER TO VIEWS.PY DATA IN QUIZ.HTML 
    # https://docs.djangoproject.com/en/1.8/topics/templates/ 
    # Dictionary lookup, attribute lookup and list-index lookups are implemented with a dot notation:
    # {{ my_dict.key }}
    # {{ my_object.attribute }}
    # {{ my_list.0 }}
    # {{ output }}

    # https://docs.djangoproject.com/en/1.8/intro/tutorial03/ 
