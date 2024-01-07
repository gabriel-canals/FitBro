import 'dart:math';

import 'package:fitbro/constants/colors.dart';
import 'package:fitbro/constants/routes.dart';
import 'package:fitbro/extensions/buildcontext/loc.dart';
import 'package:flutter/material.dart';

class OverviewView extends StatefulWidget {
  const OverviewView({super.key});

  @override
  State<OverviewView> createState() => _OverviewViewState();
}

class _OverviewViewState extends State<OverviewView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.overview),
        actions: [
          IconButton(
              onPressed: () async {
               Navigator.of(context).pushNamed(configRoute);
              },
              icon: const Icon(Icons.settings)),
        ],
      ),
      body: const NavigationBarApp(
      ),
    );
  }
}

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const MainNavBar(),
    );
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
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.person),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: NavigationBar(
        indicatorShape: const CircleBorder(),
        height: 55,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: mainColor,
        selectedIndex: currentPageIndex,
        //!ERROR: Localizations are not supported for this class
        destinations: <Widget>[
          const NavigationDestination(
            selectedIcon: Icon(Icons.fitness_center),
            icon: Icon(Icons.fitness_center_outlined),
            label: 'Entrenamiento',
          ),
           NavigationDestination(
            selectedIcon: const Icon(Icons.restaurant_outlined),
            icon: const Icon(Icons.restaurant),
            label: "Alimenación",
          ),
        ],
      ),
      body: <Widget>[
        
        /// Entrenamiento
        Card(
          shadowColor: Colors.transparent,
          margin: const EdgeInsets.all(6.0),
          child: SizedBox.expand(
            child: Center(
              child: Text(
                'Entrenamiento',
                style: theme.textTheme.titleLarge,
              ),
            ),
          ),
        ),

        /// Overview page
        const Padding(
          padding: EdgeInsets.all(6.0),
          child: Text('Overview'),
        ),

        /// Dietas
        const Padding(
          padding: EdgeInsets.all(6.0),
          child: Placeholder()
        ),
      ][currentPageIndex],
    );
  }
}
