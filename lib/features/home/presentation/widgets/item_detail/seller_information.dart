import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moniepoint_test/%20core/utils/colors.dart';
import 'package:moniepoint_test/%20core/utils/extensions/text_extension.dart';

class SellerInformation extends StatelessWidget {
  const SellerInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Seller information:',
          style: Theme.of(context)
              .textTheme
              .titleMediumText
              .copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 40,
                  width: 40,
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/image1.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  right: 1,
                  bottom: 1,
                  child: Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      color: AppColors.greyLight,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Thrifting_Store',
                    style: Theme.of(context)
                        .textTheme
                        .titleMediumText
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    children: [
                      Text('Active 15 mins ago | ',
                          style: Theme.of(context).textTheme.titleText),
                      Text('57.2 positive feedback',
                          style: Theme.of(context).textTheme.titleText),
                    ],
                  ),
                  const SizedBox(height: 10),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: AppColors.primaryColor,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/shop.svg',
                            colorFilter: ColorFilter.mode(
                              AppColors.primaryColor,
                              BlendMode.srcIn,
                            ),
                            fit: BoxFit.scaleDown,
                            height: 15,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'Visit Store',
                            style:
                                Theme.of(context).textTheme.titleText.copyWith(
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            )
          ],
        ),
        const Divider(color: AppColors.greyLight),
        const SizedBox(height: 20),
      ],
    );
  }
}
