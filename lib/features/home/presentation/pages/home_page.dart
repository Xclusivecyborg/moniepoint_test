import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moniepoint_test/features/home/presentation/widgets/home/home_sliver.dart';
import 'package:moniepoint_test/features/home/presentation/widgets/home/sales_grid_view.dart';
import 'package:moniepoint_test/presentation/general_widgets/home_bottom_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        bottomNavigationBar: const BottomNavBar(),
        body: const CustomScrollView(
          slivers: [
            HomeSliverAppBar(),
            SliverToBoxAdapter(child: ProductGridView()),
          ],
        ),
      ),
    );
  }
}
