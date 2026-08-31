import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/l10n_extensions.dart';
import '../cubits/casino_cubit.dart';
import '../cubits/casino_state.dart';

class CasinoActiveScreen extends StatelessWidget {
  const CasinoActiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CasinoCubit>();
    final langCode = Localizations.localeOf(context).languageCode;

    return Scaffold(
      backgroundColor: AppColors.pitchBlack,
      appBar: AppBar(
        title: Text(context.l10n.casinoTitle),
        backgroundColor: AppColors.surfaceContainerLow,
        elevation: 0,
      ),
      body: BlocBuilder<CasinoCubit, CasinoState>(
        builder: (context, state) {
          if (state.currentQuestion == null) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.neonAmber),
            );
          }

          final clueText = state.currentQuestion!['clue'] ?? '';
          final correctAnswer = state.currentQuestion!['answer'].toString();

          return Padding(
            padding: EdgeInsets.all(24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainerHigh,
                    border: Border.all(color: AppColors.outlineVariant),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    children: [
                      Text(
                        context.l10n.casinoCategoryLabel,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14.sp,
                          color: AppColors.outline,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: state.selectedCategory,
                            dropdownColor: AppColors.surfaceContainerHighest,
                            isExpanded: true,
                            icon: const Icon(Icons.arrow_drop_down,
                                color: AppColors.neonAmber),
                            items: state.categories.map((String category) {
                              return DropdownMenuItem<String>(
                                value: category,
                                child: Text(
                                  category,
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.onSurface,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                cubit.changeCategory(newValue, langCode);
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32.h),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(24.w),
                          decoration: BoxDecoration(
                            color: AppColors.deepCharcoal.withOpacity(0.8),
                            border: Border.all(
                                color: AppColors.outlineVariant, width: 2),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Text(
                            clueText,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primary,
                              height: 1.5,
                            ),
                          ),
                        ),
                        SizedBox(height: 32.h),
                        ...state.currentOptions.map((option) {
                          bool isCorrect = option == correctAnswer;
                          return Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(bottom: 12.h),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 16.h),
                            decoration: BoxDecoration(
                              color: isCorrect
                                  ? AppColors.neonAmber.withOpacity(0.15)
                                  : AppColors.surfaceContainerLow,
                              border: Border.all(
                                color: isCorrect
                                    ? AppColors.neonAmber
                                    : AppColors.outlineVariant,
                                width: isCorrect ? 2 : 1,
                              ),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  isCorrect
                                      ? Icons.check_circle
                                      : Icons.circle_outlined,
                                  color: isCorrect
                                      ? AppColors.neonAmber
                                      : AppColors.outline,
                                ),
                                SizedBox(width: 16.w),
                                Expanded(
                                  child: Text(
                                    option,
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 18.sp,
                                      fontWeight: isCorrect
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                      color: isCorrect
                                          ? AppColors.neonAmber
                                          : AppColors.onSurface,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                SizedBox(
                  width: double.infinity,
                  height: 60.h,
                  child: ElevatedButton(
                    onPressed: () => cubit.drawNextQuestion(langCode),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.neonAmber,
                      foregroundColor: AppColors.pitchBlack,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(context.l10n.casinoNextQuestion),
                        SizedBox(width: 8.w),
                        const Icon(Icons.arrow_forward),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}