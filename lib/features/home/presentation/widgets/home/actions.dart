
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moniepoint_test/%20core/utils/colors.dart';
import 'package:moniepoint_test/%20core/utils/extensions/text_extension.dart';
import 'package:moniepoint_test/features/home/data/home_repository.dart';

class HomeActions extends StatelessWidget {
  HomeActions({super.key});
  final _repository = HomeRepository();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            height: 80,
            padding: const EdgeInsets.only(top: 10),
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: _repository.actions.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SvgPicture.asset(
                        '${_repository.actions[index].icon}.svg',
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      (_repository.actions[index].title),
                      style: Theme.of(context).textTheme.titleText,
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 30,
                );
              },
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
              (index) => AnimatedContainer(
                curve: Curves.linearToEaseOut,
                margin: const EdgeInsets.all(2),
                duration: const Duration(
                  milliseconds: 500,
                ),
                height: 3,
                width: index == 0 ? 10 : 3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: index == 0 ? AppColors.deepGrey : AppColors.greyLight,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
