import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/l10n_extensions.dart';
import '../cubits/spyfall_cubit.dart';

class SpyfallHandoffView extends StatelessWidget {
  const SpyfallHandoffView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpyfallCubit, SpyfallState>(
      buildWhen: (previous, current) =>
          previous.currentPlayer != current.currentPlayer,
      builder: (context, state) {
        return Center(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              color: AppColors.pitchBlack,
              border: Border.all(color: AppColors.outlineVariant),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.fingerprint,
                  color: AppColors.primaryContainer,
                  size: 84.sp,
                ),
                SizedBox(height: 24.h),
                Text(
                  context.l10n.spyfallPassDevice,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Bebas Neue',
                    fontSize: 52.sp,
                    height: 0.95,
                    color: AppColors.onSurface,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  context.l10n.spyfallPassToPlayer(state.currentPlayer),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Bebas Neue',
                    fontSize: 46.sp,
                    height: 0.9,
                    color: AppColors.onSurface,
                  ),
                ),
                SizedBox(height: 26.h),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () =>
                        context.read<SpyfallCubit>().continueFromHandoff(),
                    child: Text(
                      context.l10n.spyfallIAmPlayer(state.currentPlayer),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
