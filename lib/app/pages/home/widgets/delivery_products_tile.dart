import 'package:dw9_delivery_app/app/core/extensions/formatter_extensions.dart';
import 'package:dw9_delivery_app/app/core/ui/styles/colors_app.dart';
import 'package:dw9_delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:dw9_delivery_app/app/models/product_model.dart';
import 'package:flutter/material.dart';

class DeliveryProductsTile extends StatelessWidget {
  final ProductModel product;

  const DeliveryProductsTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          '/productDetail',
          arguments:{
            'product': product,
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: context.textStyles.textExtraBold.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    product.name,
                    style: context.textStyles.textLight.copyWith(fontSize: 12),
                  ),
                  Text(
                    product.price.currencyPTBR,
                    style: context.textStyles.textMedium.copyWith(
                      fontSize: 11,
                      color: context.colors.secondary,
                    ),
                  ),
                ],
              ),
            ),
            FadeInImage.assetNetwork(
              placeholder: 'assets/images/loading.gif',
              image: product.image,
              width: 100,
              height: 100,
              fit: BoxFit.contain,
              imageErrorBuilder: (context, error, stackTrace) {
                return Icon(
                  Icons.error, // Ícone de erro
                  size: 50,
                  color: Colors.red,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
