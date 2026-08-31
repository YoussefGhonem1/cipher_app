import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/services/hive_service.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/l10n_extensions.dart';
import '../../../game_sync/cubit/game_sync_cubit.dart';
import '../../../game_sync/cubit/game_sync_state.dart';
import '../../domain/entities/game_dossier_entity.dart';

class HomeDossierCard extends StatefulWidget {
  final GameDossierEntity dossier;

  const HomeDossierCard({required this.dossier, super.key});

  @override
  State<HomeDossierCard> createState() => _HomeDossierCardState();
}

class _HomeDossierCardState extends State<HomeDossierCard> {
  late GameSyncCubit _syncCubit;

  @override
  void initState() {
    super.initState();
    _syncCubit = getIt<GameSyncCubit>();

    final box = Hive.box(HiveService.gameBoxName);
    final String syncId = widget.dossier.id == 'casino' ? 'the_vault' : widget.dossier.id;
    final bool isDownloaded = box.containsKey(syncId);

    if ((isDownloaded || widget.dossier.isActive) &&
        syncId != 'spyfall' &&
        syncId != 'charades') {
      _syncCubit.fetchAndSyncGame(syncId);
    }
  }

  @override
  void dispose() {
    _syncCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final box = Hive.box(HiveService.gameBoxName);
    final String syncId = widget.dossier.id == 'casino' ? 'the_vault' : widget.dossier.id;
    final bool isInitiallyDownloaded = box.containsKey(syncId);

    return BlocProvider.value(
      value: _syncCubit,
      child: BlocConsumer<GameSyncCubit, GameSyncState>(
        listener: (context, state) {
          if (state is GameSyncSuccess && state.isUpdated) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(context.l10n.decrypted),
                backgroundColor: Colors.green,
                duration: const Duration(seconds: 2),
              ),
            );
          } else if (state is GameSyncError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: AppColors.error,
              ),
            );
          }
        },
        builder: (context, state) {
          bool isDownloading = state is GameSyncLoading;
          bool isNewlyDownloaded = state is GameSyncSuccess;

          bool readyToPlay = isInitiallyDownloaded ||
              widget.dossier.isActive ||
              isNewlyDownloaded;

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
                  _localizedGameTitle(context, widget.dossier),
                  style: TextStyle(
                    fontFamily: 'Bebas Neue',
                    fontSize: 32.sp,
                    color: readyToPlay ? AppColors.neonAmber : AppColors.outline,
                    letterSpacing: 1.0,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  _localizedGameDescription(context, widget.dossier),
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
                          _localizedPlayerCount(context, widget.dossier),
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
                          _localizedDuration(context, widget.dossier),
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
                              context.push(widget.dossier.route);
                            } else {
                              if (syncId != 'spyfall' && syncId != 'charades') {
                                _syncCubit.fetchAndSyncGame(syncId);
                              }
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
                                  readyToPlay ? Icons.play_arrow : Icons.download,
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

  String _localizedGameTitle(BuildContext context, GameDossierEntity game) {
    switch (game.id) {
      case 'spyfall':
        return context.l10n.spyfallTitle;
      case 'charades':
        return context.l10n.charadesTitle;
      case 'the_vault':
        return context.l10n.vaultTitle;
      case 'casino':
        return context.l10n.casinoTitle;
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
      case 'casino':
        return context.l10n.casinoDescription;
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
      case 'casino':
        return context.l10n.casinoPlayers;
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
      case 'casino':
        return context.l10n.casinoDuration;
      default:
        return game.duration;
    }
  }
}