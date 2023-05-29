import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:moniepoint_test/%20core/utils/colors.dart';
import 'package:moniepoint_test/features/home/domain/bottom_bar_iten.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;
  final Color _inactiveColor = Colors.black;
  final Color _activeColor = AppColors.primaryColor;

  final List<BottomBarItem> _items = [
    BottomBarItem(title: 'Home', icon: 'assets/icons/home.svg'),
    BottomBarItem(title: 'Voucher', icon: 'assets/icons/voucher.svg'),
    BottomBarItem(title: 'Wallet', icon: 'assets/icons/wallet.svg'),
    BottomBarItem(title: 'Settings', icon: 'assets/icons/settings.svg'),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
      currentIndex: _currentIndex,
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
        });
      },
      items: List.generate(
        _items.length,
        (index) => BottomNavigationBarItem(
          icon: SvgPicture.asset(
            _items[index].icon,
            colorFilter: ColorFilter.mode(
                _currentIndex == index ? _activeColor : _inactiveColor,
                BlendMode.srcIn),
          ),
          label: _items[index].title,
        ),
      ),
      selectedItemColor: _activeColor,
      unselectedItemColor: _inactiveColor,
    );
  }
}
