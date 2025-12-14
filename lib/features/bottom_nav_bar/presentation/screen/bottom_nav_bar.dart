import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/constants/app_duration.dart';
import '../../../calender/presentation/screen/calender_view.dart';
import '../../../chat/presentation/screen/chat_view.dart';
import '../../../home/presentation/screens/home_view.dart';
import '../../../profile/presentation/screens/profile_view.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import '../widgets/search_floating_action_button.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  late final List<Widget> _views;

  @override
  void initState() {
    super.initState();
    _views = const [HomeView(), ChatView(), CalenderView(), ProfileView()];
  }

  Future<void> _handleNavigationTap(int index) async {
    if (index == _currentIndex) {
      return;
    }

    await HapticFeedback.lightImpact();

    setState(() {
      _currentIndex = index;
    });
  }

  Future<void> _handleSearchTap() async {
    await HapticFeedback.mediumImpact();

    // TODO: Implement search navigation or bottom sheet
    // Example: Navigator.of(context).pushNamed('/search');
    // or showModalBottomSheet(...);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: AnimatedSwitcher(
        duration: AppDurations.standard,
        switchInCurve: Curves.easeIn,
        switchOutCurve: Curves.easeOut,
        child: KeyedSubtree(
          key: ValueKey<int>(_currentIndex),
          child: _views[_currentIndex],
        ),
        transitionBuilder: (child, animation) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _handleNavigationTap,
      ),
      floatingActionButton: SearchFloatingActionButton(
        onPressed: _handleSearchTap,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.noAnimation,
    );
  }
}
