import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        // logo
        Padding(
          padding: EdgeInsets.only(left: 80, right: 80, bottom: 40, top: 160),
          child: Image.asset("assets/images/1-40.png"),
        ),
        //we deliver groceries at your doorstep
        Text(
          "We deliver groceries at your doorstep",
          textAlign: TextAlign.center,
          style: GoogleFonts.notoSerif(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 24,
        ),
        //fresh items everyday
        Text("Fresh items everyday"),
        Spacer(),
        // SizedBox(
        //   height: 12,
        // ),
        // get started button
        GestureDetector(
          onTap: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return HomePage();
              },
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.all(24),
            child: Text(
              "Get Started",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        Spacer(),
      ]),
    );
  }
}
