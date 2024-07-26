import 'package:flutter/material.dart';
import 'package:pingolearn/extension/extention%20function.dart';
import 'package:pingolearn/res/AppColors.dart';
import 'package:pingolearn/res/text_style.dart';
import 'package:pingolearn/utils/widget_util.dart';
import 'package:pingolearn/widgets/cached_image_widget.dart';
import 'package:provider/provider.dart';
import 'package:pingolearn/providers/product_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('e-shop', style: AppTextStyles.style16px.w600.withColor(AppColors.white)),
        backgroundColor: AppColors.colorPrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
        child: Consumer<ProductProvider>(
          builder: (context, provider, child) {
            final products = provider.getAllProductInfo?.products;
            return ListView(
              children: [
                Container(
                  height: 700,
                  child: GridView.builder(
                    padding: const EdgeInsets.only(top: 20),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 0.55,
                    ),
                    itemCount: products?.length ?? 0,
                    itemBuilder: (context, index) {
                      final product = products?[index];
                      return Container(
                        decoration: BoxDecoration(color: AppColors.white, borderRadius: const BorderRadius.all(Radius.circular(10))),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CachedImageWidget(radius: 8, imageUrl: product?.thumbnail, fit: BoxFit.fill),
                              verticalSpace(10),
                              Text(product?.title ?? '', style: AppTextStyles.style16px.w600.withColor(AppColors.black), maxLines: 1, overflow: TextOverflow.ellipsis),
                              verticalSpace(10),
                              Text(product?.description ?? '', style: AppTextStyles.style14px.w500.withColor(AppColors.black), maxLines: 3, overflow: TextOverflow.ellipsis),
                              verticalSpace(10),
                              DiscountWidget(
                                  showDiscountedPrice: provider.showDiscountedPrice,
                                  originalPrice: product?.price ?? 0,
                                  discountedPrice: provider.calculateDiscountedPrice(product?.price ?? 0, product?.discountPercentage ?? 0),
                                  discountPercentage: product?.discountPercentage ?? 0),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class DiscountWidget extends StatelessWidget {
  final bool showDiscountedPrice;
  final num originalPrice;
  final num discountedPrice;
  final num discountPercentage;

  const DiscountWidget({
    Key? key,
    required this.showDiscountedPrice,
    required this.originalPrice,
    required this.discountedPrice,
    required this.discountPercentage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('\$$originalPrice',
            style: TextStyle(
                fontSize: 10, fontFamily: 'Poppins', color: showDiscountedPrice ? AppColors.discountTextColor : AppColors.black, decoration: showDiscountedPrice ? TextDecoration.lineThrough : null)),
        horizontalSpace(5),
        if (showDiscountedPrice) Text('\$$discountedPrice', style: AppTextStyles.style10px.w500.withColor(AppColors.black)),
        horizontalSpace(5),
        if (showDiscountedPrice) Text('$discountPercentage% off', style: AppTextStyles.style10px.w500.withColor(Colors.green)),
      ],
    );
  }
}
