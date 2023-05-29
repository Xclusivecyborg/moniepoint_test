import 'package:flutter/material.dart';
import 'package:moniepoint_test/%20core/utils/colors.dart';
import 'package:moniepoint_test/%20core/utils/extensions/text_extension.dart';
import 'package:moniepoint_test/features/home/presentation/widgets/item_detail/top_review_title.dart';

class TopReviews extends StatelessWidget {
  const TopReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TopReviewTitle(),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) {
            return const Divider(height: 5, color: AppColors.greyLight);
          },
          itemCount: 3,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return const ReviewCard();
          },
        )
      ],
    );
  }
}

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 30,
                    width: 30,
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/image1.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Ayodeji Ogun****ro',
                    style: Theme.of(context)
                        .textTheme
                        .titleText
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star_rounded,
                    color: Colors.amber,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '5.0',
                    style: Theme.of(context).textTheme.titleText.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(width: 10),
                  const Icon(
                    Icons.more_horiz,
                    color: AppColors.greyLight,
                  )
                ],
              ),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                3,
                (index) => Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Chip(
                    padding: EdgeInsets.zero,
                    label: Text(
                      'Product in good condition',
                      style: TextStyle(
                        fontSize: 10,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    backgroundColor: Colors.teal.shade50,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          Text(
            'According to my expectations. This is the best.\nThank you',
            style: Theme.of(context)
                .textTheme
                .titleMediumText
                .copyWith(fontWeight: FontWeight.w700),
          ),
          const Spacer(),
          Row(
            children: [
              Icon(
                Icons.thumb_up_rounded,
                color: AppColors.primaryColor,
                size: 15,
              ),
              const SizedBox(width: 5),
              Text(
                'Helpful ?',
                style: Theme.of(context).textTheme.titleMediumText.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const Spacer(),
              Text(
                'Yesterdays',
                style: Theme.of(context).textTheme.titleText,
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
