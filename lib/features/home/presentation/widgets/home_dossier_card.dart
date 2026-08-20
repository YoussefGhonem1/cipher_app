import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/services/hive_service.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/l10n_extensions.dart';
import '../../../game_sync/cubit/game_sync_cubit.dart';
import '../../../game_sync/cubit/game_sync_state.dart';
import '../../domain/entities/game_dossier_entity.dart';

class HomeDossierCard extends StatelessWidget {
  final GameDossierEntity dossier;

  const HomeDossierCard({required this.dossier, super.key});

  @override
  Widget build(BuildContext context) {
    // Check if the game is already downloaded and cached locally in Hive
    final box = Hive.box(HiveService.gameBoxName);
    final bool isDownloaded = box.containsKey(dossier.id);

    return BlocProvider(
      create: (context) => GameSyncCubit(),
      child: BlocConsumer<GameSyncCubit, GameSyncState>(
        listener: (context, state) {
          if (state is GameSyncSuccess) {
            // Once downloaded successfully, navigate to the game or refresh UI
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Download complete! Tap again to play.'),
              ),
            );
          } else if (state is GameSyncError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          bool isDownloading = state is GameSyncLoading;
          bool isNewlyDownloaded = state is GameSyncSuccess;

          bool readyToPlay =
              isDownloaded || dossier.isActive || isNewlyDownloaded;

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
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 4.h,
                      ),
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
                          color: readyToPlay
                              ? AppColors.neonAmber
                              : AppColors.outline,
                        ),
                        SizedBox(width: 6.w),
                        Text(
                          readyToPlay
                              ? context.l10n.activeTag
                              : context.l10n.inactiveTag,
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
                    color: readyToPlay
                        ? AppColors.neonAmber
                        : AppColors.outline,
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
                  height: 52.h,
                  child: ElevatedButton(
                    onPressed: isDownloading
                        ? null
                        : () {
                            if (readyToPlay) {
                              context.push(dossier.route);
                            } else {
                              // Trigger download from Firebase via Cubit
                              context.read<GameSyncCubit>().fetchAndSyncGame(
                                dossier.id,
                              );
                            }
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: readyToPlay
                          ? AppColors.primaryContainer
                          : AppColors.surfaceContainerHighest,
                      foregroundColor: readyToPlay
                          ? AppColors.pitchBlack
                          : AppColors.onSurface,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    child: isDownloading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : Directionality(
                            textDirection: TextDirection.rtl,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  readyToPlay
                                      ? context.l10n.initiatePlay
                                      : context.l10n.downloadGame,
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                Icon(
                                  readyToPlay
                                      ? Icons.play_arrow
                                      : Icons.download,
                                  size: 18,
                                ),
                              ],
                            ),
                          ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // Replace the helper methods at the bottom of the file with these:
  String _localizedGameTitle(BuildContext context, GameDossierEntity game) {
    switch (game.id) {
      case 'spyfall':
        return context.l10n.spyfallTitle;
      case 'charades':
        return context.l10n.charadesTitle;
      case 'the_vault':
        return context.l10n.vaultTitle;
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
      case 'the_vault':
        return context.l10n.vaultDescription;
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
      case 'the_vault':
        return context.l10n.vaultPlayers;
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
      case 'the_vault':
        return context.l10n.vaultDuration;
      default:
        return game.duration;
    }
  }
}
