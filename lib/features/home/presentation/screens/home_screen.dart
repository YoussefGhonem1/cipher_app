import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/services/service_locator.dart';
import '../../../../core/theme/app_colors.dart';
import '../cubits/home_cubit.dart';
import '../widgets/home_bottom_nav.dart';
import '../widgets/home_dossiers_list.dart';
import '../widgets/home_header.dart';
import '../widgets/home_system_status.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>()..loadGames(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final horizontalPadding = constraints.maxWidth < 420
                  ? 16.w
                  : 24.w;

              return Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 760.w),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding,
                      vertical: 16.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const HomeHeader(),
                        SizedBox(height: 24.h),
                        const HomeSystemStatus(),
                        SizedBox(height: 24.h),
                        const Expanded(child: HomeDossiersList()),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        bottomNavigationBar: const HomeBottomNav(),
      ),
    );
  }
}
