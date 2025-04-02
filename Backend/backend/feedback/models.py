from django.db import models

class Ticket(models.Model):
    CATEGORY_CHOICES = [
        ("Bus Delay", "Bus Delay"),
        ("App Bug", "App Bug"),
        ("Payment Issue", "Payment Issue"),
        ("Driver Behavior", "Driver Behavior"),
        ("Other", "Other"),
    ]

    category = models.CharField(max_length=50, choices=CATEGORY_CHOICES)
    description = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.category} - {self.created_at.strftime('%Y-%m-%d %H:%M')}"
