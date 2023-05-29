import 'package:flutter/material.dart';
import 'package:moniepoint_test/features/home/data/home_repository.dart';
import 'package:moniepoint_test/features/home/presentation/pages/item_detail_page.dart';
import 'package:moniepoint_test/features/home/presentation/widgets/home/item_card.dart';

class ProductGridView extends StatefulWidget {
  const ProductGridView({
    super.key,
    this.padding,
  });
  final EdgeInsets? padding;
  @override
  State<ProductGridView> createState() => _ProductGridViewState();
}

class _ProductGridViewState extends State<ProductGridView> {
  final _repository = HomeRepository();

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: widget.padding ??
          const EdgeInsets.only(left: 20, right: 20, bottom: 3),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 0.8,
      crossAxisCount: 2,
      crossAxisSpacing: 20,
      mainAxisSpacing: 1.5,
      children: List.generate(
        [..._repository.productItems, ..._repository.productItems].length,
        (index) => ItemCardDisplay(
          index: index,
          onTap: () => Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 400),
              pageBuilder: (context, animation, secondaryAnimation) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 1),
                    end: const Offset(0, 0),
                  ).animate(animation),
                  child: FadeTransition(
              
                    opacity: Tween<double>(
                      begin: 0,
                      end: 1,
                    ).animate(animation),
                    child: ItemDetailPage(
                      productItem: [
                        ..._repository.productItems,
                        ..._repository.productItems
                      ][index],
                    ),
                  ),
                );
              },
            ),
          ),
          data: [
            ..._repository.productItems,
            ..._repository.productItems
          ][index],
        ),
      ),
    );
  }
}
