import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'My Profile',
                style: GoogleFonts.poppins(
                  fontSize: 30,
                  color: Colors.black,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'Name:',
              style: GoogleFonts.poppins(
                fontSize: 20,
                color: const Color(0xFFB0B7BF),
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 10,),
            Center(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F3F3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'user name',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: Colors.black, // Color of the label text when not focused
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Email:',
              style: GoogleFonts.poppins(
                fontSize: 20,
                color: const Color(0xFFB0B7BF),
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 10,),
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F3F3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'user email',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: Colors.black, // Color of the label text when not focused
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Center(
                child: ElevatedButton(
                    onPressed: () async{
                      await Supabase.instance.client.auth.signOut();
                    },
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Color(0xFFECEDEE))
                  ),
                  child: Text(
                    'Sign Out',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: Colors.grey, // Color of the label text when not focused
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
