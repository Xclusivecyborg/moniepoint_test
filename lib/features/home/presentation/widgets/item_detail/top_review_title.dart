import 'package:flutter/material.dart';
import 'package:moniepoint_test/%20core/utils/colors.dart';
import 'package:moniepoint_test/%20core/utils/extensions/text_extension.dart';

class TopReviewTitle extends StatelessWidget {
  const TopReviewTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Top Reviews:',
                  style: Theme.of(context).textTheme.header3.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Showing 3 out of 12.6k+ reviews',
                  style: Theme.of(context).textTheme.titleMediumText.copyWith(
                        color: AppColors.greyLight,
                      ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: AppColors.greyLight,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  icon: const Icon(Icons.keyboard_arrow_down),
                  focusColor: AppColors.pink,
                  dropdownColor: AppColors.primaryColor,
                  value: 'Popular',
                  items: [
                    'Popular',
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {},
                  style: Theme.of(context).textTheme.titleMediumText.copyWith(
                        color: Colors.black,
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
