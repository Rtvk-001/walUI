import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallace/pages/login_page.dart';
import 'package:wallace/pages/sign_up_page.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<StartPage> {
  @override
  Widget build(context) {
    return (Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset('assets/images/blogpixan5-1024x1002-1.webp',width: 400,height: 400,),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/shopping-bag6504.jpg',
                  width: 50,
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Wallace',
                          style: GoogleFonts.poppins(
                            fontSize: 22,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )
                ),
              ],
            ),
            Text(
              'Your Reliable In-Store Shopping Companion',
              style: GoogleFonts.poppins(
                fontSize: 20,
                color: Colors.black,
              ),
              textAlign: TextAlign.left,
            ),
            Container(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                    return const LoginPage();
                  }));
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(const Color(0xFF007FC6)),
                ),
                child: Text('Login',style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: Colors.white,
                ),),
              ),
            ),
            Container(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                      return const SignUpPage();
                    }));
                  },
                  style: ButtonStyle(
                    side: WidgetStateProperty.all(
                      const BorderSide(color: Colors.black)
                    )
                  ),
                  child: Text('sign-up',style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: Colors.black,
                  ),)
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
