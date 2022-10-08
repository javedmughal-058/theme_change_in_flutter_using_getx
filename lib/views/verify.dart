import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grid_view_builder_in_flutter/Controllers/Controller.dart';

class verifiedPage extends StatelessWidget {
  const verifiedPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final textValue = Get.arguments.toString();
    return Scaffold(
      appBar: AppBar(title: Text(textValue),),
    );
  }
}
