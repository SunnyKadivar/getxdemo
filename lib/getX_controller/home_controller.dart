import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxdemo/api_call.dart';
import 'package:getxdemo/demo_model.dart';

class DataController extends GetxController {
  var isLoading = true.obs;
  List<ModelDemo2> list = <ModelDemo2>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  fetchData() async {
    isLoading(true);
    await getAPI((value) {
      debugPrint(value.code.toString());
      if (value.code == 200) {
        List responseData = json.decode(value.response);
        list = responseData.map((model) => ModelDemo2.fromJson(model)).toList();
        isLoading(false);
      } else {
        isLoading(false);
      }
    });
  }
}
