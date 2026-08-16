import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/l10n_extensions.dart';

class GamePlaceholderScreen extends StatelessWidget {
  final String gameId;

  const GamePlaceholderScreen({required this.gameId, super.key});

  @override
  Widget build(BuildContext context) {
    final title = switch (gameId) {
      'spyfall' => context.l10n.spyfallTitle,
      'charades' => context.l10n.charadesTitle,
      _ => context.l10n.gameUnderConstruction,
    };

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            context.l10n.gameUnderConstruction,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
    );
  }
}
