import 'package:fitbro/constants/colors.dart';
import 'package:fitbro/extensions/buildcontext/loc.dart';
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
        child: Icon(
          Icons.person,
          color: quaternaryColor,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
              (Set<MaterialState> states) =>
                  states.contains(MaterialState.selected)
                      ? TextStyle(
                          color: secondaryColor, fontWeight: FontWeight.w900)
                      : TextStyle(
                          color: secondaryColor, fontWeight: FontWeight.w900)
              //: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
        ),
        child: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          backgroundColor: mainColor2,
          indicatorColor: secondaryColor,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
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
              selectedIcon: const Icon(
                Icons.restaurant_outlined,
                color: Colors.white,
              ),
              icon: const Icon(Icons.restaurant),
              label: context.loc.diet,
            ),
          ],
        ),
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
