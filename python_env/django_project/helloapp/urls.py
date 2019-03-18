from django.urls import path
from . import views

urlpatterns = [
    path('', views.hello , name='helloapp-hello_world') ,
] #no path for first argument because its relative to root variable in urls.py of django project
