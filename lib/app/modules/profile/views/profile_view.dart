
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_cart/app/widgets/responsive_text_widget.dart';


import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
        SizeConfig.init(context);
          final double screenHeight = MediaQuery.of(context).size.height;
    print('PorfileView');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        toolbarHeight: SizeConfig.getBottomNavHeight(56), 
        centerTitle: true,
        title: Text('Profile',style: TextStyle(fontSize: SizeConfig.getScaledFontSize(16)),),
      
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        
        children: [
          AutoSizeText(
  'The text to display',
  style: TextStyle(fontSize: 14),
  maxLines: 2,
),
              Text('Hello World',style: TextStyle(fontSize: SizeConfig.getScaledFontSize(22)),),
         
          Container(height: MediaQuery.of(context).size.height * 0.5, width: double.infinity, color: Colors.blue,child:     Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
               // 20% of the screen height
              color: Colors.red,
              child: Center(child: Text('Container 1',style: TextStyle(fontSize: SizeConfig.getScaledFontSize(22)))),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
               // 20% of the screen height
              color: Colors.green,
              child: Center(child: Text('Container 2',style: TextStyle(fontSize: SizeConfig.getScaledFontSize(12)))),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              
              color: Colors.grey,
              child: Center(child: Text('Container 3',style: TextStyle(fontSize: SizeConfig.getScaledFontSize(12)))),
            ),
          ),
        ],
      ),
                   ),
                 Container(height: MediaQuery.of(context).size.height * 0.5, width: double.infinity, color: Colors.cyan,child:    Text('Hello World',style: TextStyle(fontSize: SizeConfig.getScaledFontSize(8)),),
                   ), 
                       Text('Hello World',style: TextStyle(fontSize: SizeConfig.getScaledFontSize(12)),),
                  
         
        ],
      )
    );
  }
}

