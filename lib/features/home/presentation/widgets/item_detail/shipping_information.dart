import 'package:flutter/material.dart';
import 'package:moniepoint_test/%20core/utils/colors.dart';
import 'package:moniepoint_test/%20core/utils/extensions/text_extension.dart';
import 'package:moniepoint_test/features/home/domain/about_item_model.dart';
import 'package:moniepoint_test/features/home/domain/product_item.dart';

class ShippingInformation extends StatefulWidget {
  const ShippingInformation({
    super.key,
    required this.item,
  });
  final ProductItem item;

  @override
  State<ShippingInformation> createState() => _ShippingInformationState();
}

class _ShippingInformationState extends State<ShippingInformation> {
  List<AboutItemModel> shippingInfo = [];
  @override
  void initState() {
    super.initState();
    shippingInfo = [
      AboutItemModel(
        firstTitle: 'Delivery:',
        firstDescription: widget.item.delivery,
      ),
      AboutItemModel(
        firstTitle: 'Shipping:',
        firstDescription: widget.item.shipping,
      ),
      AboutItemModel(
        firstTitle: 'Arrive:',
        firstDescription: widget.item.arrive,
      ),
    ];
  }

  Widget _getRow({
    required String title,
    required String description,
  }) {
    return Row(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          'Shipping Information:',
          style: Theme.of(context)
              .textTheme
              .header3
              .copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 20),
        ...List.generate(
          shippingInfo.length,
          (index) => Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: _getRow(
              title: shippingInfo[index].firstTitle,
              description: shippingInfo[index].firstDescription,
            ),
          ),
        ),
        const SizedBox(height: 26),
        const Divider(
          color: AppColors.greyLight,
        ),
      ],
    );
  }
}
