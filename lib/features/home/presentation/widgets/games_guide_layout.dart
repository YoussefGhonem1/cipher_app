import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/l10n_extensions.dart';

class GamesGuideLayout extends StatelessWidget {
  const GamesGuideLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      children: [
        Text(
          context.l10n.how_to_play,
          style: TextStyle(
            fontFamily: 'Bebas Neue',
            fontSize: 32.sp,
            color: AppColors.neonAmber,
          ),
        ),
        SizedBox(height: 16.h),
        _GuideSection(
          title: context.l10n.spyfallTitle,
          rules: context.l10n.spyfallRules,
        ),
        SizedBox(height: 20.h),
        _GuideSection(
          title: context.l10n.charadesTitle,
          rules: context.l10n.charades_rules,
        ),
      ],
    );
  }
}

class _GuideSection extends StatelessWidget {
  final String title;
  final String rules;

  const _GuideSection({required this.title, required this.rules});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.deepCharcoal,
        border: Border.all(color: AppColors.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Bebas Neue',
              fontSize: 24.sp,
              color: AppColors.primary,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            rules,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 14.sp,
              height: 1.6,
              color: AppColors.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}