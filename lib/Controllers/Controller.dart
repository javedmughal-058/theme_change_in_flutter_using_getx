import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grid_view_builder_in_flutter/menu_model.dart';

class Controller extends GetxController{


  late Controller menuListController;
  var Gridindex = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    menuListController = Controller();

  }

  final menuList = [
    MenuModel(title: 'About us', color: Colors.amber, route: '/About', icon: Icons.info,  ),
    MenuModel(title: 'Setting', color: Colors.amber, route: '/Setting', icon: Icons.settings,),
    MenuModel(title: 'Search', color: Colors.amber, route: '/search', icon: Icons.search,  ),
    MenuModel(title: 'Details', color: Colors.amber, route: '/detail', icon: Icons.details,  ),
    MenuModel(title: 'Verification', color: Colors.amber, route: '/verified', icon: Icons.verified,  ),
    MenuModel(title: 'Contact us', color: Colors.amber, route: '/contact', icon: Icons.call,  ),
  ];

}