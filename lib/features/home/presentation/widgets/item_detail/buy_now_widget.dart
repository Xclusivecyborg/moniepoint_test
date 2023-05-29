import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moniepoint_test/%20core/utils/colors.dart';
import 'package:moniepoint_test/%20core/utils/extensions/text_extension.dart';
import 'package:moniepoint_test/features/home/domain/product_item.dart';

class BuyNowWidget extends StatelessWidget {
  final ProductItem item;
  const BuyNowWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      // height: 150,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              children: [
                Text(
                  'Total Price',
                  style: Theme.of(context).textTheme.titleMediumText.copyWith(
                        fontSize: 14,
                        color: AppColors.greyLight,
                        fontWeight: FontWeight.w700,
                      ),
                ),
                Text(
                  '\$${item.price}',
                  style: Theme.of(context).textTheme.titleMediumText.copyWith(
                        fontSize: 24,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  alignment: Alignment.center,
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/bag.svg',
                        colorFilter: const ColorFilter.mode(
                            Colors.white, BlendMode.srcIn),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '1',
                        style: Theme.of(context)
                            .textTheme
                            .titleMediumText
                            .copyWith(
                              fontSize: 14,
                              color: AppColors.white,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  alignment: Alignment.center,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: AppColors.deepGrey,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                  ),
                  child: Text(
                    'Buy Now',
                    style: Theme.of(context).textTheme.titleMediumText.copyWith(
                          fontSize: 14,
                          color: AppColors.white,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
