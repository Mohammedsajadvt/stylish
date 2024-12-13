import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/blocs/products/product_data_bloc.dart';
import 'package:stylish/blocs/products/product_data_event.dart';
import 'package:stylish/blocs/products/product_data_state.dart';
import 'package:stylish/data/models/product_model.dart';
import 'package:stylish/utils/constants.dart';
import 'package:stylish/utils/helpers.dart';

class ProductCard extends StatelessWidget {
  final ProductDataEvent event;
  const ProductCard({
    super.key, required this.event,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>  ProductDataBloc()..add(event),
      child: SizedBox(
        height: ResponsiveHelper.getScreenHeight(context) * 0.3,
        child: BlocBuilder<ProductDataBloc, ProductDataState>(
          builder: (context, state) {
            if (state is ProductDataLoading) {
              return const CircularProgressIndicator(
                color: AppColors.red,
              );
            } else if (state is ProductDataLoaded) {
              final  productData = state.productData;
              return ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: productData.length,
                itemBuilder: (context, index) {
                  final product = productData[index];
                  return Padding(
                    padding: EdgeInsets.only(
                        right:
                            ResponsiveHelper.getScreenWidth(context) * 0.050),
                    child: Card(
                      elevation: 0,
                      child: Container(
                        width: 170,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(10),
                          
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [  
                          Image.network(product.image),
                        ],),
                      ),
                    ),
                  );
                },
              );
            } else if (state is ProductDataError) {
              print(state.message);
              return Center(child: Text('Error: ${state.message}'));
            } else {
              return const Center(child: Text('No product data available.'));
            }
          },
        ),
      ),
    );
  }
}
