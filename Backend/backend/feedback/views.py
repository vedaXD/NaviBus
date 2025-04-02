from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework import status
from .models import Ticket
from .serializers import TicketSerializer

# Get all tickets and create a new one
@api_view(['GET', 'POST'])
def ticket_list(request):
    if request.method == 'GET':
        tickets = Ticket.objects.all().order_by('-created_at')
        serializer = TicketSerializer(tickets, many=True)
        return Response(serializer.data)

    elif request.method == 'POST':
        serializer = TicketSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response({"message": "Ticket submitted successfully!", "data": serializer.data}, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

# Get, update, or delete a specific ticket
@api_view(['GET', 'PUT', 'DELETE'])
def ticket_detail(request, pk):
    try:
        ticket = Ticket.objects.get(pk=pk)
    except Ticket.DoesNotExist:
        return Response({"error": "Ticket not found"}, status=status.HTTP_404_NOT_FOUND)

    if request.method == 'GET':
        serializer = TicketSerializer(ticket)
        return Response(serializer.data)

    elif request.method == 'PUT':
        serializer = TicketSerializer(ticket, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response({"message": "Ticket updated successfully!", "data": serializer.data})
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    elif request.method == 'DELETE':
        ticket.delete()
        return Response({"message": "Ticket deleted successfully!"}, status=status.HTTP_204_NO_CONTENT)
