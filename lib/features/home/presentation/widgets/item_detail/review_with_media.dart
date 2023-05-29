import 'package:flutter/material.dart';
import 'package:moniepoint_test/%20core/utils/colors.dart';
import 'package:moniepoint_test/%20core/utils/extensions/text_extension.dart';

class ReviewWithMedia extends StatelessWidget {
  const ReviewWithMedia({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Review with images & videos',
          style: Theme.of(context)
              .textTheme
              .titleMediumText
              .copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: height * 0.055,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  height: height * 0.06,
                  width: height * 0.06,
                  child: Image.asset(
                    'assets/images/image${index + 1}.jpg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              width: 20,
            ),
            itemCount: 4,
          ),
        ),
        const SizedBox(height: 20),
        const Divider(color: AppColors.greyLight),
      ],
    );
  }
}
