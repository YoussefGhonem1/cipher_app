import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/services/locale_service.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/l10n_extensions.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              Container(
                width: 32.w,
                height: 32.h,
                decoration: BoxDecoration(
                  color: AppColors.deepCharcoal,
                  border: Border.all(
                    color: AppColors.metallicSilver.withValues(alpha: 0.3),
                  ),
                ),
                child: const Center(
                  child: Icon(
                    Icons.radar,
                    color: AppColors.neonAmber,
                    size: 18,
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Flexible(
                child: Text(
                  context.l10n.appName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: 'Bebas Neue',
                    fontSize: 22.sp,
                    color: AppColors.onSurface,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
            ],
          ),
        ),
        IconButton(
          tooltip: LocaleService.localeNotifier.value?.languageCode == 'ar'
              ? 'English'
              : 'العربية',
          onPressed: LocaleService.toggleLocale,
          icon: const Icon(Icons.language, color: AppColors.metallicSilver),
        ),
      ],
    );
  }
}
