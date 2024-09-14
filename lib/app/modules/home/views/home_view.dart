import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_cart/app/models/product_model.dart';
import 'package:shop_cart/app/widgets/responsive_text_widget.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {

    print('HomeView');
    final controller = Get.put(HomeController());
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.red,
        toolbarHeight: SizeConfig.getBottomNavHeight(56), 
        centerTitle: true,
        title: Text('Product List',style: TextStyle(fontSize: SizeConfig.getScaledFontSize(16)),),
      
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

    final controller = Get.put(HomeController());


  @override
  Widget build(BuildContext context) {

    SizeConfig.init(context);

    print('ProductItem');
     final screenWidth = MediaQuery.of(context).size.width;
    final scaleFactor = screenWidth / 360; // Adjust as needed based on your design

    final fontSize = 8 * scaleFactor;
  
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
        
          Column(
            children: [
              AspectRatio(
                aspectRatio: 16/9,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    controller.updatePage(index);
                  },
                  itemCount: widget.product.images!.length,
                  itemBuilder: (context, index) {
          
                  return CachedNetworkImage(
                  imageUrl: widget.product.images![index],
                  placeholder: (context, url) => Center(
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: CircularProgressIndicator()),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  fadeInDuration: Duration(milliseconds: 500),
                  fadeOutDuration: Duration(milliseconds: 500),
                  fit: BoxFit.cover,
                );
          
                    
                    // return Image.network(widget.product.images![index],
                    //     fit: BoxFit.cover);
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
              Text(widget.product.title ?? '',style: TextStyle(fontSize: SizeConfig.getScaledFontSize(14)),),
              Text('\$${widget.product.id}',style: TextStyle(fontSize: SizeConfig.getScaledFontSize(14))),
           
            ],
          ),
           Positioned(
          
            top: 2,
            right: 2,
            child:  Obx(() => IconButton(
            icon: Icon(
          controller.getProductId.contains(widget.product.id.toString()) ? Icons.favorite : Icons.favorite_border,
          color: controller.getProductId.contains(widget.product.id.toString()) ? Colors.red : Colors.black,
            ),
            onPressed: () async {
          
             
          if (controller.getProductId.contains(widget.product.id.toString())) {
            await controller.removeProductId(widget.product.id.toString());
            if(controller.getProductId.contains(widget.product.id.toString())){
              controller.getProductId.remove(widget.product.id.toString());
            }
          } else {
            await controller.saveProductId(widget.product.id.toString());
             controller.getProductId.add(widget.product.id.toString());
          }
            
           print('SaveId: ${controller.getProductId}');
            },
          )),),
        ],
      ),
    );
  }
}
