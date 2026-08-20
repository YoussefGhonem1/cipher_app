import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/l10n_extensions.dart';
import '../cubits/vault_cubit.dart';

class VaultEliminatedScreen extends StatelessWidget {
  const VaultEliminatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<VaultCubit>();

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.block,
            color: AppColors.error,
            size: 80,
          ),
          SizedBox(height: 24.h),
          Text(
            context.l10n.vaultPlayerEliminated,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Bebas Neue',
              fontSize: 56.sp,
              color: AppColors.error,
              height: 1.0,
              letterSpacing: 2.0,
            ),
          ),
          SizedBox(height: 48.h),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(24.w),
            decoration: BoxDecoration(
              color: AppColors.pitchBlack.withOpacity(0.6),
              border: Border.all(color: AppColors.errorContainer),
            ),
            child: Text(
              context.l10n.vaultSystemLockdown,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Courier Prime',
                fontSize: 14.sp,
                color: AppColors.outline,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            height: 60.h,
            child: ElevatedButton(
              onPressed: () => cubit.continueAfterElimination(),
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
                  const Icon(Icons.arrow_forward, size: 24),
                  SizedBox(width: 8.w),
                  Text(
                    context.l10n.vaultContinueGame,
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