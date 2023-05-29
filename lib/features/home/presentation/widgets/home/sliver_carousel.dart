import 'package:flutter/material.dart';
import 'package:moniepoint_test/%20core/utils/colors.dart';
import 'package:moniepoint_test/%20core/utils/extensions/text_extension.dart';
import 'package:moniepoint_test/features/home/domain/cloth_image_model.dart';

class HomeCarouselSlider extends StatefulWidget {
  const HomeCarouselSlider({super.key});

  @override
  State<HomeCarouselSlider> createState() => _HomeCarouselSliderState();
}

class _HomeCarouselSliderState extends State<HomeCarouselSlider>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  late AnimationController _animationController;
  int page = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..addStatusListener((status) {
        _animateCurrentPage(status);
      });
    _forwardAnimation();
  }

  void _animateCurrentPage(AnimationStatus status) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (status == AnimationStatus.completed) {
        if (page == (_items.length - 1)) {
          page = 0;
        } else {
          page += 1;
        }
        if (page == 0) {
          _pageController.jumpTo(
            0,
          );
        } else {
          _pageController.animateToPage(
            page,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInSine,
          );
        }
        _resetAnimation();
      }
    });
  }

  void _forwardAnimation() {
    _animationController.forward();
  }

  void _resetAnimation() {
    _animationController
      ..reset()
      ..forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  final List<ClothImage> _items = [
    ClothImage(
      imageUrl: 'assets/images/image1.jpg',
    ),
    ClothImage(
      imageUrl: 'assets/images/image2.jpg',
    ),
    ClothImage(
      imageUrl: 'assets/images/image3.jpg',
    ),
  ];

  void _changePage(int value) => setState(() {
        page = value;
        _resetAnimation();
      });
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            width: MediaQuery.of(context).size.width,
            child: PageView.builder(
              onPageChanged: _changePage,
              controller: _pageController,
              itemCount: _items.length,
              itemBuilder: (context, index) {
                final item = _items[index];

                return Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Image.asset(
                        item.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.2,
                      right: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          _items.length,
                          (index) => AnimatedContainer(
                            curve: Curves.linearToEaseOut,
                            margin: const EdgeInsets.all(2),
                            duration: const Duration(
                              milliseconds: 500,
                            ),
                            height: 3,
                            width: index == page ? 10 : 3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: index == page
                                  ? AppColors.deepGrey
                                  : AppColors.greyLight,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 20,
                      child: MaterialButton(
                        color: AppColors.deepGrey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'Check this out',
                          style: Theme.of(context)
                              .textTheme
                              .titleText
                              .copyWith(color: AppColors.white),
                        ),
                        onPressed: () {},
                      ),
                    )
                  ],
                );
              },
            ),
          );
        });
  }
}
