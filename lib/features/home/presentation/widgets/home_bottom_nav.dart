import 'package:cipher/core/utils/l10n_extensions.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import 'home_nav_item.dart';

class HomeBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const HomeBottomNav({
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      color: AppColors.surfaceContainerLowest,
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => onTap(0),
              child: HomeNavItem(
                icon: Icons.grid_view,
                label: context.l10n.gamesTab,
                isSelected: currentIndex == 0,
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => onTap(1),
              child: HomeNavItem(
                icon: Icons.menu_book_outlined, 
                label: context.l10n.assetsTab, 
                isSelected: currentIndex == 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}