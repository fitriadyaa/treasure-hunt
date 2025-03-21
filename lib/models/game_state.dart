import 'dart:math';

class GameState {
  static const int gridSize = 5;
  int playerX = 0;
  int playerY = 4; // Start at bottom-left
  int treasureX = 0;
  int treasureY = 0;
  int moves = 0;

  GameState() {
    reset();
  }

  void reset() {
    playerX = 0;
    playerY = 4;
    moves = 0;
    // Generate random treasure position that's not at player start
    final random = Random();
    do {
      treasureX = random.nextInt(gridSize);
      treasureY = random.nextInt(gridSize);
    } while (treasureX == playerX && treasureY == playerY);
  }

  bool move(String direction) {
    switch (direction) {
      case 'up':
        if (playerY > 0) {
          playerY--;
          moves++;
          return checkTreasure();
        }
        break;
      case 'down':
        if (playerY < gridSize - 1) {
          playerY++;
          moves++;
          return checkTreasure();
        }
        break;
      case 'left':
        if (playerX > 0) {
          playerX--;
          moves++;
          return checkTreasure();
        }
        break;
      case 'right':
        if (playerX < gridSize - 1) {
          playerX++;
          moves++;
          return checkTreasure();
        }
        break;
    }
    return false;
  }

  bool checkTreasure() {
    return playerX == treasureX && playerY == treasureY;
  }
}
