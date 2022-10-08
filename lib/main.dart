import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grid_view_builder_in_flutter/Controllers/Controller.dart';
import 'package:grid_view_builder_in_flutter/views/about.dart';
import 'package:grid_view_builder_in_flutter/views/contact.dart';
import 'package:grid_view_builder_in_flutter/views/detail.dart';
import 'package:grid_view_builder_in_flutter/views/search.dart';
import 'package:grid_view_builder_in_flutter/views/setting.dart';
import 'package:grid_view_builder_in_flutter/views/verify.dart';

import 'menu_model.dart';


void main() {
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

      ),
      home: const MyHomePage(),
      routes: {
        "/About" : (context) =>const AboutPage(),
        "/Setting" : (context) => const SettingPage(),
        "/search" : (context) => const searchPage(),
        "/detail" : (context) => const detailPage(),
        "/verified" : (context) => const verifiedPage(),
        "/contact" : (context) => const contactPage(),
      }
    );
  }
}
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _menuListController = Get.put(Controller());
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView builder'),
        actions: [IconButton(onPressed: (){
          Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
        }, icon:const Icon(Icons.change_circle))],
      ),
      body: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.0,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,),
          padding: const EdgeInsets.all(10),
          itemCount: _menuListController.menuList.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index){
           _menuListController.Gridindex.value =index;
           final menu = _menuListController.menuList[index];
        return GestureDetector(
          onTap: (){
            Navigator.of(context).pushNamed(menu.route, arguments: menu.title);
          },
          child: Container(
            height: size.height*0.2,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Theme.of(context).primaryColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white,width: 1),
                        shape: BoxShape.circle
                    ),
                    child: Icon(menu.icon,color: Colors.white,size: 20,)
                ),
                const SizedBox(height: 5,),
                Text(menu.title,
                    style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 12.0
                    )),
              ],
            ),
          ),
        );

          }),
    );
  }
}

