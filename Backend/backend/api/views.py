from rest_framework.response import Response
from rest_framework.decorators import api_view
from .models import BusRoute
from .serializers import BusRouteSerializer

@api_view(['GET'])
def get_all_routes(request):
    bus_routes = BusRoute.objects.all()
    serializer = BusRouteSerializer(bus_routes, many=True)
    return Response(serializer.data)

@api_view(['POST'])
def add_bus_route(request):
    serializer = BusRouteSerializer(data=request.data)
    if serializer.is_valid():
        serializer.save()
        return Response({"message": "Bus route added successfully", "data": serializer.data}, status=201)
    return Response(serializer.errors, status=400)

@api_view(['GET', 'PUT', 'DELETE'])
def manage_bus_route(request, pk):
    try:
        bus_route = BusRoute.objects.get(pk=pk)
    except BusRoute.DoesNotExist:
        return Response({"error": "Bus route not found"}, status=404)

    if request.method == 'GET':
        serializer = BusRouteSerializer(bus_route)
        return Response(serializer.data)

    elif request.method == 'PUT':
        serializer = BusRouteSerializer(bus_route, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response({"message": "Bus route updated successfully", "data": serializer.data})
        return Response(serializer.errors, status=400)

    elif request.method == 'DELETE':
        bus_route.delete()
        return Response({"message": "Bus route deleted successfully"}, status=204)
