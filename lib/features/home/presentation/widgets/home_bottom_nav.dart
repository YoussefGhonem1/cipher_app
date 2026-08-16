import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/l10n_extensions.dart';
import 'home_nav_item.dart';

class HomeBottomNav extends StatelessWidget {
  const HomeBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      color: AppColors.surfaceContainerLowest,
      child: Row(
        children: [
          Expanded(
            child: HomeNavItem(
              icon: Icons.grid_view,
              label: context.l10n.gamesTab,
              isSelected: true,
            ),
          ),
          Expanded(
            child: HomeNavItem(
              icon: Icons.military_tech_outlined,
              label: context.l10n.ranksTab,
              isSelected: false,
            ),
          ),
          Expanded(
            child: HomeNavItem(
              icon: Icons.folder_outlined,
              label: context.l10n.assetsTab,
              isSelected: false,
            ),
          ),
        ],
      ),
    );
  }
}
