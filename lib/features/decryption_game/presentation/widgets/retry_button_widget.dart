import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/l10n_extensions.dart';
import '../cubits/decryption_game_cubit.dart';
class RetryButtonWidget extends StatelessWidget {
  const RetryButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.w),
      child: SizedBox(
        width: double.infinity,
        height: 60.h,
        child: ElevatedButton(
          onPressed: () {
            context.read<DecryptionGameCubit>().retry();
            context.go('/charades-setup');
          },
          child: Text(context.l10n.retry),
        ),
      ),
    );
  }
}