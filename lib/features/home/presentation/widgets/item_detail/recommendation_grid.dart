import 'package:flutter/material.dart';
import 'package:moniepoint_test/%20core/utils/colors.dart';
import 'package:moniepoint_test/%20core/utils/extensions/text_extension.dart';
import 'package:moniepoint_test/features/home/presentation/widgets/home/sales_grid_view.dart';

class RecommendationGrid extends StatelessWidget {
  const RecommendationGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recommendation',
              style: Theme.of(context)
                  .textTheme
                  .titleMediumText
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            Text(
          'See more',
          style: Theme.of(context).textTheme.titleText.copyWith(
                fontSize: 12,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w400,
              ),
        )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const ProductGridView(
          padding: EdgeInsets.zero,
        ),
      ],
    );
  }
}
