import 'package:flutter/material.dart';
import 'package:moniepoint_test/features/home/presentation/widgets/home/actions.dart';
import 'package:moniepoint_test/features/home/presentation/widgets/home/best_sale_product_text.dart';
import 'package:moniepoint_test/features/home/presentation/widgets/home/sliver_carousel.dart';

import 'search_textfield.dart';

class HomeSliverAppBar extends StatelessWidget {
  const HomeSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return SliverAppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      titleSpacing: 0,
      toolbarHeight: height * 0.13,
      collapsedHeight: height * 0.2,
      title: const SearchBar(),
      pinned: true,
      expandedHeight: height * 0.5,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        titlePadding: EdgeInsets.zero,
        expandedTitleScale: 1,
        title: const BestSaleProductText(),
        background: Column(
          children: [
            const HomeCarouselSlider(),
            HomeActions(),
          ],
        ),
      ),
    );
  }
}
