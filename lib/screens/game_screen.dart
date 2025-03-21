import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/game_state.dart';
import '../widgets/pixel_button.dart';
import 'end_screen.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late GameState gameState;

  @override
  void initState() {
    super.initState();
    gameState = GameState();
  }

  void _move(String direction) {
    setState(() {
      if (gameState.move(direction)) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => EndScreen(moves: gameState.moves),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Moves: ${gameState.moves}',
                    style: GoogleFonts.pressStart2p(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                  ),
                  itemCount: 25,
                  itemBuilder: (context, index) {
                    final x = index % 5;
                    final y = index ~/ 5;
                    final isPlayer =
                        x == gameState.playerX && y == gameState.playerY;
                    final isTreasure =
                        x == gameState.treasureX && y == gameState.treasureY;

                    return Container(
                      decoration: BoxDecoration(
                        color: isPlayer
                            ? Colors.red
                            : isTreasure
                                ? Colors.yellow
                                : Colors.green[900],
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  PixelButton(
                    text: 'UP',
                    onPressed: () => _move('up'),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PixelButton(
                        text: 'LEFT',
                        onPressed: () => _move('left'),
                      ),
                      const SizedBox(width: 8),
                      PixelButton(
                        text: 'RIGHT',
                        onPressed: () => _move('right'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  PixelButton(
                    text: 'DOWN',
                    onPressed: () => _move('down'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
