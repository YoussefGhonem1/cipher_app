import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/l10n_extensions.dart';
import '../cubits/decryption_game_cubit.dart';
import '../cubits/decryption_game_state.dart';

class CharadesPreparationScreen extends StatelessWidget {
  const CharadesPreparationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocListener<DecryptionGameCubit, DecryptionGameState>(
      listenWhen: (previous, current) => previous is! GamePlaying && current is GamePlaying,
      listener: (context, state) {
        if (state is GamePlaying) {
          context.pushReplacement('/charades-active', extra: context.read<DecryptionGameCubit>());
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.pitchBlack,
        body: SafeArea(
          child: Center(
            child: BlocBuilder<DecryptionGameCubit, DecryptionGameState>(
              builder: (context, state) {
                int countdown = 3;
                if (state is GamePreparation) {
                  countdown = state.countdown;
                }

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 120.w,
                      height: 120.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.crimsonRed.withOpacity(0.5), width: 2),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.crimsonRed.withOpacity(0.2),
                            blurRadius: 30,
                            spreadRadius: 10,
                          )
                        ]
                      ),
                      child: Center(
                        child: Icon(Icons.track_changes, color: AppColors.crimsonRed, size: 60.sp),
                      ),
                    ),
                    SizedBox(height: 40.h),
                    Text(
                      context.l10n.place_device,
                      style: theme.textTheme.headlineLarge?.copyWith(
                        color: AppColors.crimsonRed,
                        shadows: [
                          Shadow(color: AppColors.crimsonRed.withOpacity(0.5), blurRadius: 10)
                        ]
                      ),
                    ),
                    Text(
                      context.l10n.on_forehead,
                      style: theme.textTheme.headlineMedium?.copyWith(
                        color: AppColors.onSurface,
                      ),
                    ),
                    SizedBox(height: 60.h),
                    Container(
                      width: 80.w,
                      height: 80.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.crimsonRed, width: 3),
                      ),
                      child: Center(
                        child: Text(
                          '$countdown',
                          style: theme.textTheme.headlineLarge?.copyWith(
                            color: AppColors.crimsonRed,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      'SYS.PREP_SEQUENCE_INIT\nAWAITING_SENSORY_LOCK...\nCALIBRATING',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: AppColors.outlineVariant,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}