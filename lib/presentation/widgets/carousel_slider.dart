import 'package:stylish/utils/index.dart';

class CustomCarouselSlider extends StatelessWidget {
  final List<String> images;

  final PageController _pageController = PageController();

  CustomCarouselSlider({
    required this.images,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            controller: _pageController,
            itemCount: images.length,
            onPageChanged: (index) {
              context.read<CarouselBloc>().add(CarouselPageChanged(index));
            },
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        images[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(
                        ResponsiveHelper.getScreenHeight(context) * 0.040),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '50-40% OFF',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                              fontSize:
                                  ResponsiveHelper.getScreenHeight(context) *
                                      0.026),
                        ),
                        const Text(
                          'Now in (product)\nAll colours',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary),
                        ),
                        SizedBox(
                          height:
                              ResponsiveHelper.getScreenHeight(context) * 0.010,
                        ),
                        GestureDetector(
                          onTap: () {
                            print('Working');
                          },
                          child: Container(
                            width: ResponsiveHelper.getScreenHeight(context) *
                                0.150,
                            height: ResponsiveHelper.getScreenHeight(context) *
                                0.040,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppColors.pink,
                                border: Border.all(color: AppColors.primary)),
                            child: Center(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Shop Now',
                                  style: TextStyle(
                                      fontSize:
                                          ResponsiveHelper.getScreenHeight(
                                                  context) *
                                              0.022,
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Icon(
                                  Icons.arrow_forward,
                                  color: AppColors.primary,
                                )
                              ],
                            )),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        SizedBox(height: ResponsiveHelper.getScreenHeight(context) * 0.022),
        BlocBuilder<CarouselBloc, CarouselState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                images.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  height: state.currentIndex == index ? 8.0 : 8.0,
                  width: state.currentIndex == index ? 8.0 : 8.0,
                  decoration: BoxDecoration(
                    color: state.currentIndex == index
                        ? AppColors.pink
                        : Colors.grey,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}