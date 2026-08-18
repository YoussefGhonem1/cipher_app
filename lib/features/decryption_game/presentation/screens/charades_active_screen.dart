import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/l10n_extensions.dart';
import '../cubits/decryption_game_cubit.dart';
import '../cubits/decryption_game_state.dart';

class CharadesActiveScreen extends StatefulWidget {
  const CharadesActiveScreen({super.key});

  @override
  State<CharadesActiveScreen> createState() => _CharadesActiveScreenState();
}

class _CharadesActiveScreenState extends State<CharadesActiveScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppColors.pitchBlack,
      body: BlocConsumer<DecryptionGameCubit, DecryptionGameState>(
        listener: (context, state) {
          if (state is GameOver) {
            SystemChrome.setPreferredOrientations([
              DeviceOrientation.portraitUp,
              DeviceOrientation.portraitDown,
            ]);
            context.pushReplacement('/charades-report', extra: context.read<DecryptionGameCubit>());
          }
        },
        builder: (context, state) {
          if (state is! GamePlaying) {
            return const Center(child: CircularProgressIndicator());
          }

          Color backgroundColor = AppColors.pitchBlack;
          if (state.showCorrectIndicator) {
            backgroundColor = AppColors.primaryContainer.withOpacity(0.8);
          } else if (state.showPassIndicator) {
            backgroundColor = AppColors.crimsonRed.withOpacity(0.8);
          }

          final minutes = (state.timeRemaining ~/ 60).toString().padLeft(2, '0');
          final seconds = (state.timeRemaining % 60).toString().padLeft(2, '0');

          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            color: backgroundColor,
            child: SafeArea(
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Text(
                        context.l10n.tilt_down_correct,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: AppColors.outline,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Text(
                        context.l10n.tilt_up_pass,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: AppColors.outline,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 8,
                                height: 8,
                                decoration: const BoxDecoration(
                                  color: AppColors.neonAmber,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                '${context.l10n.time}: $minutes:$seconds',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: AppColors.outline,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${context.l10n.score}: ${state.score.toString().padLeft(2, '0')}',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: AppColors.outlineVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32.w),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          state.currentWord,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.displayLarge?.copyWith(
                            fontSize: 120,
                            color: AppColors.onSurface,
                            shadows: [
                              Shadow(
                                color: AppColors.pitchBlack.withOpacity(0.5),
                                blurRadius: 10,
                                offset: const Offset(2, 2),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}