import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/l10n_extensions.dart';
import '../cubits/spyfall_cubit.dart';
import 'spyfall_l10n_mapper.dart';

class SpyfallBriefingView extends StatelessWidget {
  const SpyfallBriefingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpyfallCubit, SpyfallState>(
      buildWhen: (previous, current) {
        return previous.currentPlayer != current.currentPlayer ||
            previous.isRoleRevealed != current.isRoleRevealed ||
            previous.selectedLocationId != current.selectedLocationId;
      },
      builder: (context, state) {
        final isRevealed = state.isRoleRevealed;
        final location = state.selectedLocation;
        final roleText = state.isCurrentPlayerSpy
            ? context.l10n.spyfallRoleSpy
            : context.l10n.spyfallRoleAgent;
        final locationText = state.isCurrentPlayerSpy || location == null
            ? context.l10n.spyfallRoleNoLocation
            : spyfallTextByKey(context, location.titleKey);

        return Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.pitchBlack,
                  border: Border.all(color: AppColors.outlineVariant),
                ),
                padding: EdgeInsets.all(20.w),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 220),
                  child: isRevealed
                      ? Column(
                          key: const ValueKey('revealedRole'),
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              roleText,
                              style: TextStyle(
                                fontFamily: 'Bebas Neue',
                                fontSize: 52.sp,
                                color: state.isCurrentPlayerSpy
                                    ? AppColors.crimsonRed
                                    : AppColors.primaryContainer,
                              ),
                            ),
                            SizedBox(height: 16.h),
                            Text(
                              locationText,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Bebas Neue',
                                fontSize: 38.sp,
                                color: AppColors.onSurface,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ],
                        )
                      : Column(
                          key: const ValueKey('hiddenRole'),
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.shield_moon,
                              color: AppColors.outline,
                              size: 64.sp,
                            ),
                            SizedBox(height: 14.h),
                            Text(
                              context.l10n.spyfallHiddenBriefing,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Bebas Neue',
                                fontSize: 32.sp,
                                color: AppColors.onSurface,
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ),
            SizedBox(height: 18.h),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: isRevealed
                    ? () => context.read<SpyfallCubit>().nextPlayerOrStart()
                    : () => context.read<SpyfallCubit>().revealRole(),
                icon: Icon(
                  isRevealed ? Icons.arrow_forward : Icons.visibility_outlined,
                ),
                label: Text(
                  isRevealed
                      ? (state.currentPlayer < state.playerCount
                            ? context.l10n.spyfallNextPlayer
                            : context.l10n.spyfallStartInterrogation)
                      : context.l10n.reveal,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
