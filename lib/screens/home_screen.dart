import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/pixel_button.dart';
import 'game_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Pixel\nTreasure Hunt',
              textAlign: TextAlign.center,
              style: GoogleFonts.pressStart2p(
                fontSize: 32,
                color: Colors.white,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 48),
            PixelButton(
              text: 'START',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GameScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
