import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openfoodfacts/blocs/ProductBloc.dart';
import 'package:openfoodfacts/res/app_images.dart';
import 'package:openfoodfacts/states/Product.state.dart';
import 'package:openfoodfacts/widgets/ProductDetails.widget.dart';

class DetailsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (BuildContext context, ProductState state) {
        if (state is ResultProductState) {
          return Stack(
            children: <Widget>[
              ImageWidget(picture: state.product.picture),
              Padding(
                padding: const EdgeInsets.only(top: 260.0),
                child: ProductDetailsWidget(product: state.product),
              ),
            ],
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

class ImageWidget extends StatelessWidget {
  final String? picture;

  const ImageWidget({required this.picture});

  @override
  Widget build(BuildContext context) {
    if (picture != null) {
      return Image.network(picture!);
    } else {
      return Image.asset(AppImages.pancakes);
    }
  }
}
