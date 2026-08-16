import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/services/service_locator.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/l10n_extensions.dart';
import '../cubits/spyfall_cubit.dart';
import '../widgets/spyfall_briefing_view.dart';
import '../widgets/spyfall_handoff_view.dart';
import '../widgets/spyfall_interrogation_view.dart';
import '../widgets/spyfall_setup_view.dart';

class SpyfallScreen extends StatelessWidget {
  const SpyfallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SpyfallCubit>()..initialize(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: Text(context.l10n.spyfallMissionParam),
          centerTitle: false,
        ),
        body: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 760.w),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                child: BlocBuilder<SpyfallCubit, SpyfallState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.neonAmber,
                        ),
                      );
                    }

                    if (state.errorMessage != null) {
                      return Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              context.l10n.spyfallLoadError,
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 14.sp,
                                color: AppColors.error,
                              ),
                            ),
                            SizedBox(height: 12.h),
                            OutlinedButton(
                              onPressed: () =>
                                  context.read<SpyfallCubit>().initialize(),
                              child: Text(context.l10n.retry),
                            ),
                          ],
                        ),
                      );
                    }

                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 250),
                      child: switch (state.phase) {
                        SpyfallPhase.setup => const SpyfallSetupView(),
                        SpyfallPhase.handoff => const SpyfallHandoffView(),
                        SpyfallPhase.briefing => const SpyfallBriefingView(),
                        SpyfallPhase.interrogation =>
                          const SpyfallInterrogationView(),
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
