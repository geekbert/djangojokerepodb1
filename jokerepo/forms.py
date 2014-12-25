
from django import forms

from jokerepo.models import Joke

class JokeForm(forms.ModelForm):
    situation = forms.CharField(max_length=150, help_text="Situation")
    joke = forms.CharField(max_length=900, help_text="Joke")
   # pub_date = forms.DateTimeField('date published', help_text= "date")
    tag = forms.CharField(max_length=4, help_text= 'tag')
    rank = forms.CharField(max_length=4, help_text= "rank")


   # views = forms.IntegerField(widget=forms.HiddenInput(), initial=0)
   # likes = forms.IntegerField(widget=forms.HiddenInput(), initial=0)

    # An inline class to provide additional information on the form.
    class Meta:
        # Provide an association between the ModelForm and a model
        model = Joke
