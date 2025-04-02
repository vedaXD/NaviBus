from django.contrib import admin
from .models import Ticket  # Import your model

# Register the model
@admin.register(Ticket)
class FeedbackAdmin(admin.ModelAdmin):
    list_display = ('id', 'category', 'description', 'created_at')  # Customize the list view
    search_fields = ('category', 'description')  # Enable search
    list_filter = ('category',)  # Add filter options
