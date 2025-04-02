from django.urls import path, include
from django.contrib import admin

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include('api.urls')),  # API routes for 'api' app
    path('feedback/', include('feedback.urls')),  # Make sure feedback is properly included
]