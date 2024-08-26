import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shop_cart/app/models/product_model.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.products.isEmpty) {
          return Center(child: Text('No products found.'));
        } else {
          return ListView.builder(
            itemCount: controller.products.length,
            itemBuilder: (context, index) {
              ProductModel product = controller.products[index];
              return ProductItem(product: product);
            },
          );
        }
      }),
    );
  }
}

class ProductItem extends StatefulWidget {
  final ProductModel product;

  ProductItem({required this.product});

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        Container(
          height: 200.0,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              controller.updatePage(index);
            },
            itemCount: widget.product.images!.length,
            itemBuilder: (context, index) {
              return Image.network(widget.product.images![index],
                  fit: BoxFit.cover);
            },
          ),
        ),
        SizedBox(height: 8.0),
        Obx(() {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.product.images!.length, (index) {
              return AnimatedContainer(
                duration: Duration(milliseconds: 300),
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                height: 8.0,
                width: controller.currentPage.value == index ? 12.0 : 8.0,
                decoration: BoxDecoration(
                  color: controller.currentPage.value == index
                      ? Colors.blue
                      : Colors.grey,
                  borderRadius: BorderRadius.circular(4.0),
                ),
              );
            }),
          );
        }),
        SizedBox(height: 16.0),
        Text(widget.product.title ?? ''),
        Text('\$${widget.product.price}'),
      ],
    );
  }
}
