import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/game_state.dart';
import '../widgets/d_pad_button.dart';
import '../widgets/pixel_treasure.dart';
import '../widgets/pixel_player.dart';
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
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white24, width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  margin: const EdgeInsets.all(16),
                  child: GridView.builder(
                    padding: const EdgeInsets.all(4),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
                          color: Colors.green[900],
                          border: Border.all(
                            color: Colors.green[800]!,
                            width: 1,
                          ),
                        ),
                        child: isPlayer
                            ? const PixelPlayer()
                            : isTreasure
                                ? const PixelTreasure()
                                : null,
                      );
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // D-pad background
                  Container(
                    width: 180,
                    height: 180,
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white24, width: 2),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                  ),
                  // D-pad buttons
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DPadButton(
                        direction: 'up',
                        onPressed: () => _move('up'),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          DPadButton(
                            direction: 'left',
                            onPressed: () => _move('left'),
                          ),
                          const SizedBox(width: 60),
                          DPadButton(
                            direction: 'right',
                            onPressed: () => _move('right'),
                          ),
                        ],
                      ),
                      DPadButton(
                        direction: 'down',
                        onPressed: () => _move('down'),
                      ),
                    ],
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
