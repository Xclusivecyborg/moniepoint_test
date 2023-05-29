import 'package:flutter/material.dart';
import 'package:moniepoint_test/%20core/utils/colors.dart';
import 'package:moniepoint_test/features/home/domain/product_item.dart';

class ProductReview extends StatelessWidget {
  final ProductItem item;
  const ProductReview({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(
              Icons.star_rounded,
              color: Colors.amber,
              size: 16,
            ),
            Text(
              '${item.rating} Ratings',
              style: const TextStyle(
                color: AppColors.greyLight,
              ),
            )
          ],
        ),
        Container(
          height: 8,
          width: 8,
          decoration: const BoxDecoration(
            color: AppColors.greyLight,
            shape: BoxShape.circle,
          ),
        ),
        const Text(
          '2.5k + Reviews',
          style: TextStyle(
            color: AppColors.greyLight,
          ),
        ),
        Container(
          height: 8,
          width: 8,
          decoration: const BoxDecoration(
            color: AppColors.greyLight,
            shape: BoxShape.circle,
          ),
        ),
        const Text(
          '2.9k + Sold',
          style: TextStyle(
            color: AppColors.greyLight,
          ),
        ),
      ],
    );
  }
}
