import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/l10n_extensions.dart';

class VaultNumpad extends StatelessWidget {
  final Function(String) onDigitPress;
  final VoidCallback onClearPress;
  final VoidCallback onSubmitPress;

  const VaultNumpad({
    super.key,
    required this.onDigitPress,
    required this.onClearPress,
    required this.onSubmitPress,
  });

  @override
  Widget build(BuildContext context) {
    // إجبار الـ Numpad يترتب من الشمال لليمين حتى لو التطبيق بالعربي
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        children: [
          _buildRow(['1', '2', '3'], context),
          SizedBox(height: 8.h), // مسافات أقل
          _buildRow(['4', '5', '6'], context),
          SizedBox(height: 8.h),
          _buildRow(['7', '8', '9'], context),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildButton(
                context.l10n.vaultClr,
                context,
                textColor: AppColors.secondary,
                onTap: onClearPress,
              ),
              _buildButton('0', context, onTap: () => onDigitPress('0')),
              _buildButton(
                context.l10n.vaultEnt,
                context,
                backgroundColor: AppColors.neonAmber,
                textColor: AppColors.pitchBlack,
                onTap: onSubmitPress,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRow(List<String> digits, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: digits.map((digit) {
        return _buildButton(digit, context, onTap: () => onDigitPress(digit));
      }).toList(),
    );
  }

  Widget _buildButton(
    String label,
    BuildContext context, {
    Color? backgroundColor,
    Color? textColor,
    required VoidCallback onTap,
  }) {
    return Material(
      color: backgroundColor ?? AppColors.surfaceContainerHigh,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 85.w,
          height: 52.h, // تم تقليل الارتفاع عشان يمنع الـ Overflow
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              color: backgroundColor == null
                  ? AppColors.outlineVariant
                  : Colors.transparent,
            ),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontFamily: 'Bebas Neue',
              fontSize: 28.sp,
              color: textColor ?? AppColors.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}
