import 'package:flutter/material.dart';

class EventSlotsScreen extends StatefulWidget {
  final Map<String, dynamic> event;
  final Function(String) onSlotSelected;

  const EventSlotsScreen({required this.event, required this.onSlotSelected});

  @override
  _EventSlotsScreenState createState() => _EventSlotsScreenState();
}

class _EventSlotsScreenState extends State<EventSlotsScreen> {
  String? selectedSlot;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select your slot Timings',
          style: TextStyle(color: Colors.blue.shade400),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Center the event details at the top
            Center(
              child: Column(
                children: [
                  Text(
                    widget.event['name']!,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Text(
                    widget.event['date']!,
                    style: TextStyle(fontSize: 22),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            // Create a list of time slots from 10 AM to 8 PM
            Expanded(
              child: ListView.builder(
                itemCount: 11, // 10 AM to 8 PM = 11 time slots
                itemBuilder: (context, index) {
                  final hour = 10 + index; // Start from 10 AM
                  final amPm = hour < 12 ? 'AM' : 'PM';
                  final displayHour = hour > 12 ? hour - 12 : hour;
                  final timeSlot = '$displayHour $amPm ';

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedSlot = timeSlot;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: selectedSlot == timeSlot
                            ? Colors.blueAccent
                            : Colors.white,
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            timeSlot,
                            style: TextStyle(
                              fontSize: 18,
                              color: selectedSlot == timeSlot
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            // Make the button wider with customized colors
            Container(
              width: double.infinity, // Full width
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade400),
                onPressed: () {
                  if (selectedSlot != null) {
                    widget.onSlotSelected(selectedSlot!);
                    Navigator.pop(context);
                  } else {
                    // Show a snackbar or alert to notify the user to select a slot
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content:
                            Text('Please select a slot before submitting.'),
                      ),
                    );
                  }
                },
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
