import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gestion_diabete/info_diab/navigation_controller.dart';
import 'package:gestion_diabete/info_diab/webview_stack.dart';
import 'package:webview_flutter/webview_flutter.dart';

/*
import '../../widgets/menu.dart';
import '../../widgets/navigation_controller.dart';
import '../../widgets/webview_stack.dart';
*/

class EdenNews extends StatefulWidget {
  const EdenNews({Key? key}) : super(key: key);

  @override
  State<EdenNews> createState() => _EdenNewsState();
}

class _EdenNewsState extends State<EdenNews> {
  var loadingPercentage = 0;

  @override
  Widget build(BuildContext context) {
    final controller = Completer<WebViewController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Diabète Info'),
        backgroundColor:  Color(0xFF216DAD),
        actions: [
          NavigationControls(controller: controller),
          //Menu(controller: controller),
        ],
      ),
      body: WebViewStack(controller: controller),
    );
  }
}