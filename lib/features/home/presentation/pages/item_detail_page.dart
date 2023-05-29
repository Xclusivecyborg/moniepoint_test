import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moniepoint_test/%20core/utils/colors.dart';
import 'package:moniepoint_test/features/home/domain/product_item.dart';
import 'package:moniepoint_test/features/home/presentation/widgets/home/sales_grid_view.dart';
import 'package:moniepoint_test/features/home/presentation/widgets/item_detail/about_product.dart';
import 'package:moniepoint_test/features/home/presentation/widgets/item_detail/buy_now_widget.dart';
import 'package:moniepoint_test/features/home/presentation/widgets/item_detail/get_text.dart';
import 'package:moniepoint_test/features/home/presentation/widgets/item_detail/item_full_description.dart';
import 'package:moniepoint_test/features/home/presentation/widgets/item_detail/pagination_row.dart';
import 'package:moniepoint_test/features/home/presentation/widgets/item_detail/product_detail_card.dart';
import 'package:moniepoint_test/features/home/presentation/widgets/item_detail/product_details_tab.dart';
import 'package:moniepoint_test/features/home/presentation/widgets/item_detail/recommendation_grid.dart';
import 'package:moniepoint_test/features/home/presentation/widgets/item_detail/review.dart';
import 'package:moniepoint_test/features/home/presentation/widgets/item_detail/review_and_ratings.dart';
import 'package:moniepoint_test/features/home/presentation/widgets/item_detail/review_with_media.dart';
import 'package:moniepoint_test/features/home/presentation/widgets/item_detail/seller_information.dart';
import 'package:moniepoint_test/features/home/presentation/widgets/item_detail/shipping_information.dart';
import 'package:moniepoint_test/features/home/presentation/widgets/item_detail/top_reviews.dart';

class ItemDetailPage extends StatefulWidget {
  const ItemDetailPage({
    super.key,
    required this.productItem,
  });
  final ProductItem productItem;
  @override
  State<ItemDetailPage> createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )
      ..forward()
      ..addStatusListener((status) {})
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        actions: [
          const Padding(
            padding: EdgeInsets.only(right: 18.0),
            child: Icon(
              Icons.favorite,
              color: AppColors.pink,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 18.0),
            child: Icon(Icons.share_outlined),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: SvgPicture.asset('assets/icons/bag.svg'),
          ),
        ],
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        switchInCurve: Curves.fastOutSlowIn,
        transitionBuilder: (child, anim) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 1),
              end: const Offset(0, 0),
            ).animate(anim),
            child: FadeTransition(
              opacity: Tween<double>(
                begin: 0,
                end: 1,
              ).animate(anim),
              child: SizeTransition(
                axisAlignment: -1,
                sizeFactor: Tween<double>(
                  begin: 0,
                  end: 1,
                ).animate(anim),
                child: child,
              ),
            ),
          );
        },
        child: _controller.status != AnimationStatus.completed
            ? SizedBox(
                height: height,
                width: width,
              )
            : Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ProductDetailsImage(item: widget.productItem),
                            ItemText(item: widget.productItem),
                            const SizedBox(height: 20),
                            ProductReview(item: widget.productItem),
                            const SizedBox(height: 20),
                            const AboutItemTab(),
                            const SizedBox(height: 15),
                            AboutItem(item: widget.productItem),
                            ItemFullDescription(item: widget.productItem),
                            ShippingInformation(item: widget.productItem),
                            const SellerInformation(),
                            const ReviewAndRatings(),
                            const ReviewWithMedia(),
                            const TopReviews(),
                            const PaginationRow(),
                            const RecommendationGrid()
                          ],
                        ),
                      ),
                    ),
                  ),
                  BuyNowWidget(item: widget.productItem),
                ],
              ),
      ),
    );
  }
}
