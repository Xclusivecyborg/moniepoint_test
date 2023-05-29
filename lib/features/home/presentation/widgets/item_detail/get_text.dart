import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moniepoint_test/%20core/utils/colors.dart';
import 'package:moniepoint_test/%20core/utils/extensions/text_extension.dart';
import 'package:moniepoint_test/features/home/domain/product_item.dart';

class ItemText extends StatelessWidget {
  const ItemText({
    super.key,
    required this.item,
  });
  final ProductItem item;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SvgPicture.asset(
              'assets/icons/shop.svg',
              height: 20,
            ),
            const SizedBox(width: 5),
            Text(
              item.designer,
              style: Theme.of(context).textTheme.titleText.copyWith(
                    color: AppColors.greyLight,
                    fontSize: 15,
                  ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          item.name,
          style: Theme.of(context).textTheme.header3SemiBold,
        ),
      ],
    );
  }
}
