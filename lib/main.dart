import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:wallace/pages/home_page.dart';
import 'package:wallace/pages/login_page.dart';
import 'package:wallace/pages/start_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Supabase
  await Supabase.initialize(
    url: 'https://hjlhfgdgonvbcwrlseci.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhqbGhmZ2Rnb252YmN3cmxzZWNpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjM1NTYzNTcsImV4cCI6MjAzOTEzMjM1N30.Cf7KVRHI2ic6lxanSHD36TQJQUeXVQQoSn8jo7a1nYI',
  );

  runApp(MaterialApp(
    home: StreamBuilder(
      stream: Supabase.instance.client.auth.onAuthStateChange,
      builder: (context, snapshot) {
        // Show a loading spinner while waiting for the connection to be established
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: SpinKitWave(color: Colors.white),
          );
        }

        // Check if snapshot has data and if the session is valid
        if (snapshot.hasData && snapshot.data != null) {
          final session = snapshot.data!.session;

          if (session != null && session.user != null) {
            // User is signed in
            return const HomePage();
          }
        }

        // If no session is found, show the StartPage
        return const StartPage();
      },
    ),
  ));
}

