import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/blocs/bottom_navigation/bottom_nav_bar_bloc.dart';
import 'package:stylish/blocs/visible_icon/visibility_bloc_bloc.dart';
import 'package:stylish/presentation/screens/bottom_nav_bar.dart';
import 'package:stylish/presentation/screens/getstarted_screen.dart';
import 'package:stylish/presentation/screens/splash_screen.dart';
import 'package:stylish/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => VisibilityBloc()),
        BlocProvider(create: (_) => BottomNavigationBloc())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
       // initialRoute: AppRoutes.splashscreen,
       // onGenerateRoute: AppRoutes.generateRoute,
       home: BottomNavBar(),
      ),
    );
  }
}
