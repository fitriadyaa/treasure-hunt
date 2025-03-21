import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/game_icons.dart';

class PixelTreasure extends StatelessWidget {
  const PixelTreasure({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: const Iconify(
        GameIcons.treasure_map,
        color: Colors.amber,
        size: 24,
      ),
    );
  }
}
