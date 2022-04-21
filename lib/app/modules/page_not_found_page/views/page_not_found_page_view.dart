import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/page_not_found_page_controller.dart';

class PageNotFoundPageView extends GetView<PageNotFoundPageController> {
  const PageNotFoundPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PageNotFoundPageView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PageNotFoundPageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
