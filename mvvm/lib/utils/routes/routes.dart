import 'package:flutter/material.dart';

class Routes {
  static Routes intance = Routes();
  Future<void> push(BuildContext context, Widget widget) async {
    await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }
}
