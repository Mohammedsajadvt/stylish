import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/blocs/bottom_navigation/bottom_nav_bar_bloc.dart';
import 'package:stylish/blocs/bottom_navigation/bottom_nav_bar_event.dart';
import 'package:stylish/blocs/bottom_navigation/bottom_nav_bar_state.dart';
import 'package:stylish/presentation/screens/cart_screen.dart';
import 'package:stylish/presentation/screens/home_screen.dart';
import 'package:stylish/presentation/screens/search_screen.dart';
import 'package:stylish/presentation/screens/settings_screen.dart';
import 'package:stylish/utils/constants.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    // Navigation items/icons
    List<Widget> navigationItems = const [
      Icon(Icons.home_outlined),
      Icon(CupertinoIcons.search),
      Icon(CupertinoIcons.cart),
      Icon(CupertinoIcons.person),
    ];

    // Screens for each navigation item
    List<Widget> screens = const [
      HomeScreen(),
      SearchScreen(),
      CartScreen(),
      ProfileScreen()
    ];

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
        builder: (context, state) {
          // Display the screen based on the current selected index
          return screens[state.selectedIndex];
        },
      ),
      bottomNavigationBar: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
        builder: (context, state) {
          return CurvedNavigationBar(
            onTap: (index) {
              // Dispatch event to change selected index in the BLoC
              context.read<BottomNavigationBloc>().add(
                    BottomNavigationIndexChanged(index),
                  );
            },
            color: AppColors.primary,
            buttonBackgroundColor: AppColors.red,
            backgroundColor: Colors.transparent,
            index: state.selectedIndex, // Highlight the selected index
            items: List.generate(navigationItems.length, (index) {
              return Icon(
                (navigationItems[index] as Icon).icon,
                color: state.selectedIndex == index ? Colors.white : AppColors.red,
              );
            }),
          );
        },
      ),
    );
  }
}
