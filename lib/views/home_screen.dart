import 'package:flutter/material.dart';
import 'package:kgp2_mark1/views/nudity_screen.dart';
import 'package:kgp2_mark1/views/profanity_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        height: MediaQuery.of(context).size.height * .5,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('CHOOSE AN OPTION',
                style: TextStyle(
                  fontSize: 25,
                )),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                  return ProfanityScreen();
                }));
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(21)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: const Text('Text Profanity',
                  style: TextStyle(
                    fontSize: 30,
                  )),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                  return NudityScreen();
                }));
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(21)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: const Text('Nudity Detection',
                  style: TextStyle(
                    fontSize: 30,
                  )),
            ),
          ],
        ),
      )),
    );
  }
}
