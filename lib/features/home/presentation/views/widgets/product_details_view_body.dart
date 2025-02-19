import 'package:flutter/material.dart';
import 'package:store_app/features/home/data/models/product_model/product_model.dart';
import 'package:store_app/features/home/presentation/views/widgets/custom_product.image.dart';

import 'custom_contain.dart';

class ProductDetailsViewBody extends StatefulWidget {
  const ProductDetailsViewBody({
    super.key,
    required this.product,
  });
  final ProductModel product;

  @override
  State<ProductDetailsViewBody> createState() => _ProductDetailsViewBodyState();
}

class _ProductDetailsViewBodyState extends State<ProductDetailsViewBody> {
  bool isShowMore = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      child: Column(
        children: [
          CustomProductImage(
            product: widget.product,
            heightt: 200,
            widthh: double.infinity,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            textAlign: TextAlign.center,
            widget.product.title,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          CustomContain(widget: widget),
          Text(
            widget.product.description,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            maxLines: isShowMore ? 3 : null,
            overflow: TextOverflow.fade,
          ),
          TextButton(
            onPressed: () {
              setState(() {
                isShowMore = !isShowMore;
              });
            },
            child: Text(
              isShowMore ? 'Show more' : 'Show less',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
