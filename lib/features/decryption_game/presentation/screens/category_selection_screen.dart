import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../cubits/decryption_game_cubit.dart';
import '../cubits/decryption_game_state.dart';
import '../widgets/category_card_widget.dart';
import '../widgets/category_header_widget.dart';
import '../widgets/nexus_app_bar.dart';
import '../widgets/start_mission_button.dart';

class CategorySelectionScreen extends StatefulWidget {
  const CategorySelectionScreen({super.key});

  @override
  State<CategorySelectionScreen> createState() => _CategorySelectionScreenState();
}

class _CategorySelectionScreenState extends State<CategorySelectionScreen> {
  bool _isInit = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInit) {
      final langCode = Localizations.localeOf(context).languageCode;
      context.read<DecryptionGameCubit>().fetchCategories(langCode);
      _isInit = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DecryptionGameCubit, DecryptionGameState>(
      listenWhen: (previous, current) => previous is! GamePreparation && current is GamePreparation,
      listener: (context, state) {
        if (state is GamePreparation) {
          context.push('/charades-prep', extra: context.read<DecryptionGameCubit>());
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const NexusAppBar(),
              const SizedBox(height: 16),
              const CategoryHeaderWidget(),
              const SizedBox(height: 24),
              Expanded(
                child: BlocBuilder<DecryptionGameCubit, DecryptionGameState>(
                  buildWhen: (previous, current) =>
                      current is CategoriesLoading || current is CategoriesLoaded || current is CategoriesError,
                  builder: (context, state) {
                    if (state is CategoriesLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is CategoriesError) {
                      return Center(child: Text(state.message));
                    } else if (state is CategoriesLoaded) {
                      return ListView.builder(
                        itemCount: state.categories.length,
                        itemBuilder: (context, index) {
                          final category = state.categories[index];
                          final isSelected = state.selectedCategory?.id == category.id;

                          return CategoryCardWidget(
                            category: category,
                            isSelected: isSelected,
                            onTap: () {
                              context.read<DecryptionGameCubit>().selectCategory(category);
                            },
                          );
                        },
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ),
              BlocBuilder<DecryptionGameCubit, DecryptionGameState>(
                builder: (context, state) {
                  if (state is CategoriesLoaded && state.selectedCategory != null) {
                    return StartMissionButton(
                      onTap: () {
                        context.read<DecryptionGameCubit>().startPreparation();
                      },
                    );
                  }
                  return const SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}