import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/l10n_extensions.dart';
import '../cubits/home_cubit.dart';
import 'home_dossier_card.dart';

class HomeDossiersList extends StatelessWidget {
  const HomeDossiersList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.neonAmber),
          );
        }

        if (state.errorMessage != null) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  context.l10n.homeLoadError,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 14.sp,
                    color: AppColors.error,
                  ),
                ),
                SizedBox(height: 12.h),
                OutlinedButton(
                  onPressed: () => context.read<HomeCubit>().loadGames(),
                  child: Text(context.l10n.retry),
                ),
              ],
            ),
          );
        }

        if (state.dossiers.isEmpty) {
          return Center(
            child: Text(
              context.l10n.noGamesAvailable,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 14.sp,
                color: AppColors.onSurfaceVariant,
              ),
            ),
          );
        }

        return ListView.separated(
          itemCount: state.dossiers.length,
          separatorBuilder: (context, index) => SizedBox(height: 16.h),
          itemBuilder: (context, index) {
            return HomeDossierCard(dossier: state.dossiers[index]);
          },
        );
      },
    );
  }
}
