import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/l10n_extensions.dart';
import '../cubits/vault_cubit.dart';

class VaultFailedScreen extends StatelessWidget {
  const VaultFailedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<VaultCubit>();

    return Container(
      width: double.infinity,
      color: AppColors.errorContainer.withOpacity(0.8),
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.warning_amber_rounded,
            color: AppColors.error,
            size: 64,
          ),
          SizedBox(height: 16.h),
          Text(
            context.l10n.vaultMissionFailed,
            style: TextStyle(
              fontFamily: 'Bebas Neue',
              fontSize: 48.sp,
              color: AppColors.error,
              letterSpacing: 2.0,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            context.l10n.vaultAllEliminated,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Bebas Neue',
              fontSize: 48.sp,
              color: AppColors.onError,
              height: 1.1,
              letterSpacing: 1.5,
            ),
          ),
          SizedBox(height: 48.h),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(24.w),
            decoration: BoxDecoration(
              color: AppColors.pitchBlack.withOpacity(0.6),
              border: Border.all(color: AppColors.outlineVariant),
            ),
            child: Column(
              children: [
                Text(
                  context.l10n.vaultNoSurvivors,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Courier Prime',
                    fontSize: 14.sp,
                    color: AppColors.onSurface,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
                SizedBox(height: 24.h),
                Text(
                  context.l10n.vaultSystemLockdown,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Courier Prime',
                    fontSize: 12.sp,
                    color: AppColors.outline,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            height: 60.h,
            child: ElevatedButton(
              onPressed: () => cubit.resetGame(),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.neonAmber,
                foregroundColor: AppColors.pitchBlack,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.refresh, size: 24),
                  SizedBox(width: 8.w),
                  Text(
                    context.l10n.vaultPlayAgain,
                    style: TextStyle(
                      fontFamily: 'Bebas Neue',
                      fontSize: 24.sp,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}