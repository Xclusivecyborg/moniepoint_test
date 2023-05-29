import 'package:flutter/material.dart';
import 'package:moniepoint_test/%20core/utils/colors.dart';
import 'package:moniepoint_test/%20core/utils/extensions/text_extension.dart';

class ReviewAndRatings extends StatelessWidget {
  const ReviewAndRatings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Reviews & Ratings',
          style: Theme.of(context)
              .textTheme
              .titleMediumText
              .copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      '4.9',
                      style: Theme.of(context).textTheme.header3.copyWith(
                            fontWeight: FontWeight.w800,
                            fontSize: 40,
                          ),
                    ),
                    Text(
                      '/ 5.0',
                      style: Theme.of(context).textTheme.titleMediumText,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: List.generate(
                    5,
                    (index) => const Icon(
                      Icons.star_rounded,
                      color: Colors.amber,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                const Text(
                  '2.9k + Reviews',
                  style: TextStyle(
                    color: AppColors.greyLight,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                children: List.generate(
                  5,
                  (index) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          color: Colors.amber,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          (index - 5).toString().split('-')[1],
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: SizedBox(
                            height: 10,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: LinearProgressIndicator(
                                color: AppColors.primaryColor,
                                backgroundColor: AppColors.greyLight,
                                value: double.parse(
                                        (index - 5).toString().split('-')[1]) /
                                    5,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        SizedBox(
                          width: 20,
                          child: Text(
                            (index - 5).toString().substring(1) +
                                (index < 2 ? 'k' : ''),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 20),
        const Divider(color: AppColors.greyLight),
        const SizedBox(height: 20),
      ],
    );
  }
}
