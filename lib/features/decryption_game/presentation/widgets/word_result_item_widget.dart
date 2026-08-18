import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/word_result_entity.dart';

class WordResultItemWidget extends StatelessWidget {
  final int index;
  final WordResultEntity result;

  const WordResultItemWidget({
    super.key,
    required this.index,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final number = (index + 1).toString().padLeft(2, '0');

    return Container(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: result.isCorrect ? Colors.transparent : AppColors.crimsonRed,
            width: 4.w,
          ),
        ),
        color: result.isCorrect 
            ? Colors.transparent 
            : AppColors.crimsonRed.withOpacity(0.05),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Row(
        children: [
          Text(
            number,
            style: theme.textTheme.bodySmall?.copyWith(
              color: result.isCorrect 
                  ? AppColors.outlineVariant 
                  : AppColors.crimsonRed.withOpacity(0.7),
            ),
          ),
          SizedBox(width: 24.w),
          Expanded(
            child: Text(
              result.word,
              style: theme.textTheme.bodySmall?.copyWith(
                color: result.isCorrect ? AppColors.onSurface : AppColors.outline,
                decoration: result.isCorrect 
                    ? TextDecoration.none 
                    : TextDecoration.lineThrough,
                decorationColor: AppColors.outline,
              ),
            ),
          ),
          Icon(
            result.isCorrect ? Icons.check : Icons.close,
            color: result.isCorrect ? AppColors.neonAmber : AppColors.crimsonRed,
            size: 20.sp,
          ),
        ],
      ),
    );
  }
}