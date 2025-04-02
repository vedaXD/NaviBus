from django.db import models

class BusRoute(models.Model):
    bus_no = models.CharField(max_length=10, unique=True)  # Route No.
    destination = models.CharField(max_length=255)  # Route Name & Origin-Destination
    route_length = models.FloatField()  # Route Length

    first_bus_mon_sat = models.CharField(max_length=20)  # First Bus Time (Mon-Sat)
    first_bus_sunday = models.CharField(max_length=20)  # First Bus Time (Sunday)
    
    last_bus_mon_sat = models.CharField(max_length=20)  # Last Bus Time (Mon-Sat)
    last_bus_sunday = models.CharField(max_length=20)  # Last Bus Time (Sunday)

    journey_time = models.CharField(max_length=50)  # Traveling Time in Minutes

    frequency_mon_sat = models.CharField(max_length=50)  # Frequency (Mon-Sat)
    frequency_sunday = models.CharField(max_length=50)  # Frequency (Sunday)

    fare = models.IntegerField()  # Fare in Rs

    def __str__(self):
        return f"Bus {self.bus_no} - {self.destination}"
