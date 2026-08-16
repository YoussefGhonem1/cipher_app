import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/l10n_extensions.dart';

class HomeSystemStatus extends StatelessWidget {
  const HomeSystemStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.activeDossiers,
          style: TextStyle(
            fontFamily: 'Bebas Neue',
            fontSize: 48.sp,
            height: 1.0,
            color: AppColors.primary,
            letterSpacing: 1.0,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          context.l10n.systemStatus,
          style: TextStyle(
            fontFamily: 'Courier Prime',
            fontSize: 12.sp,
            color: AppColors.outline,
          ),
        ),
      ],
    );
  }
}
