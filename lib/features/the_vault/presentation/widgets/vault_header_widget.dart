import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/l10n_extensions.dart';

class VaultHeaderWidget extends StatelessWidget {
  const VaultHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          icon: const Icon(Icons.arrow_back, color: AppColors.outline),
          onPressed: () => context.go('/'),
        ),
        SizedBox(width: 12.w),
        const Icon(Icons.security, color: AppColors.neonAmber, size: 24),
        SizedBox(width: 8.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${context.l10n.vaultSetupStatus.split(':')[0]}:',
                style: TextStyle(
                  fontFamily: 'Bebas Neue',
                  fontSize: 16.sp,
                  color: AppColors.neonAmber,
                  height: 1.0,
                ),
              ),
              Text(
                context.l10n.vaultSetupStatus.split(':')[1].trim(),
                style: TextStyle(
                  fontFamily: 'Bebas Neue',
                  fontSize: 24.sp,
                  color: AppColors.neonAmber,
                  height: 1.0,
                ),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '${context.l10n.vaultSetupMission.split(':')[0]}:',
              style: TextStyle(
                fontFamily: 'Courier Prime',
                fontSize: 10.sp,
                color: AppColors.neonAmber,
              ),
            ),
            Text(
              context.l10n.vaultSetupMission.split(':')[1].trim(),
              style: TextStyle(
                fontFamily: 'Courier Prime',
                fontSize: 10.sp,
                color: AppColors.outline,
              ),
            ),
          ],
        ),
      ],
    );
  }
}