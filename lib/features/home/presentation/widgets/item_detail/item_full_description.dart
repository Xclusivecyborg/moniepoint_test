import 'package:flutter/material.dart';
import 'package:moniepoint_test/%20core/utils/colors.dart';
import 'package:moniepoint_test/%20core/utils/extensions/text_extension.dart';
import 'package:moniepoint_test/features/home/domain/product_item.dart';

class ItemFullDescription extends StatefulWidget {
  const ItemFullDescription({
    super.key,
    required this.item,
  });
  final ProductItem item;

  @override
  State<ItemFullDescription> createState() => _ItemFullDescriptionState();
}

class _ItemFullDescriptionState extends State<ItemFullDescription> {
  bool _showMore = true;
  List<String> fullDescription = [];

  @override
  void initState() {
    super.initState();
    fullDescription = widget.item.fullDescription;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        Text(
          'Description:',
          style: Theme.of(context)
              .textTheme
              .header3
              .copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 15),
        ...List.generate(
          _showMore ? fullDescription.length : fullDescription.take(2).length,
          (index) => Center(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    height: 5,
                    width: 5,
                    decoration: const BoxDecoration(
                      color: AppColors.greyLight,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      fullDescription[index],
                      style:
                          Theme.of(context).textTheme.titleMediumText.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColors.greyLight,
                              ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (_showMore) ...[
          const SizedBox(height: 25),
          Text(
            'Chat us if there is anything you need to know about the product  :)',
            style: Theme.of(context).textTheme.titleMediumText.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.greyLight,
                ),
          ),
        ],
        const SizedBox(height: 10),
        TextButton.icon(
          icon: Text(
            _showMore ? 'See less' : 'See more',
            style: Theme.of(context).textTheme.titleMediumText.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor,
                ),
          ),
          onPressed: () {
            setState(() {
              _showMore = !_showMore;
            });
          },
          label: Icon(
            _showMore ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
            color: AppColors.greyLight,
          ),
        ),
        const SizedBox(height: 15),
        const Divider(color: AppColors.greyLight),
      ],
    );
  }
}
