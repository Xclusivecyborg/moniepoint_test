import 'package:flutter/material.dart';
import 'package:moniepoint_test/%20core/utils/colors.dart';
import 'package:moniepoint_test/%20core/utils/extensions/text_extension.dart';

class BestSaleProductText extends StatelessWidget {
  const BestSaleProductText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade100,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Best Sale Product',
            style: Theme.of(context).textTheme.header3SemiBold.copyWith(
                  color: Colors.black,
                ),
          ),
          Text(
            'See more',
            style: Theme.of(context).textTheme.header3SemiBold.copyWith(
                  fontSize: 12,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
          )
        ],
      ),
    );
  }
}
