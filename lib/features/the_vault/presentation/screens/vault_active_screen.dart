import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/l10n_extensions.dart';
import '../cubits/vault_cubit.dart';
import '../cubits/vault_state.dart';
import '../widgets/vault_numpad.dart';

class VaultActiveScreen extends StatelessWidget {
  const VaultActiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<VaultCubit>();

    return BlocBuilder<VaultCubit, VaultState>(
      builder: (context, state) {
        final minutes = (state.timeRemaining ~/ 60).toString().padLeft(2, '0');
        final seconds = (state.timeRemaining % 60).toString().padLeft(2, '0');

        final currentQuestion = state.questions.isNotEmpty 
            ? state.questions[state.currentQuestionIndex] 
            : null;

        final clueText = currentQuestion?['clue'] ?? '';
        final hintText = currentQuestion?['hint'] ?? '';
        final instructionText = currentQuestion?['instruction'] ?? context.l10n.vaultDecryptionClue;
        final answerLength = currentQuestion?['answer']?.length ?? 4;

        final displayCode = state.enteredCode
            .padRight(answerLength, '_')
            .split('')
            .join(' ');

        return Column(
          children: [
            SizedBox(height: 8.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: AppColors.errorContainer.withOpacity(0.2),
                border: Border.all(color: AppColors.errorContainer),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.warning,
                    color: AppColors.secondary,
                    size: 16,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    context.l10n.vaultThreatLevel,
                    style: TextStyle(
                      fontFamily: 'Courier Prime',
                      fontSize: 10.sp,
                      color: AppColors.secondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              '$minutes:$seconds',
              style: TextStyle(
                fontFamily: 'Bebas Neue',
                fontSize: 84.sp,
                color: AppColors.neonAmber,
                height: 1.0,
                letterSpacing: 4.0,
                shadows: [
                  Shadow(
                    color: AppColors.neonAmber.withOpacity(0.4),
                    blurRadius: 20,
                  ),
                ],
              ),
            ),
            Container(
              height: 2.h,
              width: 120.w,
              color: AppColors.secondary,
              margin: EdgeInsets.only(top: 8.h, bottom: 16.h),
              alignment: Alignment.centerLeft,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.outlineVariant),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.vpn_key_outlined,
                        color: AppColors.neonAmber,
                        size: 14,
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        instructionText,
                        style: TextStyle(
                          fontFamily: 'Bebas Neue',
                          fontSize: 16.sp,
                          color: AppColors.neonAmber,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    clueText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Courier Prime',
                      fontSize: 18.sp,
                      color: AppColors.onSurface,
                      letterSpacing: 1.0,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  GestureDetector(
                    onTap: () {
                      if (!state.isHintRevealed && !state.playersUsedHint.contains(state.currentPlayerId)) {
                        cubit.revealHint();
                      }
                    },
                    child: Opacity(
                      opacity: state.isHintRevealed ? 1.0 : 0.3,
                      child: Text(
                        state.isHintRevealed
                            ? '${context.l10n.vaultHintPrefix}$hintText'
                            : '❖ ❖ ❖ ❖ ❖',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Courier Prime',
                          fontSize: state.isHintRevealed ? 10.sp : 12.sp,
                          color: AppColors.outline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainerLow,
                  border: Border.all(color: AppColors.outlineVariant),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: AppColors.neonAmber,
                            width: 2,
                          ),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: Text(
                          displayCode,
                          style: TextStyle(
                            fontFamily: 'Courier Prime',
                            fontSize: 32.sp,
                            color: AppColors.neonAmber,
                            letterSpacing: 12.0,
                          ),
                        ),
                      ),
                    ),
                    VaultNumpad(
                      onDigitPress: cubit.addDigit,
                      onClearPress: cubit.clearCode,
                      onSubmitPress: cubit.submitCode,
                    ),
                    Text(
                      context.l10n.vaultConnectionSecure,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Courier Prime',
                        fontSize: 8.sp,
                        color: AppColors.outline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}