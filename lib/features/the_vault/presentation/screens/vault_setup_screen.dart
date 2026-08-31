import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/l10n_extensions.dart';
import '../cubits/vault_cubit.dart';
import '../cubits/vault_state.dart';
import '../widgets/vault_app_bar.dart';

class VaultSetupScreen extends StatefulWidget {
  const VaultSetupScreen({super.key});

  @override
  State<VaultSetupScreen> createState() => _VaultSetupScreenState();
}

class _VaultSetupScreenState extends State<VaultSetupScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final langCode = Localizations.localeOf(context).languageCode;
      context.read<VaultCubit>().loadGameData(langCode);
    });
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<VaultCubit>();
    final langCode = Localizations.localeOf(context).languageCode;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const VaultAppBar(),
        SizedBox(height: 12.h),
        Text(
          context.l10n.vaultTitle,
          style: TextStyle(
            fontFamily: 'Bebas Neue',
            fontSize: 64.sp,
            color: AppColors.neonAmber,
            letterSpacing: 2.0,
            shadows: [
              Shadow(
                color: AppColors.neonAmber.withOpacity(0.3),
                blurRadius: 20,
              ),
            ],
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          context.l10n.vaultSetupSubtitle,
          style: TextStyle(
            fontFamily: 'Courier Prime',
            fontSize: 14.sp,
            color: AppColors.crimsonRed,
            letterSpacing: 1.5,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 24.h),
        BlocBuilder<VaultCubit, VaultState>(
          builder: (context, state) {
            if (state.categories.isEmpty) {
              return const SizedBox();
            }
            return ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 140.h),
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Wrap(
                    spacing: 8.w,
                    runSpacing: 8.h,
                    alignment: WrapAlignment.center,
                    children: state.categories.map((category) {
                      final isSelected = state.selectedCategory == category;
                      return GestureDetector(
                        onTap: () => cubit.selectCategory(category),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 8.h,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColors.neonAmber
                                : AppColors.surfaceContainerHigh,
                            borderRadius: BorderRadius.circular(20.r),
                            border: Border.all(
                              color: isSelected
                                  ? AppColors.neonAmber
                                  : AppColors.outlineVariant,
                            ),
                          ),
                          child: Text(
                            category,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: isSelected
                                  ? AppColors.pitchBlack
                                  : AppColors.onSurface,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            );
          },
        ),
        SizedBox(height: 24.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: AppColors.deepCharcoal.withOpacity(0.5),
            border: Border.all(color: AppColors.outlineVariant, width: 1.5),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Column(
            children: [
              Align(
                alignment: AlignmentDirectional.topEnd,
                child: Text(
                  'ID: TRM-0004',
                  style: TextStyle(
                    fontFamily: 'Courier Prime',
                    fontSize: 10.sp,
                    color: AppColors.outline,
                  ),
                ),
              ),
              Text(
                context.l10n.vaultSetupPlayerCount,
                style: TextStyle(
                  fontFamily: 'Bebas Neue',
                  fontSize: 20.sp,
                  color: AppColors.outline,
                  letterSpacing: 1.5,
                ),
              ),
              SizedBox(height: 24.h),
              BlocBuilder<VaultCubit, VaultState>(
                buildWhen: (previous, current) =>
                    previous.playerCount != current.playerCount,
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildCounterButton(
                        Icons.remove,
                        () => cubit.decrementPlayers(),
                      ),
                      SizedBox(width: 32.w),
                      Column(
                        children: [
                          Text(
                            '${state.playerCount}',
                            style: TextStyle(
                              fontFamily: 'Bebas Neue',
                              fontSize: 48.sp,
                              color: AppColors.neonAmber,
                              height: 1.0,
                            ),
                          ),
                          Text(
                            context.l10n.operatives,
                            style: TextStyle(
                              fontFamily: 'Bebas Neue',
                              fontSize: 14.sp,
                              color: AppColors.outline,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 32.w),
                      _buildCounterButton(
                        Icons.add,
                        () => cubit.incrementPlayers(),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
        const Spacer(),
        Container(
          width: double.infinity,
          height: 60.h,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColors.neonAmber.withOpacity(0.2),
                blurRadius: 20,
                spreadRadius: 2,
              ),
            ],
          ),
          child: ElevatedButton(
            onPressed: () => cubit.startMission(langCode),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.neonAmber,
              foregroundColor: AppColors.pitchBlack,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.r),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.warning_amber_rounded, size: 24),
                SizedBox(width: 8.w),
                Text(
                  context.l10n.vaultSetupStartMission,
                  style: TextStyle(
                    fontFamily: 'Bebas Neue',
                    fontSize: 24.sp,
                    letterSpacing: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 16.h),
      ],
    );
  }

  Widget _buildCounterButton(IconData icon, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 40.w,
        height: 40.w,
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerHigh,
          border: Border.all(color: AppColors.outlineVariant),
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Icon(icon, color: AppColors.neonAmber, size: 24),
      ),
    );
  }
}
