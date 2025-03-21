import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/game_icons.dart';

class PixelPlayer extends StatelessWidget {
  const PixelPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: const Iconify(
        GameIcons.player_time,
        color: Colors.red,
        size: 24,
      ),
    );
  }
}
