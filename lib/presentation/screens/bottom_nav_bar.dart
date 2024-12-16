import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/blocs/bottom_navigation/bottom_nav_bar_bloc.dart';
import 'package:stylish/blocs/bottom_navigation/bottom_nav_bar_event.dart';
import 'package:stylish/blocs/bottom_navigation/bottom_nav_bar_state.dart';
import 'package:stylish/presentation/screens/cart_screen.dart';
import 'package:stylish/presentation/screens/home_screen.dart';
import 'package:stylish/presentation/screens/wishlist_screen.dart';
import 'package:stylish/presentation/screens/profile_screen.dart';
import 'package:stylish/utils/constants.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    // Navigation items/icons
    List<Widget> navigationItems = const [
      Icon(Icons.home_outlined),
      Icon(CupertinoIcons.heart),
      Icon(CupertinoIcons.cart),
      Icon(CupertinoIcons.person),
    ];

    // Screens for each navigation item
    List<Widget> screens = const [
      HomeScreen(),
      WishlistScreen(),
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
              context.read<BottomNavigationBloc>().add(
                    BottomNavigationIndexChanged(index),
                  );
            },
            color: AppColors.red,
            buttonBackgroundColor: AppColors.red,
            backgroundColor: Colors.transparent,
            index: state.selectedIndex, 
            items: List.generate(navigationItems.length, (index) {
              return Icon(
                (navigationItems[index] as Icon).icon,
                color:  Colors.white,
              );
            }),
          );
        },
      ),
    );
  }
}
