import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/l10n_extensions.dart';
import '../cubits/spyfall_cubit.dart';
import 'spyfall_l10n_mapper.dart';

class SpyfallInterrogationView extends StatelessWidget {
  const SpyfallInterrogationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpyfallCubit, SpyfallState>(
      builder: (context, state) {
        final remaining = Duration(seconds: state.secondsRemaining);
        final minutes = remaining.inMinutes
            .remainder(60)
            .toString()
            .padLeft(2, '0');
        final seconds = remaining.inSeconds
            .remainder(60)
            .toString()
            .padLeft(2, '0');
        final timerText = '$minutes:$seconds';

        return Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 24.h),
              decoration: BoxDecoration(
                color: AppColors.pitchBlack,
                border: Border.all(color: AppColors.outlineVariant),
              ),
              child: Column(
                children: [
                  Text(
                    context.l10n.spyfallTimeRemaining,
                    style: TextStyle(
                      fontFamily: 'Courier Prime',
                      fontSize: 10.sp,
                      color: AppColors.primary,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    width: 180.w,
                    height: 180.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.primaryContainer,
                        width: 4,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      timerText,
                      style: TextStyle(
                        fontFamily: 'Bebas Neue',
                        fontSize: 64.sp,
                        color: AppColors.primaryContainer,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                context.l10n.spyfallPossibleLocations,
                style: TextStyle(
                  fontFamily: 'Bebas Neue',
                  fontSize: 24.sp,
                  color: AppColors.onSurface,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: GridView.builder(
                itemCount: state.locations.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h,
                  childAspectRatio: 1.2,
                ),
                itemBuilder: (context, index) {
                  final location = state.locations[index];

                  return Container(
                    padding: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceContainerLow,
                      border: Border.all(
                        color: AppColors.outlineVariant,
                        width: 1,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          spyfallTextByKey(context, location.titleKey),
                          style: TextStyle(
                            fontFamily: 'Bebas Neue',
                            fontSize: 21.sp,
                            color: AppColors.onSurface,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '${context.l10n.spyfallIntelLevelLabel}:',
                          style: TextStyle(
                            fontFamily: 'Courier Prime',
                            fontSize: 9.sp,
                            color: AppColors.outline,
                          ),
                        ),
                        Text(
                          spyfallTextByKey(context, location.intelLevelKey),
                          style: TextStyle(
                            fontFamily: 'Courier Prime',
                            fontSize: 10.sp,
                            color: AppColors.outline,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 12.h),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.secondaryContainer,
                  foregroundColor: AppColors.onSecondaryContainer,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                onPressed: () =>
                    context.read<SpyfallCubit>().terminateMission(),
                child: Text(context.l10n.terminate),
              ),
            ),
          ],
        );
      },
    );
  }
}
