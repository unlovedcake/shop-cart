import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_cart/app/models/product_model.dart';

import '../controllers/cart_controller.dart';


class CartView extends GetView<CartController> {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
        actions: [
          IconButton(
            icon: Icon(Icons.location_pin),
            onPressed: () {},
          ),
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '92 High Street, London',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search bar
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search the entire shop',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              SizedBox(height: 20),

              // Delivery info
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Text(
                      'Delivery is',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(width: 5),
                    Text(
                      '50%',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      'cheaper',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Categories
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('See all'),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CategoryCard(icon: Icons.phone, label: 'Phones'),
                    CategoryCard(icon: Icons.videogame_asset, label: 'Consoles'),
                    CategoryCard(icon: Icons.laptop, label: 'Laptops'),
                    CategoryCard(icon: Icons.camera, label: 'Cameras'),
                    // Add more categories as needed
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Flash Sale
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Flash Sale',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('See all'),
                  ),
                ],
              ),
              SizedBox(height: 10),
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  FlashSaleCard(
                    imageUrl: 'https://example.com/iphone.png',
                    name: 'Apple iPhone 15 Pro 128GB',
                    oldPrice: '£739.00',
                    newPrice: '£699.00',
                  ),
                  FlashSaleCard(
                    imageUrl: 'https://example.com/buds.png',
                    name: 'Samsung Galaxy Buds Pro',
                    oldPrice: '£89.00',
                    newPrice: '£69.00',
                  ),
                  // Add more items as needed
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final IconData icon;
  final String label;

  const CategoryCard({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 30),
          SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class FlashSaleCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String oldPrice;
  final String newPrice;

  const FlashSaleCard({
    required this.imageUrl,
    required this.name,
    required this.oldPrice,
    required this.newPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(imageUrl),
          ),
          SizedBox(height: 10),
          Text(
            name,
            style: TextStyle(fontSize: 14),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Text(
                newPrice,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 10),
              Text(
                oldPrice,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

