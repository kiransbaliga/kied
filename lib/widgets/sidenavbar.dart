import 'package:flutter/material.dart';
import 'package:side_navigation/side_navigation.dart';

SideNavigationBar sidenavbar() {
  int idx = 0;
  return SideNavigationBar(
    header: const SideNavigationBarHeader(
        image: Image(
          width: 80,
          image: AssetImage('assets/images/invoice.png'),
        ),
        title: Text('headerr title'),
        subtitle: Text('')),
    footer: const SideNavigationBarFooter(
      label: Text('by Devs On Coffee'),
    ),
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
