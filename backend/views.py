from django.shortcuts import render 

def home(request):
    context = {
        'stylesheet': '../style.css'
    }
    return render(request, 'index.html', context)
