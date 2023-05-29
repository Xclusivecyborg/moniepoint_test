import 'package:flutter/material.dart';
import 'package:moniepoint_test/%20core/utils/colors.dart';
import 'package:moniepoint_test/%20core/utils/extensions/text_extension.dart';

class AboutItemTab extends StatefulWidget {
  const AboutItemTab({super.key});

  @override
  State<AboutItemTab> createState() => _AboutItemTabState();
}

class _AboutItemTabState extends State<AboutItemTab> {
  int selectedIndex = 0;
  List<String> modelList = ['About item', 'Review'];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Divider(
            height: 0,
            color: AppColors.greyLight.withOpacity(0.25),
            thickness: 2,
          ),
          ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                selectedIndex = index;
                setState(() {});
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    modelList[index],
                    style: Theme.of(context).textTheme.titleMediumText.copyWith(
                          fontWeight: FontWeight.w600,
                          color: selectedIndex == index
                              ? AppColors.primaryColor
                              : AppColors.greyLight,
                        ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 2,
                      width: 150,
                      curve: Curves.decelerate,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: selectedIndex == index
                            ? AppColors.primaryColor
                            : Colors.transparent,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemCount: modelList.length,
          ),
        ],
      ),
    );
  }
}
