import 'package:flutter/material.dart';
import 'package:moniepoint_test/%20core/utils/colors.dart';
import 'package:moniepoint_test/features/home/domain/product_item.dart';

class ProductDetailsImage extends StatefulWidget {
  final ProductItem item;
  const ProductDetailsImage({super.key, required this.item});

  @override
  State<ProductDetailsImage> createState() => _ProductDetailsImageState();
}

class _ProductDetailsImageState extends State<ProductDetailsImage>
    with SingleTickerProviderStateMixin {
  String selectedPicture = '';
  int selectedIndex = 0;

  late AnimationController _imageAnimationController;
  late Animation<double> _imageAnimation;

  @override
  void initState() {
    super.initState();
    _imageAnimationController = AnimationController(
      value: 1,
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _imageAnimation =
        Tween<double>(begin: 0, end: 1).animate(_imageAnimationController);
    selectedPicture = widget.item.imagesUrls.first;
  }

  void _forward() {
    _imageAnimationController
      ..reset()
      ..forward();
  }

  @override
  void dispose() {
    _imageAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        AnimatedBuilder(
            animation: _imageAnimationController,
            builder: (context, child) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.45,
                    child: FadeTransition(
                      opacity: _imageAnimation,
                      child: ScaleTransition(
                        scale: _imageAnimation,
                        child: Image.asset(
                          selectedPicture,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )),
              );
            }),
        Column(
          children: List.generate(
            widget.item.imagesUrls.length,
            (index) => InkWell(
              onTap: () {
                selectedIndex = index;
                selectedPicture = widget.item.imagesUrls[index];
                _forward();
                setState(() {});
              },
              child: Container(
                height: height * 0.07,
                width: height * 0.07,
                margin: const EdgeInsets.only(top: 10, left: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.2),
                      offset: const Offset(0, 5),
                    )
                  ],
                  border: Border.all(
                    color: selectedIndex == index
                        ? AppColors.greyLight
                        : Colors.transparent,
                    width: 1,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    widget.item.imagesUrls[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
