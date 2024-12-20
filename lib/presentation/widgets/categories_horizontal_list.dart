import 'package:stylish/utils/index.dart';


class CategoriesHorizontalList extends StatelessWidget {
  const CategoriesHorizontalList({super.key});

  @override
  Widget build(BuildContext context) {
   List<Widget> screens = const [
    MensScreen(),
    FootwareScreen(),
    WatchScreen(),
    BeautyScreen(),
    WomensScreen()
   ];
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesLoading) {
          return const Center(
              child: CircularProgressIndicator(
            color: AppColors.red,
          ));
        } else if (state is CategoriesLoaded) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.categories.length,
            itemBuilder: (context, index) {
              final List<CategoriesModel> category = state.categories;

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (_) => screens[index]));
                      },
                      child: CircleAvatar(
                        radius: ResponsiveHelper.getScreenWidth(context) * 0.075,
                        backgroundImage: NetworkImage(category[index].image),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      category[index].name,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        } else if (state is CategoriesError) {
          print(state.message);
          return Center(child: Text('Error: ${state.message}'));
        } else {
          return const Center(child: Text('No categories available.'));
        }
      },
    );
  }
}
