import 'utils/index.dart';

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
        BlocProvider(
            create: (_) => FirebaseAuthBloc()..add(CheckLoginStatusEvent())),
        BlocProvider(create: (_) => CategoriesBloc()..add(GetCategories())),
        BlocProvider(create: (_) => WishlistBloc()),
        BlocProvider(create: (_) => ProductDataBloc()),
        BlocProvider(create: (_) => ImageUploadBloc(FirebaseStorage.instance)),
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
