import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../cubits/decryption_game_cubit.dart';
import '../cubits/decryption_game_state.dart';
import '../widgets/report_header_widget.dart';
import '../widgets/retry_button_widget.dart';
import '../widgets/score_display_widget.dart';
import '../widgets/word_result_item_widget.dart';


class CharadesReportScreen extends StatelessWidget {
  const CharadesReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pitchBlack,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.deepCharcoal,
              border: Border.all(color: AppColors.outlineVariant),
            ),
            child: BlocBuilder<DecryptionGameCubit, DecryptionGameState>(
              builder: (context, state) {
                if (state is! GameOver) {
                  return const Center(child: CircularProgressIndicator());
                }

                return Column(
                  children: [
                    const ReportHeaderWidget(),
                    const Divider(height: 1),
                    ScoreDisplayWidget(score: state.score),
                    const Divider(height: 1),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.results.length,
                        itemBuilder: (context, index) {
                          return WordResultItemWidget(
                            index: index,
                            result: state.results[index],
                          );
                        },
                      ),
                    ),
                    const Divider(height: 1),
                    const RetryButtonWidget(),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}