import 'package:flutter/material.dart';

class MapWidget extends StatefulWidget{
  const MapWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MapWidgetState();
  }
}

class _MapWidgetState extends State<MapWidget>{
  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: Colors.white,
    );
  }
}