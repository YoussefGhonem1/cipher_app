import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/services/service_locator.dart';
import '../../../../core/theme/app_colors.dart';
import '../cubits/vault_cubit.dart';
import '../cubits/vault_state.dart';
import '../widgets/vault_footer_log_widget.dart';
import 'vault_active_screen.dart';
import 'vault_eliminated_screen.dart';
import 'vault_failed_screen.dart';
import 'vault_pass_device_screen.dart';
import 'vault_setup_screen.dart';
import 'vault_success_screen.dart';

class VaultScreen extends StatelessWidget {
  const VaultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<VaultCubit>(),
      child: Scaffold(
        backgroundColor: AppColors.pitchBlack,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            child: Column(
              children: [
                Expanded(
                  child: BlocBuilder<VaultCubit, VaultState>(
                    builder: (context, state) {
                      return AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: switch (state.phase) {
                          VaultPhase.setup => const VaultSetupScreen(),
                          VaultPhase.passDevice => const VaultPassDeviceScreen(),
                          VaultPhase.active => const VaultActiveScreen(),
                          VaultPhase.eliminated => const VaultEliminatedScreen(),
                          VaultPhase.failed => const VaultFailedScreen(),
                          VaultPhase.success => const VaultSuccessScreen(),
                        },
                      );
                    },
                  ),
                ),
                const VaultFooterLogWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}