import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/blocs/auth/firebase_auth_bloc_bloc.dart';
import 'package:stylish/blocs/bottom_navigation/bottom_nav_bar_bloc.dart';
import 'package:stylish/blocs/carousel_slider/carousel_bloc.dart';
import 'package:stylish/blocs/categories/categories_bloc.dart';
import 'package:stylish/blocs/categories/categories_event.dart';
import 'package:stylish/blocs/visible_icon/visibility_bloc_bloc.dart';
import 'package:stylish/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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
        BlocProvider(create: (_) => BottomNavigationBloc()),
        BlocProvider(create: (_) => CarouselBloc()),
        BlocProvider(create: (_) => FirebaseAuthBloc()..add(CheckLoginStatusEvent())),
        BlocProvider(create: (_) => CategoriesBloc()..add(GetCategories())),


      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        initialRoute: AppRoutes.splashscreen,
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    );
  }
}
