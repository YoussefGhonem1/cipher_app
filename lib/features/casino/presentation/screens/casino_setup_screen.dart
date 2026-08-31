import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/l10n_extensions.dart';
import '../cubits/casino_cubit.dart';

class CasinoSetupScreen extends StatefulWidget {
  const CasinoSetupScreen({super.key});

  @override
  State<CasinoSetupScreen> createState() => _CasinoSetupScreenState();
}

class _CasinoSetupScreenState extends State<CasinoSetupScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final langCode = Localizations.localeOf(context).languageCode;
      context.read<CasinoCubit>().loadGameData(langCode);
    });
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CasinoCubit>();

    return Scaffold(
      backgroundColor: AppColors.pitchBlack,
      appBar: AppBar(
        title: Text(context.l10n.casinoTitle),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.casino, size: 100.sp, color: AppColors.neonAmber),
            SizedBox(height: 24.h),
            Text(
              context.l10n.casinoSetupSubtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Bebas Neue',
                fontSize: 32.sp,
                color: AppColors.onSurface,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              context.l10n.casinoDescription,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 16.sp,
                color: AppColors.outline,
                height: 1.5,
              ),
            ),
            SizedBox(height: 60.h),
            SizedBox(
              width: double.infinity,
              height: 60.h,
              child: ElevatedButton(
                onPressed: () {
                  final langCode = Localizations.localeOf(context).languageCode;
                  cubit.drawNextQuestion(langCode);
                  context.push('/casino-active', extra: cubit);
                },
                child: Text(context.l10n.casinoStartGame),
              ),
            ),
          ],
        ),
      ),
    );
  }
}