import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/l10n_extensions.dart';
import '../../domain/entities/game_dossier_entity.dart';

class HomeDossierCard extends StatelessWidget {
  final GameDossierEntity dossier;

  const HomeDossierCard({required this.dossier, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.deepCharcoal,
        border: Border.all(
          color: AppColors.metallicSilver.withValues(alpha: 0.2),
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
                  context.l10n.gameCategory,
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
                    context.l10n.activeTag,
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
            _localizedGameTitle(context, dossier),
            style: TextStyle(
              fontFamily: 'Bebas Neue',
              fontSize: 32.sp,
              color: AppColors.neonAmber,
              letterSpacing: 1.0,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            _localizedGameDescription(context, dossier),
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
                    context.l10n.operatives,
                    style: TextStyle(
                      fontFamily: 'Courier Prime',
                      fontSize: 10.sp,
                      color: AppColors.outline,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    _localizedPlayerCount(context, dossier),
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
                    context.l10n.durationLabel,
                    style: TextStyle(
                      fontFamily: 'Courier Prime',
                      fontSize: 10.sp,
                      color: AppColors.outline,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    _localizedDuration(context, dossier),
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
              onPressed: () => context.push(dossier.route),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryContainer,
                foregroundColor: AppColors.pitchBlack,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      context.l10n.initiatePlay,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0,
                        height: 1.2,
                        color: AppColors.pitchBlack,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    const Icon(Icons.play_arrow, size: 18),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _localizedGameTitle(BuildContext context, GameDossierEntity game) {
    switch (game.id) {
      case 'spyfall':
        return context.l10n.spyfallTitle;
      case 'charades':
        return context.l10n.charadesTitle;
      default:
        return game.title;
    }
  }

  String _localizedGameDescription(
    BuildContext context,
    GameDossierEntity game,
  ) {
    switch (game.id) {
      case 'spyfall':
        return context.l10n.spyfallDescription;
      case 'charades':
        return context.l10n.charadesDescription;
      default:
        return game.description;
    }
  }

  String _localizedPlayerCount(BuildContext context, GameDossierEntity game) {
    switch (game.id) {
      case 'spyfall':
        return context.l10n.spyfallPlayers;
      case 'charades':
        return context.l10n.charadesPlayers;
      default:
        return game.playerCount;
    }
  }

  String _localizedDuration(BuildContext context, GameDossierEntity game) {
    switch (game.id) {
      case 'spyfall':
        return context.l10n.spyfallDuration;
      case 'charades':
        return context.l10n.charadesDuration;
      default:
        return game.duration;
    }
  }
}
