import 'package:fitbro/constants/colors.dart';
import 'package:fitbro/extensions/buildcontext/loc.dart';
import 'package:fitbro/extensions/buildcontext/navbar_settings.dart';
import 'package:fitbro/views/view_exports.dart';
import 'package:flutter/material.dart';

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp(
      {context, //context}
      super.key});

  @override
  Widget build(BuildContext context) {
    return const MainNavBar();
  }
}

class MainNavBar extends StatefulWidget {
  const MainNavBar({super.key});
  @override
  State<MainNavBar> createState() => _MainNavBarState();
}

class _MainNavBarState extends State<MainNavBar> {
  int currentPageIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            currentPageIndex = 1;
          });
        },
        child: const Icon(Icons.person),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: mainColor,
        selectedIndex: currentPageIndex,
        destinations: <Widget>[
          NavigationDestination(
            selectedIcon: const Icon(
              Icons.fitness_center,
              color: Colors.white,
            ),
            icon: const Icon(Icons.fitness_center_outlined),
            label: context.loc.training,
          ),
          const Column(),
          NavigationDestination(
            selectedIcon: const Icon(Icons.restaurant_outlined),
            icon: const Icon(Icons.restaurant),
            label: context.loc.diet,
          ),
        ],
      ),
      body: <Widget>[
        /// Exercise view
        const ExerciseView(),

        /// Overview view
        const OverviewView(),

        /// Diet view
        const DietView(),
      ][currentPageIndex],
    );
  }
}
