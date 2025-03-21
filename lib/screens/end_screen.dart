import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../widgets/pixel_button.dart';
import 'game_screen.dart';

class EndScreen extends StatelessWidget {
  final int moves;

  const EndScreen({
    super.key,
    required this.moves,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Victory animation
            Lottie.network(
              'https://lottie.host/c1382882-7a6d-489c-98d9-99f2dcac7a42/zUXN40IBxF.json',
              width: 200,
              height: 200,
              repeat: true,
            ),
            const SizedBox(height: 24),
            Text(
              'Treasure Found!',
              style: GoogleFonts.pressStart2p(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Moves: $moves',
              style: GoogleFonts.pressStart2p(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 48),
            PixelButton(
              text: 'PLAY AGAIN',
              onPressed: () {
                Navigator.pushReplacement(
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
