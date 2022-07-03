import 'package:flutter/material.dart';
import 'package:side_navigation/side_navigation.dart';

SideNavigationBar sidenavbar() {
  int idx = 0;
  return SideNavigationBar(
    selectedIndex: idx,
    items: const [
      SideNavigationBarItem(
        icon: Icons.home,
        label: 'home',
      ),
      SideNavigationBarItem(
        icon: Icons.person,
        label: 'profile',
      ),
      SideNavigationBarItem(icon: Icons.settings, label: 'settings'),
    ],
    onTap: (int value) {
      print(value);
      idx = value;
    },
    theme: SideNavigationBarTheme(
      backgroundColor: Color.fromARGB(123, 224, 224, 254),
      togglerTheme: SideNavigationBarTogglerTheme.standard(),
      itemTheme: SideNavigationBarItemTheme.standard(),
      dividerTheme: SideNavigationBarDividerTheme.standard(),
    ),
    toggler: SideBarToggler(onToggle: () {
      print('toggle');
    }),
  );
}
