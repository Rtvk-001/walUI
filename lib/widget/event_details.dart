import 'package:flutter/material.dart';

class EventDetails extends StatelessWidget {
  final Map<String, dynamic> event;

  const EventDetails({required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(12, 20, 12, 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event['date']!,
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
                SizedBox(height: 8),
                Text(
                  event['name']!,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          // Align "Your Slot" text to the right side
          Text(
            'Your Slot: ${event['bookedSlot']}',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}