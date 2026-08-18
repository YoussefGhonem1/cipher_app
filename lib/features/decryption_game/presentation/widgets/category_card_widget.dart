import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/category_entity.dart';

class CategoryCardWidget extends StatelessWidget {
  final CategoryEntity category;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryCardWidget({
    super.key,
    required this.category,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05,
          vertical: 8.0,
        ),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: theme.cardColor,
          border: Border.all(
            color: isSelected ? theme.primaryColor : Colors.transparent,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: theme.primaryColor.withOpacity(0.2),
                    blurRadius: 8.0,
                    spreadRadius: 2.0,
                  )
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  category.title,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: isSelected ? theme.primaryColor : AppColors.onSurface,
                  ),
                ),
                Icon(
                  isSelected ? Icons.radio_button_checked : Icons.radio_button_unchecked,
                  color: isSelected ? theme.primaryColor : AppColors.outline,
                ),
              ],
            ),
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: Image.asset(
                category.imagePath,
                width: double.infinity,
                height: 120,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 120,
                  color: AppColors.surfaceContainerHigh,
                  child: const Center(
                    child: Icon(
                      Icons.image_not_supported,
                      color: AppColors.outline,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              category.description,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: AppColors.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Container(
                  width: 3,
                  height: 16,
                  color: category.intelLevel.contains('سري') || category.intelLevel.contains('CLASSIFIED')
                      ? theme.colorScheme.error 
                      : theme.primaryColor,
                ),
                const SizedBox(width: 8),
                Text(
                  category.intelLevel,
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: AppColors.onSurface,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}