import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                SizedBox(height: 24.h),
                _buildSystemStatus(),
                SizedBox(height: 24.h),
                Expanded(child: _buildDossiersList()),
              ],
            ),
          ),
        ),
        bottomNavigationBar: _buildBottomNav(),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 32.w,
              height: 32.h,
              decoration: BoxDecoration(
                color: AppColors.deepCharcoal,
                border: Border.all(color: AppColors.metallicSilver.withOpacity(0.3)),
              ),
              child: const Center(
                child: Icon(
                  Icons.radar,
                  color: AppColors.neonAmber,
                  size: 18,
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Text(
              'NEXUS_SYSTEM',
              style: TextStyle(
                fontFamily: 'Bebas Neue',
                fontSize: 22.sp,
                color: AppColors.onSurface,
                letterSpacing: 1.5,
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.settings_outlined,
            color: AppColors.metallicSilver,
          ),
        ),
      ],
    );
  }

  Widget _buildSystemStatus() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ACTIVE\nDOSSIERS',
          style: TextStyle(
            fontFamily: 'Bebas Neue',
            fontSize: 48.sp,
            height: 1.0,
            color: AppColors.primary,
            letterSpacing: 1.0,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          'SYSTEM STATUS: ONLINE. AWAITING OPERATIVE SELECTION.',
          style: TextStyle(
            fontFamily: 'Courier Prime',
            fontSize: 12.sp,
            color: AppColors.outline,
          ),
        ),
      ],
    );
  }

  Widget _buildDossiersList() {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return ListView.separated(
          itemCount: state.dossiers.length,
          separatorBuilder: (context, index) => SizedBox(height: 16.h),
          itemBuilder: (context, index) {
            final dossier = state.dossiers[index];
            return Container(
              decoration: BoxDecoration(
                color: AppColors.deepCharcoal,
                border: Border.all(
                  color: AppColors.metallicSilver.withOpacity(0.2),
                  width: 1,
                ),
              ),
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                        color: AppColors.surfaceContainerHigh,
                        child: Text(
                          'DECEPTION',
                          style: TextStyle(
                            fontFamily: 'Courier Prime',
                            fontSize: 10.sp,
                            color: AppColors.onSurface,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            width: 6.w,
                            height: 6.h,
                            color: AppColors.neonAmber,
                          ),
                          SizedBox(width: 6.w),
                          Text(
                            'ACTIVE',
                            style: TextStyle(
                              fontFamily: 'Courier Prime',
                              fontSize: 10.sp,
                              color: AppColors.metallicSilver,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    dossier.title,
                    style: TextStyle(
                      fontFamily: 'Bebas Neue',
                      fontSize: 32.sp,
                      color: AppColors.neonAmber,
                      letterSpacing: 1.0,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    dossier.description,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 14.sp,
                      color: AppColors.onSurfaceVariant,
                      height: 1.4,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'OPERATIVES',
                            style: TextStyle(
                              fontFamily: 'Courier Prime',
                              fontSize: 10.sp,
                              color: AppColors.outline,
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            dossier.playerCount,
                            style: TextStyle(
                              fontFamily: 'Bebas Neue',
                              fontSize: 14.sp,
                              color: AppColors.onSurface,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'DURATION',
                            style: TextStyle(
                              fontFamily: 'Courier Prime',
                              fontSize: 10.sp,
                              color: AppColors.outline,
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            dossier.duration,
                            style: TextStyle(
                              fontFamily: 'Bebas Neue',
                              fontSize: 14.sp,
                              color: AppColors.onSurface,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    width: double.infinity,
                    height: 48.h,
                    child: ElevatedButton(
                      onPressed: () {
                        context.push(dossier.route);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryContainer,
                        foregroundColor: AppColors.pitchBlack,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'INITIATE_PLAY',
                            style: TextStyle(
                              fontFamily: 'Bebas Neue',
                              fontSize: 18.sp,
                              letterSpacing: 1.2,
                            ),
                          ),
                          SizedBox(width: 8.w),
                          const Icon(Icons.play_arrow, size: 18),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildBottomNav() {
    return Container(
      height: 64.h,
      color: AppColors.surfaceContainerLowest,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(Icons.grid_view, 'GAMES', true),
          _navItem(Icons.military_tech_outlined, 'RANKS', false),
          _navItem(Icons.folder_outlined, 'ASSETS', false),
        ],
      ),
    );
  }

  Widget _navItem(IconData icon, String label, bool isSelected) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      color: isSelected ? AppColors.secondaryContainer : Colors.transparent,
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
            color: isSelected ? AppColors.onSecondaryContainer : AppColors.outline,
          ),
          if (isSelected) ...[
            SizedBox(width: 8.w),
            Text(
              label,
              style: TextStyle(
                fontFamily: 'Bebas Neue',
                fontSize: 14.sp,
                color: AppColors.onSecondaryContainer,
                letterSpacing: 1.0,
              ),
            ),
          ],
        ],
      ),
    );
  }
}