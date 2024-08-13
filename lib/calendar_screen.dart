import 'package:flutter/material.dart';
import 'package:walmart_1/event_details.dart';
import 'package:walmart_1/event_slots.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final List<Map<String, dynamic>> events = [
    {
      'date': 'Mon, Feb 20',
      'name': 'Mary Smith',
      'bookedSlot': 'Not Selected', // Initial state
    },
    {
      'date': 'Mon, Feb 29',
      'name': 'Will Smith',
      'bookedSlot': 'Not Selected', // Initial state
    }
  ];

  void _updateBookedSlot(int index, String selectedSlot) {
    setState(() {
      events[index]['bookedSlot'] = selectedSlot;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: events.isEmpty ? Color(0xFFF4F4F6) : Colors.white,
      body: events.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'lib/assets/no_events.png',
                    height: 320,
                  ),
                  SizedBox(height: 30),
                  Text(
                    'No Upcoming Events',
                    style: TextStyle(
                      color: Colors.blue.shade400,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Once an event is added it will appear here',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 50, 0, 20),
                  child: Text(
                    'Upcoming Events',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade400),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: events.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 20),
                        child: GestureDetector(
                          onTap: () async {
                            final selectedSlot = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EventSlotsScreen(
                                  event: events[index],
                                  onSlotSelected: (slot) =>
                                      _updateBookedSlot(index, slot),
                                ),
                              ),
                            );

                            if (selectedSlot != null) {
                              _updateBookedSlot(index, selectedSlot);
                            }
                          },
                          child: EventDetails(event: events[index]),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
