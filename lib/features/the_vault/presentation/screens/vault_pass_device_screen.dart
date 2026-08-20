import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/l10n_extensions.dart';
import '../cubits/vault_cubit.dart';
import '../cubits/vault_state.dart';

class VaultPassDeviceScreen extends StatelessWidget {
  const VaultPassDeviceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<VaultCubit>();

    return BlocBuilder<VaultCubit, VaultState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Container(
              width: 160.w,
              height: 160.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.outlineVariant.withOpacity(0.5),
                  width: 1,
                ),
              ),
              child: Center(
                child: Container(
                  width: 120.w,
                  height: 120.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.outlineVariant,
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.fingerprint,
                      size: 80.sp,
                      color: AppColors.neonAmber,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 48.h),
            Text(
              context.l10n.vaultPassDeviceTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Bebas Neue',
                fontSize: 48.sp,
                color: AppColors.onSurface,
                height: 1.1,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 24.h),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: AppColors.outlineVariant,
                    thickness: 1,
                    endIndent: 12.w,
                  ),
                ),
                Text(
                  context.l10n.vaultHandOffStatus,
                  style: TextStyle(
                    fontFamily: 'Courier Prime',
                    fontSize: 10.sp,
                    color: AppColors.outline,
                    letterSpacing: 1.2,
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: AppColors.outlineVariant,
                    thickness: 1,
                    indent: 12.w,
                  ),
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 60.h,
              child: OutlinedButton(
                onPressed: () => cubit.confirmIdentity(),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppColors.outline, width: 1.5),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                child: Text(
                  '${context.l10n.vaultIdentityConfirmed} [${state.currentPlayerId}]',
                  style: TextStyle(
                    fontFamily: 'Courier Prime',
                    fontSize: 14.sp,
                    color: AppColors.onSurface,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 32.h),
          ],
        );
      },
    );
  }
}