import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moniepoint_test/%20core/utils/colors.dart';
import 'package:moniepoint_test/%20core/utils/extensions/text_extension.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(bottom: 20, top: 20, left: 20),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Transform.scale(
              scaleY: 0.9,
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Transform.scale(
                    scale: 0.6,
                    child: SvgPicture.asset(
                      'assets/icons/search.svg',
                      fit: BoxFit.scaleDown,
                      height: 10,
                      width: 10,
                      colorFilter: const ColorFilter.mode(
                        AppColors.greyLight,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  hintText: 'Search..',
                  hintStyle:
                      Theme.of(context).textTheme.titleMediumText.copyWith(
                            color: AppColors.greyLight,
                            fontSize: 16,
                          ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: AppColors.greyLight,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: AppColors.greyLight,
                    ),
                  ),
                ),
              ),
            ),
          ),
          _getIcon('assets/icons/bag.svg', 1, context),
          _getIcon('assets/icons/message.svg', 10, context),
        ],
      ),
    );
  }

  _getIcon(String icon, int count, BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          icon,
          width: 50,
          fit: BoxFit.scaleDown,
        ),
        Positioned(
          right: 5,
          top: 7,
          child: Container(
            width: 20,
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            margin: const EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: AppColors.pink,
            ),
            child: Center(
              child: Text(
                count > 9 ? '9+' : '$count',
                style: Theme.of(context).textTheme.titleText,
              ),
            ),
          ),
        )
      ],
    );
  }
}
