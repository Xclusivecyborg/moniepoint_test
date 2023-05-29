import 'package:flutter/material.dart';
import 'package:moniepoint_test/%20core/utils/colors.dart';
import 'package:moniepoint_test/%20core/utils/extensions/text_extension.dart';

import 'package:moniepoint_test/features/home/domain/product_item.dart';

class ItemCardDisplay extends StatelessWidget {
  final VoidCallback onTap;
  final ProductItem data;
  final int index;
  const ItemCardDisplay({
    Key? key,
    required this.onTap,
    required this.data,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(index.isOdd ? 15 : 0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 1.5),
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Image.asset(
                      data.imagesUrls[0],
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                    const Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 10.0, top: 10.0),
                        child: Icon(Icons.favorite_outline_rounded),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.category,
                      style: Theme.of(context).textTheme.titleText.copyWith(
                            color: AppColors.greyLight,
                          ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      data.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .titleText
                          .copyWith(fontWeight: FontWeight.w600, height: 1.5),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.star_rounded,
                              color: Colors.amber,
                              size: 16,
                            ),
                            const SizedBox(
                              width: 0.5,
                            ),
                            Text(
                              '${data.rating} | 2,302',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleText
                                  .copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                            )
                          ],
                        ),
                        Text(
                          '\$${data.price}',
                          style: Theme.of(context)
                              .textTheme
                              .titleMediumText
                              .copyWith(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
