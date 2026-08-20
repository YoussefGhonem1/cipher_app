import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/l10n_extensions.dart';

class VaultAppBar extends StatelessWidget {
  const VaultAppBar({super.key});

  void _showRulesSheet(BuildContext context) {
    final theme = Theme.of(context);

    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.deepCharcoal,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 24.w,
            right: 24.w,
            top: 24.h,
            bottom: MediaQuery.of(context).padding.bottom + 24.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.help_outline, color: AppColors.neonAmber),
                  SizedBox(width: 12.w),
                  Text(
                    context.l10n.how_to_play,
                    style: theme.textTheme.headlineSmall?.copyWith(
                      color: AppColors.neonAmber,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Text(
                context.l10n.vaultRules,
                style: theme.textTheme.bodyMedium?.copyWith(
                  height: 1.8,
                  color: AppColors.onSurface,
                ),
              ),
              SizedBox(height: 32.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(context.l10n.got_it),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Row(
        children: [
          IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            icon: const Icon(Icons.arrow_back, color: AppColors.outline),
            onPressed: () => context.go('/'),
          ),
          SizedBox(width: 16.w),
          const CircleAvatar(
            radius: 18,
            backgroundImage: AssetImage('assets/images/logo.jpg'),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              context.l10n.vaultTitle,
              style: theme.textTheme.headlineSmall?.copyWith(
                letterSpacing: 2.0,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            icon: const Icon(Icons.help_outline, color: AppColors.outline),
            onPressed: () => _showRulesSheet(context),
          ),
        ],
      ),
    );
  }
}