import 'package:flutter/cupertino.dart';
import 'package:stylish/utils/index.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> navigationItems = const [
      Icon(Icons.home_outlined),
      Icon(CupertinoIcons.heart),
      Icon(CupertinoIcons.person),
    ];

    List<Widget> screens = const [
      HomeScreen(),
      WishlistScreen(),
      ProfileScreen()
    ];

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
        builder: (context, state) {
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
