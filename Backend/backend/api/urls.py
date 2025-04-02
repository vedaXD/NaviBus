from django.urls import path
from .views import get_all_routes, add_bus_route, manage_bus_route

urlpatterns = [
    path('busroutes/', get_all_routes, name='busroute-list'),
    path('busroutes/add/', add_bus_route, name='busroute-add'),
    path('busroutes/<int:pk>/', manage_bus_route, name='busroute-manage'),
]
