import 'package:flutter/material.dart';
import 'package:walmart_1/calendar_screen.dart';
import 'package:walmart_1/cart_screen.dart';
import 'package:walmart_1/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    CartScreen(),
    CalendarScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: _currentIndex == 0
                ? const Icon(Icons.shopping_cart, size: 35, color: Colors.blue)
                : const Icon(Icons.shopping_cart),
            label: '',  
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 1
                ? const Icon(Icons.calendar_month_outlined, size: 35, color: Colors.blue)
                : const Icon(Icons.calendar_month_outlined),
            label: '',  
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 2
                ? const Icon(Icons.person, size: 35, color: Colors.blue)
                : const Icon(Icons.person),
            label: '', 
          ),
        ],
        selectedFontSize: 14,
        unselectedFontSize: 12,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
