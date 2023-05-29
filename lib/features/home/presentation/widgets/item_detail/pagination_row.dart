import 'package:flutter/material.dart';
import 'package:moniepoint_test/%20core/utils/colors.dart';
import 'package:moniepoint_test/%20core/utils/extensions/text_extension.dart';

class PaginationRow extends StatelessWidget {
  const PaginationRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _paginationIcon(Icons.chevron_left, false),
        const SizedBox(width: 10),
        ...List.generate(
          4,
          (index) => Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Text(
              index == 3 ? '.....' : '${index + 1}',
              style: Theme.of(context).textTheme.titleText.copyWith(
                    color: index == 0 ? AppColors.primaryColor : null,
                  ),
            ),
          ),
        ),
        _paginationIcon(Icons.chevron_right, true),
        const Spacer(),
        Text(
          'See more',
          style: Theme.of(context).textTheme.titleText.copyWith(
                fontSize: 12,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w600,
              ),
        )
      ],
    );
  }

  Container _paginationIcon(IconData icon, bool withElevation) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: withElevation
            ? AppColors.white
            : AppColors.greyLight.withOpacity(0.2),
        shape: BoxShape.circle,
        boxShadow: [
          if (withElevation) ...[
            BoxShadow(
              offset: const Offset(0, 1),
              spreadRadius: 1,
              color: AppColors.greyLight.withOpacity(0.2),
            ),
          ],
        ],
      ),
      child: Icon(icon),
    );
  }
}
