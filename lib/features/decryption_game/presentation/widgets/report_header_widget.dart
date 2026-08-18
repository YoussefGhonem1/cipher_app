import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/l10n_extensions.dart';

class ReportHeaderWidget extends StatelessWidget {
  const ReportHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Padding(
      padding: EdgeInsets.all(24.w),
      child: Row(
        children: [
          Text(
            '${context.l10n.system_log} // 982.A ',
            style: theme.textTheme.labelLarge?.copyWith(
              color: AppColors.outline,
              letterSpacing: 2.0,
            ),
          ),
          Container(
            width: 8.w,
            height: 8.w,
            margin: EdgeInsets.symmetric(horizontal: 8.w),
            decoration: const BoxDecoration(
              color: AppColors.crimsonRed,
              shape: BoxShape.circle,
            ),
          ),
          Text(
            context.l10n.terminated,
            style: theme.textTheme.labelLarge?.copyWith(
              color: AppColors.crimsonRed,
              letterSpacing: 2.0,
            ),
          ),
        ],
      ),
    );
  }
}