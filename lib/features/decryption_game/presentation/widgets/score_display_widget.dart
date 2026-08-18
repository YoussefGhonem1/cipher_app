import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/l10n_extensions.dart';

class ScoreDisplayWidget extends StatelessWidget {
  final int score;

  const ScoreDisplayWidget({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 40.h),
      color: AppColors.surfaceContainerLow,
      child: Column(
        children: [
          Text(
            score.toString(),
            style: theme.textTheme.displayLarge?.copyWith(
              fontSize: 140.sp,
              color: AppColors.neonAmber,
              height: 1.0,
              shadows: [
                Shadow(
                  color: AppColors.neonAmber.withOpacity(0.4),
                  blurRadius: 40,
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            context.l10n.decrypted,
            style: theme.textTheme.headlineSmall?.copyWith(
              letterSpacing: 8.0,
            ),
          ),
        ],
      ),
    );
  }
}