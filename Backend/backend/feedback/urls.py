from django.urls import path
from .views import ticket_list, ticket_detail

urlpatterns = [
    path('tickets/', ticket_list, name='ticket-list'),  # GET all & POST new ticket
    path('tickets/<int:pk>/', ticket_detail, name='ticket-detail'),  # GET, PUT, DELETE a ticket
]