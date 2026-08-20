import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';

class VaultFooterLogWidget extends StatelessWidget {
  const VaultFooterLogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'SIGNAL: ENCRYPTED [98%] | POWER: 42.08% / NOMINAL',
          style: TextStyle(
            fontFamily: 'Courier Prime',
            fontSize: 9.sp,
            color: Colors.green.withOpacity(0.7),
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          'RECON   ENCRYPTION   LOGS',
          style: TextStyle(
            fontFamily: 'Courier Prime',
            fontSize: 9.sp,
            color: AppColors.outlineVariant,
            letterSpacing: 2.0,
          ),
        ),
      ],
    );
  }
}