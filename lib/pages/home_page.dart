import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:wallace/widget/map_widget.dart';
import 'package:wallace/widget/profile_widget.dart';
import 'package:wallace/widget/slot_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const MapWidget(),
    const SlotWidget(),
    const ProfileWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(

        iconSize: 27,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Center(
              child: Icon(
                Icons.shopping_cart,
                 // Adjust icon size as needed
                color: _currentIndex == 0 ? Colors.blue : Colors.grey,
              ),
            ),
            label: 'Store Map',
          ),
          BottomNavigationBarItem(
            icon: Center(
              child: Icon(
                Icons.calendar_month_outlined,
                 // Adjust icon size as needed
                color: _currentIndex == 1 ? Colors.blue : Colors.grey,
              ),
            ),
            label: 'Book Slot'
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
               // Adjust icon size as needed
              color: _currentIndex == 2 ? Colors.blue : Colors.grey,
            ),
            label: 'My Profile'
          ),
        ],
        selectedFontSize: 14,
        unselectedFontSize: 12,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        backgroundColor: const Color(0xFFF3F3F3),
        type: BottomNavigationBarType.fixed,
      ),
      backgroundColor: Colors.white,
    );
  }
}
