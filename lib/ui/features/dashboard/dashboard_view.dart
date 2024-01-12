import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:wat_mobile/ui/common/app_colors.dart';
import 'package:wat_mobile/ui/features/product/presentation/view/product_list_view.dart';

import '../profile/profile_view.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int _page = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: PageTransitionSwitcher(
            child: switch (_page) {
              0 => const ProductListView(),
              1 => const ProfileView(),
              int() => const SizedBox.shrink(),
            },
            transitionBuilder: (child, primary, secondary) =>
                SharedAxisTransition(
                  animation: primary,
                  secondaryAnimation: secondary,
                  transitionType: SharedAxisTransitionType.horizontal,
                  fillColor: Colors.transparent,
                  child: child,
                )),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(color: Colors.black.withOpacity(.30), blurRadius: 10),
            ],
          ),
          child: BottomNavigationBar(
              elevation: 5,
              enableFeedback: true,
              currentIndex: _page,
              onTap: (value) => setState(() => _page = value),
              selectedItemColor: AppColors.darkScaffold,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle), label: 'Profile'),
              ]),
        ),
      );
}
