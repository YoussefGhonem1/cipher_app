import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/l10n_extensions.dart';
import '../cubits/spyfall_cubit.dart';

class SpyfallSetupView extends StatelessWidget {
  const SpyfallSetupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpyfallCubit, SpyfallState>(
      buildWhen: (previous, current) {
        return previous.playerCount != current.playerCount ||
            previous.durationMinutes != current.durationMinutes;
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _SectionFrame(
              title: context.l10n.spyfallOperativesTitle,
              subtitle: context.l10n.spyfallSelectOperatives,
              child: Row(
                children: [
                  _SquareActionButton(
                    icon: Icons.remove,
                    onTap: () => context.read<SpyfallCubit>().decreasePlayers(),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Container(
                      height: 72.h,
                      decoration: BoxDecoration(
                        color: AppColors.surfaceContainerLow,
                        border: Border.all(color: AppColors.outlineVariant),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '${state.playerCount}',
                        style: TextStyle(
                          fontFamily: 'Bebas Neue',
                          fontSize: 46.sp,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  _SquareActionButton(
                    icon: Icons.add,
                    onTap: () => context.read<SpyfallCubit>().increasePlayers(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            _SectionFrame(
              title: context.l10n.spyfallMissionDurationTitle,
              subtitle: context.l10n.spyfallSelectDuration,
              child: Column(
                children: [
                  _DurationOption(
                    minutes: 5,
                    isSelected: state.durationMinutes == 5,
                  ),
                  SizedBox(height: 8.h),
                  _DurationOption(
                    minutes: 10,
                    isSelected: state.durationMinutes == 10,
                  ),
                  SizedBox(height: 8.h),
                  _DurationOption(
                    minutes: 15,
                    isSelected: state.durationMinutes == 15,
                  ),
                ],
              ),
            ),
            SizedBox(height: 18.h),
            SizedBox(
              height: 56.h,
              child: ElevatedButton.icon(
                onPressed: () => context.read<SpyfallCubit>().initiateMission(),
                icon: const Icon(Icons.power_settings_new),
                label: Text(context.l10n.spyfallInitiateMission),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _SectionFrame extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget child;

  const _SectionFrame({
    required this.title,
    required this.subtitle,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: AppColors.pitchBlack,
        border: Border.all(color: AppColors.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Bebas Neue',
              fontSize: 28.sp,
              color: AppColors.onSurface,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            subtitle,
            style: TextStyle(
              fontFamily: 'Courier Prime',
              fontSize: 10.sp,
              color: AppColors.outline,
            ),
          ),
          SizedBox(height: 14.h),
          child,
        ],
      ),
    );
  }
}

class _SquareActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _SquareActionButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surfaceContainerLow,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          width: 48.w,
          height: 48.h,
          child: Icon(icon, color: AppColors.onSurface),
        ),
      ),
    );
  }
}

class _DurationOption extends StatelessWidget {
  final int minutes;
  final bool isSelected;

  const _DurationOption({required this.minutes, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SpyfallCubit>();

    return Material(
      color: isSelected ? AppColors.onPrimary : AppColors.surfaceContainerLow,
      child: InkWell(
        onTap: () => cubit.selectDuration(minutes),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected
                  ? AppColors.primaryContainer
                  : AppColors.outlineVariant,
            ),
          ),
          child: Row(
            children: [
              Icon(
                Icons.timer_outlined,
                size: 16,
                color: isSelected
                    ? AppColors.primaryContainer
                    : AppColors.outline,
              ),
              SizedBox(width: 8.w),
              Text(
                context.l10n.spyfallDurationMinutes(minutes),
                style: TextStyle(
                  fontFamily: 'Bebas Neue',
                  fontSize: 20.sp,
                  color: isSelected
                      ? AppColors.primaryContainer
                      : AppColors.onSurface,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
