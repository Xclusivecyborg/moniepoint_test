import 'package:flutter/material.dart';
import 'package:moniepoint_test/%20core/utils/colors.dart';

import 'package:moniepoint_test/%20core/utils/extensions/text_extension.dart';
import 'package:moniepoint_test/features/home/domain/about_item_model.dart';
import 'package:moniepoint_test/features/home/domain/product_item.dart';

class AboutItem extends StatefulWidget {
  final ProductItem item;
  const AboutItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  State<AboutItem> createState() => _AboutItemState();
}

class _AboutItemState extends State<AboutItem> {
  List<AboutItemModel> itemDetails = [];
  @override
  void initState() {
    super.initState();
    itemDetails = [
      AboutItemModel(
        firstTitle: 'Brand:',
        secondTitle: "Color:",
        firstDescription: widget.item.designer,
        secondDescription: widget.item.color,
      ),
      AboutItemModel(
        firstTitle: 'Category:',
        secondTitle: "Material:",
        firstDescription: widget.item.category,
        secondDescription: widget.item.material,
      ),
      AboutItemModel(
        firstTitle: 'Condition:',
        secondTitle: "Heavy:",
        firstDescription: widget.item.category,
        secondDescription: widget.item.weight,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      ...List.generate(
        itemDetails.length,
        (index) => Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _getRow(
                title: itemDetails[index].firstTitle,
                description: itemDetails[index].firstDescription,
              ),
              _getRow(
                title: itemDetails[index].secondTitle,
                description: itemDetails[index].secondDescription,
              ),
            ],
          ),
        ),
      ),
      const SizedBox(height: 20),
      const Divider(color: AppColors.greyLight),
    ]);
  }

  Expanded _getRow({
    required String title,
    required String description,
  }) {
    return Expanded(
      child: Row(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMediumText.copyWith(
                  color: AppColors.greyLight,
                ),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            description,
            style: Theme.of(context)
                .textTheme
                .titleMediumText
                .copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
