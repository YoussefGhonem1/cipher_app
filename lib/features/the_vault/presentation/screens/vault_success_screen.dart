import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/l10n_extensions.dart';
import '../cubits/vault_cubit.dart';
import '../cubits/vault_state.dart';

class VaultSuccessScreen extends StatelessWidget {
  const VaultSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<VaultCubit>();

    return BlocBuilder<VaultCubit, VaultState>(
      builder: (context, state) {
        return Container(
          width: double.infinity,
          color: Colors.green.withOpacity(0.15),
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle_outline,
                color: Colors.greenAccent,
                size: 80,
              ),
              SizedBox(height: 24.h),
              Text(
                context.l10n.vaultPlayerWon(state.currentPlayerId),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Bebas Neue',
                  fontSize: 56.sp,
                  color: Colors.greenAccent,
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
                  border: Border.all(color: Colors.green.withOpacity(0.5)),
                ),
                child: Column(
                  children: [
                    Text(
                      context.l10n.vaultCipherSolved,
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
                      context.l10n.vaultSystemUnlocked,
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
                child: OutlinedButton(
                  onPressed: () => cubit.resetGame(),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.greenAccent, width: 2),
                    foregroundColor: Colors.greenAccent,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.play_arrow),
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
      },
    );
  }
}