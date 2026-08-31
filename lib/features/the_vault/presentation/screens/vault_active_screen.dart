import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/l10n_extensions.dart';
import '../cubits/vault_cubit.dart';
import '../cubits/vault_state.dart';

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
        final instructionText =
            currentQuestion?['instruction'] ?? context.l10n.vaultDecryptionClue;

        final sharedDecoration = BoxDecoration(
          color: AppColors.deepCharcoal.withOpacity(0.6),
          border: Border.all(color: AppColors.outlineVariant, width: 1.5),
          borderRadius: BorderRadius.circular(12.r),
        );

        return Column(
          children: [
            SizedBox(height: 8.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: AppColors.errorContainer.withOpacity(0.2),
                border: Border.all(color: AppColors.errorContainer),
                borderRadius: BorderRadius.circular(4.r),
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
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(20.w),
                      decoration: sharedDecoration,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.vpn_key_outlined,
                                color: AppColors.neonAmber,
                                size: 16,
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                instructionText,
                                style: TextStyle(
                                  fontFamily: 'Bebas Neue',
                                  fontSize: 18.sp,
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
                              height: 1.4,
                            ),
                          ),
                          SizedBox(height: 16.h),
                          GestureDetector(
                            onTap: () {
                              if (!state.isHintRevealed &&
                                  !state.playersUsedHint.contains(
                                    state.currentPlayerId,
                                  )) {
                                cubit.revealHint();
                              }
                            },
                            child: Opacity(
                              opacity: state.isHintRevealed ? 1.0 : 0.4,
                              child: Text(
                                state.isHintRevealed
                                    ? '${context.l10n.vaultHintPrefix}$hintText'
                                    : '❖ ❖ ❖ ❖ ❖',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Courier Prime',
                                  fontSize: state.isHintRevealed
                                      ? 12.sp
                                      : 14.sp,
                                  color: AppColors.outline,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(20.w),
                      decoration: sharedDecoration,
                      child: Column(
                        children: [
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 12.w,
                                  mainAxisSpacing: 12.h,
                                  childAspectRatio: 2.2,
                                ),
                            itemCount: state.currentChoices.length,
                            itemBuilder: (context, index) {
                              final choice = state.currentChoices[index];
                              return ElevatedButton(
                                onPressed: () => cubit.submitAnswer(choice),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      AppColors.surfaceContainerHigh,
                                  foregroundColor: AppColors.neonAmber,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.r),
                                    side: const BorderSide(
                                      color: AppColors.outlineVariant,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 4.w,
                                    vertical: 4.h,
                                  ),
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      choice,
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.0,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(height: 24.h),
                          Text(
                            context.l10n.vaultConnectionSecure,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Courier Prime',
                              fontSize: 10.sp,
                              color: AppColors.outline,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.h),
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
